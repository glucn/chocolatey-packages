$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-534.0.0-windows-x86_64.zip'
$checksum64 = '2B845102BFC76BD7FC5E8E3670054C37A7D975333F006C3CE84C53E8B3E1EBBD'

$url32 = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-534.0.0-windows-x86.zip'
$checksum32 = '8D33DFB6AC393043B64DBDCA1D7F4D3D989354C96389A111D8386BEB92F66297'

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
