# surmene

PowerShell helper for daily usage

## Install


### PowerShell Core
```powershell
Import-Module PowerShellGet
Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
Install-Module -Name "surmene" -RequiredVersion "0.0.1" -Repository "guneysu" 
```


### Windows PowerShell

```powershell
Import-Module PowerShellGet
Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
Install-Module -Name "surmene" -RequiredVersion "0.0.1" -Repository "guneysu" -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```