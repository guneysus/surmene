<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>

Function .. { Set-Location .. }

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
Function ... { Set-Location ... }

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
Function .... { Set-Location .... }


<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER GitUrl
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Invoke-Klone {
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$GitUrl
    )

    # Check if the URL is in the correct format
    if ($GitUrl -match "^(https:\/\/|git@)") {
        # Extract the repository name from the URL
        $repoName = [System.IO.Path]::GetFileNameWithoutExtension(($GitUrl -split '/|:')[-1])
        
        # Define the path where the repo will be cloned
        $clonePath = "C:\repos\$repoName"

        # Check if the directory already exists
        if (-not (Test-Path -Path $clonePath)) {
            # Create the directory
            New-Item -ItemType Directory -Path $clonePath -Force
        }
        else {
            Write-Host "Directory $clonePath already exists. Cloning into existing directory..."
        }

        # Clone the repository
        git clone $GitUrl $clonePath

        # Change to the cloned directory
        Set-Location -Path $clonePath

        Write-Host "Repository cloned to $clonePath and switched to directory."
    }
    else {
        Write-Host "Invalid Git URL format. Please provide a valid SSH or HTTPS URL."
    }
}

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER FilePath
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Invoke-Notepad2 {
    param (
        [string]$FilePath
    )
    
    $notepad2Path = "C:\Program Files\Notepad2\Notepad2.exe"
    
    # Check if Notepad2 exists at the specified path
    if (-not (Test-Path $notepad2Path)) {
        throw "Notepad2 not found at $notepad2Path"
    }

    # Prepare the argument list
    $arguments = @()

    # If a file path is provided, add it to the arguments
    if ($FilePath) {
        if (-not (Test-Path $FilePath)) {
            throw "File not found: $FilePath"
        }
        $arguments += $FilePath
    }

    # Launch Notepad2
    try {
        Start-Process -FilePath $notepad2Path -ArgumentList $arguments
    }
    catch {
        Write-Error "Failed to launch Notepad2: $_"
    }
}

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER pattern
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
Function XFind {
    Param(
        [Parameter(Mandatory = $true)] 
        [string]$pattern
    )

    Get-ChildItem -path . -filter $pattern -recurse | ForEach-Object { $_.fullname }
}

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
Function Invoke-Export () {
    Get-ChildItem env:
}


<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
function Show-Path {
    # Get the PATH environment variable and split it by the semicolon
    $pathEntries = $Env:PATH -split ';'

    # Create an array of custom objects with Index and Path properties
    $paths = $pathEntries |
    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
    ForEach-Object { [PSCustomObject]@{ Index = [System.Array]::IndexOf($pathEntries, $_) + 1; Path = $_ } }

    # Display the paths in a formatted table
    $paths | Format-Table -Property Index, Path -AutoSize
}

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER args
Parameter description

.PARAMETER Command
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
Function Invoke-Xargs () {
    param(  
        [Parameter(
            Position = 0, 
            Mandatory = $true, 
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)
        ]
        [String[]]$args,

        [Parameter(Mandatory = $true)]
        [String]$Command
    )

    process {
    
        write-debug $($args -join ';')

        foreach ($arg in $args) {
            Invoke-Expression "$Command".Replace("{}", $arg)
            write-debug "$Command".Replace("{}", $arg)
            Write-Output "$Command".Replace("{}", $arg)
        }
    }
}


Set-Alias -Name klone -Value Invoke-Klone
Set-Alias -Name notepad2 -Value Invoke-Notepad2
Set-Alias -Name export -Value Invoke-Export
Set-Alias -Name xargs -Value Invoke-Xargs