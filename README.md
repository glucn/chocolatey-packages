# glucn's Chocolatey packages

This is the repository containing Chocolatey packages maintained by [glucn](https://glucn.com)

## List of packages
- [aliyun-cli](https://community.chocolatey.org/packages/aliyun-cli)
- [gcloudsdk](https://community.chocolatey.org/packages/gcloudsdk) (Thanks to previous maintainers [@IvanaGyro](https://github.com/IvanaGyro), [@gpoul](https://github.com/gpoul))


## Runbook for publishing a new version (as a reminder for future myself)
- Update the following:
  - chocolateyinstall.ps1
    - $url64
    - $checksum64
  - .nuspec file
    - version
  - (there might be some other info I will need to update)
- Build the package: `choco pack`
- Test the package: `choco install ${packageName} --debug --verbose --source .`
- Push the package: `choco push ${packageName}.nupkg --source "'https://push.chocolatey.org/'"`

## References
- Create Chocolatey package
  - https://docs.chocolatey.org/en-us/create/create-packages
  - https://docs.chocolatey.org/en-us/create/create-packages-quick-start
  - https://docs.chocolatey.org/en-us/create/functions/install-chocolateyzippackage
- Chocolatey community repository
  - https://docs.chocolatey.org/en-us/community-repository/moderation/
  - https://docs.chocolatey.org/en-us/community-repository/maintainers/package-maintainer-handover
- Packages from the other maintainers
  - https://github.com/jtcmedia/chocolatey-packages
  - https://github.com/IvanaGyro/chocolatey-packages