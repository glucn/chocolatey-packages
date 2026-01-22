$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-553.0.0-windows-x86_64.zip'
$checksum64 = '5e3c0e08aaed980d8d5d5bc01bbd4fc13b6cef85977a16592f0821e853a3037a'

$url32 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-553.0.0-windows-x86.zip'
$checksum32 = 'ab2d2130a42dc7ea4085a45b717cad8a7f4b0d49ddc2ced5efea4e3fb0698554'

# The following implementation is a workaround for the issue with symlinks in the package
# Please refer to this issue for more details: https://github.com/glucn/chocolatey-packages/issues/3


$packageName = $env:ChocolateyPackageName
$destination = $toolsDir
$url = $url32
$url64bit = $url64
$checksum = $checksum32
$checksumType = 'sha256'
$checksum64 = $checksum64
$checksumType64 = 'sha256'

# Download the zip file
# Ref: https://github.com/chocolatey/choco/blob/master/src/chocolatey.resources/helpers/functions/Install-ChocolateyZipPackage.ps1

$fileType = 'zip'
$chocoTempDir = $env:TEMP
$tempDir = Join-Path $chocoTempDir "$($packageName)"
if ($null -ne $env:chocolateyPackageVersion) {
  $tempDir = Join-Path $tempDir "$($env:chocolateyPackageVersion)";
}
$tempDir = $tempDir -replace '\\chocolatey\\chocolatey\\', '\chocolatey\'
if (![System.IO.Directory]::Exists($tempDir)) {
  [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null
}
$downloadFilePath = Join-Path $tempDir "$($packageName)Install.$fileType"

$zipfileFullPath = Get-ChocolateyWebFile $packageName $downloadFilePath $url $url64bit -checkSum $checkSum -checksumType $checksumType -checkSum64 $checkSum64 -checksumType64 $checksumType64 -getOriginalFileName

# Call 7zip to unzip the download file
# Ref: https://github.com/chocolatey/choco/blob/master/src/chocolatey.resources/helpers/functions/Get-ChocolateyUnzip.ps1

if (Test-Path "${Env:ProgramFiles(x86)}\7-zip") {
  $7zip = "${Env:ProgramFiles(x86)}\7-zip\7z.exe"
}
elseif (Test-Path "$Env:ProgramFiles\7-zip") {
  $7zip = "$Env:ProgramFiles\7-zip\7z.exe"
}
else {
  Write-Debug "7-zip is not installed. Aborting..."
}

# 32-bit 7z would not find C:\Windows\System32\config\systemprofile\AppData\Local\Temp,
# because it gets translated to C:\Windows\SysWOW64\... by the WOW redirection layer.
# Replace System32 with sysnative, which does not get redirected.
# 32-bit 7z is required so it can see both architectures
if ([IntPtr]::Size -ne 4) {
  $fileFullPathNoRedirection = $zipfileFullPath -ireplace ([System.Text.RegularExpressions.Regex]::Escape([Environment]::GetFolderPath('System'))), (Join-Path $Env:SystemRoot 'SysNative')
  $destinationNoRedirection = $destination -ireplace ([System.Text.RegularExpressions.Regex]::Escape([Environment]::GetFolderPath('System'))), (Join-Path $Env:SystemRoot 'SysNative')
}
else {
  $fileFullPathNoRedirection = $zipfileFullPath
  $destinationNoRedirection = $destination
}

$workingDirectory = $(Get-Location -PSProvider 'FileSystem')
if ($null -eq $workingDirectory -or $null -eq $workingDirectory.ProviderPath) {
  Write-Debug "Unable to use current location for Working Directory. Using Cache Location instead."
  $workingDirectory = $env:TEMP
}
$workingDirectory = $workingDirectory.ProviderPath

# The package contains some symlinks that are considered to be dangerous by 7zip
# Ref: https://cwe.mitre.org/data/definitions/59.html
# We will have to exclude those symlinks
$excludeFieList = Join-Path $toolsDir 'exclude-list.txt'

$loggingParam = '-bb1'
$params = "x -aoa -bd $loggingParam -o`"$destinationNoRedirection`" -y `"$fileFullPathNoRedirection`" -x@`"$excludeFieList`""

Write-Debug "Executing command ['$7zip' $params]"

# Redirecting output slows things down a bit.
$writeOutput = {
  if ($EventArgs.Data -ne $null) {
    $line = $EventArgs.Data
    Write-Verbose "$line"
    if ($line.StartsWith("- ")) {
      $global:zipFileList.AppendLine($global:zipDestinationFolder + "\" + $line.Substring(2))
    }
  }
}

$writeError = {
  if ($EventArgs.Data -ne $null) {
    Write-Error "$($EventArgs.Data)"
  }
}

$process = New-Object System.Diagnostics.Process
$process.EnableRaisingEvents = $true
Register-ObjectEvent -InputObject $process -SourceIdentifier "LogOutput_ChocolateyZipProc" -EventName OutputDataReceived -Action $writeOutput | Out-Null
Register-ObjectEvent -InputObject $process -SourceIdentifier "LogErrors_ChocolateyZipProc" -EventName ErrorDataReceived -Action $writeError | Out-Null

$process.StartInfo = New-Object System.Diagnostics.ProcessStartInfo($7zip, $params)
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.RedirectStandardError = $true
$process.StartInfo.UseShellExecute = $false
$process.StartInfo.WorkingDirectory = $workingDirectory
$process.StartInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
$process.StartInfo.CreateNoWindow = $true
$process.Start() | Out-Null
$process.BeginOutputReadLine()
$process.BeginErrorReadLine()
$process.WaitForExit()

Unregister-Event -SourceIdentifier "LogOutput_ChocolateyZipProc"
Unregister-Event -SourceIdentifier "LogErrors_ChocolateyZipProc"

for ($loopCount = 1; $loopCount -le 15; $loopCount++) {
  if ($process.HasExited) {
    break;
  }
  Write-Debug "Waiting for 7z.exe process to exit - $loopCount/15 seconds";
  Start-Sleep 1;
}
    
$exitCode = $process.ExitCode
$process.Dispose()

Set-PowerShellExitCode $exitCode
Write-Debug "Command ['$7zip' $params] exited with `'$exitCode`'."
Write-Debug "7z exit code: $exitCode"

switch ($exitCode) {
  0 {
    break
  }
  1 {
    throw 'Some files could not be extracted.'
  } # this one is returned e.g. for access denied errors
  2 {
    throw '7-Zip encountered a fatal error while extracting the files.'
  }
  7 {
    throw '7-Zip command line error.'
  }
  8 {
    throw '7-Zip out of memory.'
  }
  255 {
    throw 'Extraction cancelled by the user.'
  }
  default {
    throw '7-Zip signalled an unknown error (code $exitCode)'
  }
}

# Add to system path

Install-ChocolateyPath -pathToInstall "$($toolsDir)\google-cloud-sdk\bin"
