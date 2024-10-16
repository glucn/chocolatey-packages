$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-497.0.0-windows-x86_64.zip'
$checksum64   = '0B2EE57698899F3C7D7B9B97EF174F947535C29CBB3C2F6E992EC2E76A10606C'
$url32        = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-497.0.0-windows-x86.zip'
$checksum32   = 'AAACDC29743F864A8EBE9AEB82620B32F6F18404C8C0B9CB8DDB233EB65C4538'

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
