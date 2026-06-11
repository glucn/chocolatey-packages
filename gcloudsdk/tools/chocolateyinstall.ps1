$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-571.0.0-windows-x86_64.zip'
$checksum64 = '166ee52464069a3ee3e17bf4427f86fe262751a0a38e7f70ff34dca5334f7553'

$url32 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-571.0.0-windows-x86.zip'
$checksum32 = '3b5407cfcadc06a21587846716bf58582cdd8462f8ed19c4a150596fde1d222f'

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

if (Get-ChildItem -Path $toolsDir) {
  Remove-Item -Path "$toolsDir\*" -Recurse -Force
}

# This try catch attempts to replicate the 7zip error handling from the Get-ChocolateyUnzip helper function
# https://github.com/chocolatey/choco/blob/develop/src/chocolatey.resources/helpers/functions/Get-ChocolateyUnzip.ps1
$errorMessageAddendum = "This is most likely an issue with the '$env:chocolateyPackageName' package and not with Chocolatey itself. Please follow up with the package maintainer(s) directly."
try {
  Write-Debug "Extracting $zipfileFullPath to $toolsDir..."
  Add-Type -Assembly "System.IO.Compression.Filesystem"
  [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfileFullPath, $toolsDir)
  Write-Debug "Extraction completed"
} catch [System.IO.PathTooLongException], [System.IO.DirectoryNotFoundException], [System.NotSupportedException], [System.IO.FileNotFoundException], [System.IO.InvalidDataException] {
  Set-PowershellExitCode 2
  throw "Encountered a fatal error while extracting the files: $($_.Message) $errorMessageAddendum"
} catch [System.IO.IOException], [System.UnauthorizedAccessException] {
  Set-PowershellExitCode 1
  throw "Some files could not be extracted: $($_.Message) $errorMessageAddendum"
} catch [System.ArgumentException], [System.ArgumentNullException] {
  Set-PowerShellExitCode 7
  throw "Invalid parameters were passed to ExtractToDirectory: $($_.Message) $errorMessageAddendum"
} catch {
  Set-PowerShellExitCode 3
  throw "An unknown error occurred while extracting files: $($_.Message) $errorMessageAddendum"
}

# Add to system path

Install-ChocolateyPath -pathToInstall "$($toolsDir)\google-cloud-sdk\bin"
