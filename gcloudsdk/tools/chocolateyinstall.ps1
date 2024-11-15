$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-501.0.0-windows-x86_64.zip'
$checksum64   = '0D6610AD9F3E32E27E813EB4C99F3E191532E44C0574A283FFCB3D282C3F5309'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-501.0.0-windows-x86.zip'
$checksum32   = 'DA316875A3E3657EC07A84B290344F547400EACACB5E584B50F76A043400D8D7'

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
