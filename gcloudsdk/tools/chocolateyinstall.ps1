$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-513.0.0-windows-x86_64.zip'
$checksum64 = '9E72DCBA7433B1A502FAA27DDCA59C93ECF19AA0D1F3A2FA34186800922EFCFE'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-513.0.0-windows-x86.zip'
$checksum32 = 'E1993433DB3A5B86F8C6DFD1F9634DCA71BCFE1DFA39A6BA56D668F2DAC794CD'

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
