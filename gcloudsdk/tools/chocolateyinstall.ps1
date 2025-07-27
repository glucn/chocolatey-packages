$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-531.0.0-windows-x86_64.zip'
$checksum64 = '8EB9DB01E88E87B49D391E1EAEA4ACD2108D878D7AC7CBC427D350243E1A20B8'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-531.0.0-windows-x86.zip'
$checksum32 = '08F2CEFF80B3E5400E9BAAF739190AEE9E1ED31429FA19689BB04C20D98E2785'

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
