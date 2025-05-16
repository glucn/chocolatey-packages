$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-522.0.0-windows-x86_64.zip'
$checksum64 = '6C40F10770812A17E4EDD4D84AC2871BEC1370350FC545CEA6C4CB3511D5F3FE'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-522.0.0-windows-x86.zip'
$checksum32 = '31E4D217CDA2172CE3B874C070831EFD1606FDAD989C66FFBED843BF50E1A34E'

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
