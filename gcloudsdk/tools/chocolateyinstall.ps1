$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-530.0.0-windows-x86_64.zip'
$checksum64 = '9FEF81D2B60CB73787661A363B543884D0C12FDA2FBB09FD7AA28B67F3D799C6'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-530.0.0-windows-x86.zip'
$checksum32 = '605581A61E8375D20C49B08397684261D5B2404EA198EF1580C80C6F0AF81CE2'

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
