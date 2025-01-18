$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-506.0.0-windows-x86_64.zip'
$checksum64 = '4E49356378D3CDC89101D4841769B90F45E12977BB39B8A6B692A8E15147B8C1'
$url32      = 'https://storage.googleapis.com/cloud-sdk-release/google-cloud-cli-506.0.0-windows-x86.zip'
$checksum32 = '1242649F834FA4FAC5EDF31514CA10D4D697E495679DCF33D761A4955AD86902'

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
