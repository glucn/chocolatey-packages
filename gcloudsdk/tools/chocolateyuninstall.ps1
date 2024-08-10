$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Uninstall-ChocolateyPath "$($toolsDir)\google-cloud-sdk\bin"
