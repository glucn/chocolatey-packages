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

Install-ChocolateyPath -Path "$($toolsDir)\google-cloud-sdk\bin"
