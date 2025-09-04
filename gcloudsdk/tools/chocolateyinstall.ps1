$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-537.0.0-windows-x86_64.zip'
$checksum64 = 'DF8086CC817B0043019DD61B09561E6A905932CFA63124CB16B6EC1C1DC61941'

$url32 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-537.0.0-windows-x86.zip'
$checksum32 = '74A138B9441DC71022A3E80EF90FF783FB97380F5E531C45192D6EF0EA294E55'

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

Install-ChocolateyPath -pathToInstall "$($toolsDir)\google-cloud-sdk\bin"
