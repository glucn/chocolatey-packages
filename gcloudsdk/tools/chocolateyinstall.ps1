$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-532.0.0-windows-x86_64.zip'
$checksum64 = '6487D39F7022CF75C8985AC7B9AA5E09478B3198845A965C07EAF35E8D43A89E'

$url32 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-532.0.0-windows-x86.zip'
$checksum32 = '6AEF336548D1063F5A1B5DBFAE899BCBC731C26D8CC68B6FFB02524AF4522C9E'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url32
  url64bit       = $url64
  checksum       = $checksum32
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Delete symlink files that will fail the checksum process.
# Example error:
#
# [WARN ] - Error computing hash for 'C:\ProgramData\chocolatey\lib\gcloudsdk\tools\google-cloud-sdk\platform\gsutil\third_party\funcsigs\docs\index.rst'
#  Hash will be special code for locked file 
#  Captured error:
#   The filename, directory name, or volume label syntax is incorrect.
Write-Verbose 'Deleting symlink files that will fail the checksum process'
Get-ChildItem -Path "$toolsDir" -Recurse -File |  Where-Object { $_.LinkType -ne $null -or $_.Attributes -match "ReparsePoint" } | Remove-Item -Force

Install-ChocolateyPath -Path "$($toolsDir)\google-cloud-sdk\bin"
