$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-524.0.0-windows-x86_64.zip'
$checksum64 = 'DF985CAD64F25996811DF9C0112E0F5196A6DD2B867740AFBE5C28119CBFC3F8'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-524.0.0-windows-x86.zip'
$checksum32 = '03E71A928DB74C29F6F5B0F21E8F332F0D1820F21EDA29F4F9D9318C5AB074C1'

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
