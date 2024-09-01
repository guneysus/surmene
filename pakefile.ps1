function InitModule {
    New-ModuleManifest -Path .\surmene\surmene.psd1 `
        -ModuleVersion 0.0.1 `
        -Author "Ahmed Guneysu" `
        -CompanyName "---" `
        -Copyright "---" `
        -Description "PowerShell helper for daily usage" `
        -Guid $([guid]::NewGuid().Guid) `
        -Tags "PSModule" `
        -RootModule "surmene.psm1" `
        -ProjectUri "https://github.com/guneysus/surmene" `
        -LicenseUri "https://raw.githubusercontent.com/guneysus/surmene/master/LICENSE" `
        -Confirm -PassThru
}

function Test {
    (powershell -Command {
        $env:PSModulePath += ";$(Get-Location)"
        import-module surmene
        Get-Location
        ..
        Show-Path
        Get-Location
        remove-module surmene     
    })
}

function Publish {
    
    Register-PSRepository -Name "guneysu" `
        -SourceLocation "https://www.myget.org/F/guneysu/api/v2"
    Publish-Module -Path .\surmene `
        -Repository guneysu `
        -NuGetApiKey $env:NUGET_API_KEY 

}