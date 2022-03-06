function test {
  $env:PSModulePath += ";$(pwd)"
  import-module surmene
  remove-module surmene
} 

function publish {
  Publish-Module -Path .\surmene -Repository guneysu -NuGetApiKey $env:MYGET_API_KEY
}

function upgrade {
    Import-Module PowerShellGet
    Install-Module -Name "surmene" -Repository "guneysu" -Verbose -Scope CurrentUser
}

function setup-myget {
	Register-PSRepository -Name "guneysu" -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
}