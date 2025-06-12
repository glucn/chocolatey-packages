$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-526.0.1-windows-x86_64.zip'
$checksum64 = '8DE187B64A10932F385769592560C617289DB0017070E7AD9DA527B2D560068C'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-526.0.1-windows-x86.zip'
$checksum32 = '959B2372A5E449B29DCE9BCD7E42EB8B4A8B32C956BA69D32B1EFEEAF06E7ED9'

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
