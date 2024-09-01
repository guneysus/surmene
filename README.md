# surmene

PowerShell helper for daily usage

![logo](<docs/img/_4796732e-968f-411a-a723-4dc9f0f4910b (Phone).jpg>)

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