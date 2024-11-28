function Get-PublicIP {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Get-PublicIP

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>	
  ((Invoke-WebRequest httpbin.org/ip).Content | ConvertFrom-Json).origin
}

function Invoke-Touch {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Invoke-Touch

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>	
	
    param (
        [Parameter(Mandatory = $false)] [string] $name
    )
  
    if ( Test-Path $name) {
	(Get-Item ${name}).LastWriteTime = (date)
    }
    else {
        New-Item -ItemType File -Path "${name}" | out-null
    }
}

function Get-FullPath {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Invoke-FullPath

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>		
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [System.IO.FileInfo] $file
    )
	(get-item $file).FullName
}

function Copy-FullPath {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Copy-FullPath

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>		
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [System.IO.FileInfo] $file
    )
    Get-FullPath $file | set-clipboard
}

function ConvertFrom-Base64 {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        ConvertFrom-Base64

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>		
    param(
        [Parameter(Mandatory = $true, Position = 0, Valuefrompipeline = $true)] [alias("t")] [string] $Text
    )
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($text))
}

function ConvertTo-Base64 {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        ConvertTo-Base64

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>		
	
    param(
        [Parameter(Mandatory = $true, Position = 0, Valuefrompipeline = $true)] [alias("t")] [string] $text
    )
    [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($text))
}


function ConvertTo-Base64DataUrl {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        ConvertTo-Base64DataUrl
		
    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>			
    param(
        [Parameter(Mandatory = $true, Position = 0, Valuefrompipeline = $true)] [alias("t")] [string] $text
    )
    "data:text/html;base64,$((ConvertTo-Html | Join-String -Separator '' | ConvertTo-Base64))"
}

function Invoke-Export {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Invoke-Export
		
    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>				
    get-childitem env:\
}

function Invoke-ToHex {
    <#
    TODO powershell 7 has a function: format-hex
    .EXAMPLE
    100 | Invoke-ToHex
#>
    [cmdletbinding()] 
    param(
        [Parameter(ValueFromPipeline)] [int]$Value
    )
  
    Process {
        '{0:X2}' -f $_
    }
}

<#

-- TEMPLATES ---

function ConvertTo-XXXX () {
  [cmdletbinding()] param([parameter(ValueFromPipeline)] [int]$value)
  Process  {
     
  }
}


#>

function Invoke-ToDecimal {
    <#
    .EXAMPLE
        0xff | Invoke-ToDecimal
#>
    [cmdletbinding()] param([parameter(ValueFromPipeline)] [int]$value)
    Process {
        [int64]$_
    }
}


function Invoke-ToUpper {
    [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
    Process {
        $_.ToUpper()
    }
}

function Invoke-ToUpperInvariant {
    [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
    Process {
        $_.ToUpperInvariant()
    }
}


function Invoke-ToLower {
    [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
    Process {
        $_.ToLower()
    }
}

function Invoke-ToLowerInvariant {
    [cmdletbinding()] param([parameter(ValueFromPipeline)] [string]$value)
    Process {
        $_.ToLowerInvariant()
    }
}

function Invoke-Length {
    [cmdletbinding()] 
    param([parameter(ValueFromPipeline)] [string]$value)
  
    Process {
        $_.Length
    }
}


function Invoke-xContains {
    <#
  .EXAMPLE
	1..("lorem"  | get-length) | % { "$($_ * 3)" } | Invoke-Contains 1
  #>
    [cmdletbinding()] param(
        [parameter(ValueFromPipeline)] [string]$Text,
        [parameter(Mandatory = $true, Position = 1)] [string]$Value
    )
    Process {
        $_.Contains($Value)
    }
}

function Invoke-Hex2Ascii {
    <#
  .EXAMPLE
	Invoke-Hex2Ascii "68 65 6c 6c 6f 57 6f 72 6c 64 7c 31 2f 30 38 31 35 7c 41 42 43 2d 31 35 02 08"
	"68 65 6c 6c 6f 57 6f 72 6c 64 7c 31 2f 30 38 31 35 7c 41 42 43 2d 31 35 02 08" | Invoke-Hex2Ascii
	
   .LINK
		https://stackoverflow.com/a/41763171/1766716
#>	
    
    param([Parameter(Mandatory = $true, Position = 0, ValueFromPipeline)] [String]$HexString)
	
    $asciiChars = $HexString -split ' ' | ForEach-Object { [char][byte]"0x$_" }
    $asciiString = $asciiChars -join ''

    write-host $asciiString
}

Function Get-IP4 { 
    (Ipconfig | select-string IPV4 | % { ($_ -replace "^(.*):", "").Trim() }) -join ","
}

Function Invoke-Xargs () {
    <#
	.EXAMPLE
		1..10 | xargs -command "echo ({}*3)"
#>
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
    
        # write-debug $($args -join ';')
        foreach ($arg in $args) {
            Invoke-Expression "$Command".Replace("{}", $arg)
            # write-debug "$Command".Replace("{}",  $arg)
        }
    }
}



Function Invoke-XFind { 
    <#
	.EXAMPLE
		xfind "*.log"
#>
    Param(
        [Parameter(Mandatory = $true)] 
        [string]$pattern
    )

    Get-ChildItem -path . -filter $pattern -recurse | % { $_.fullname }
}

function Show-Path {
    echo $env:PATH.Split(';')
}

function Format-Env {
    param(  
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)][String[]]$value
    )
	
    $value.Split(';')
}

function Watch-Task {
    <#
	.EXAMPLE
		Watch-Task { echo foo }
		
		Watch-Task { echo foo } -Interval 3
#>
    param (
        [Parameter(Mandatory = $False)] [System.Management.Automation.ScriptBlock] $ScriptBlock,
        [int] $Interval = 1
    )
  
    do {
        $err = @()
        try {
            Invoke-Command $ScriptBlock
            Start-Sleep -Seconds $Wait
        }
        catch {
            write-error $_
            break
        }
	
    } while ($true)
  
}


function Invoke-ReplaceString {
    <#
  .EXAMPLE
    "Foo" | replace-string "Foo" "Bar"
    
  #>
    param(
        [Parameter(Valuefrompipeline = $true)] [alias("t")] [string] $text,
        [Parameter(Mandatory = $true, Position = 0)] [string] $from,
        [Parameter(Mandatory = $false, Position = 1)] [string] $to = $null
    )
    $text.Replace($from, $to)

}



function Invoke-Swap {
    <#
    .SYNOPSIS
        TODO: A brief

    .DESCRIPTION
        TODO: A longer.

    .PARAMETER FirstParameter
        TODO: Description of each of the parameters.

    .INPUTS
        Description of objects that can be piped to the script.

    .OUTPUTS
        Description of objects that are output by the script.

    .EXAMPLE
        Invoke-Swap

    .LINK
        Links to further documentation.

    .NOTES
        Detail on what the script does, if this is needed.
    #>		
    param(
        [Parameter(Mandatory = $true, Position = 0)] [System.IO.FileInfo] $source,
        [Parameter(Mandatory = $true, Position = 1)] [System.IO.FileInfo] $destination
    )
	
    $src = (get-item $source).FullName
    $dst = (get-item $destination).FullName
	
    $tmp = [System.IO.Path]::GetRandomFileName()

    Move-Item -Path $src -Destination $tmp
    Move-Item -Path $dst -Destination $src
    Move-Item -Path $tmp -Destination $dst
	
}


<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Command
Parameter description

.PARAMETER Seconds
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function watch {
    param (
        [Parameter(Position = 0, mandatory = $true)]
        [scriptblock]$Command,
        
        [int] $Seconds = 2
    )
    
    while ($true) {
        Invoke-Command $Command
        Start-Sleep -Seconds $Seconds
        Clear-Host
    }
}
function Invoke-Clone {
    param(
        [Parameter(Mandatory = $true)]
        [string]$GitUrl
    )
    
    # Check if the URL is SSH or HTTPS
    if ($GitUrl -match "^git@") {
        # SSH URL, replace "git@" and ":" with "/" to normalize the URL for path creation
        $urlParts = $GitUrl -replace "^git@", "" -replace ":", "/" -split "/"
    }
    elseif ($GitUrl -match "^https?://") {
        # HTTPS URL, remove "www" if it exists
        $urlParts = $GitUrl -replace "^https?://(www\.)?", "" -split "/"
    }
    else {
        throw "Unsupported Git URL format."
    }
    
    # Add '.git' suffix to the last segment (repository name)
    $repoName = [System.IO.Path]::GetFileNameWithoutExtension($urlParts[-1])
    $urlParts[-1] = "$repoName.git"
    
    # Construct the clone path in C:\repos by combining all URL parts
    $clonePath = "C:\repos"
    foreach ($part in $urlParts) {
        $clonePath = Join-Path $clonePath $part
    }
    
    # Ensure the directory structure exists
    if (-not (Test-Path -Path $clonePath)) {
        New-Item -ItemType Directory -Path $clonePath -Force
    }
    
    # Clone the repository
    git clone $GitUrl $clonePath
    
    # Change to the cloned directory
    Set-Location -Path $clonePath
    
    Write-Host "Repository cloned to $clonePath and switched to directory."
}

# ----------------------------------------

function .. { set-location .. }
function ... { set-location ... }
function .... { set-location .... }
function ..... { set-location ..... }

set-alias which get-command
set-alias ll Get-ChildItem
set-alias atob ConvertTo-Base64
set-alias btoa ConvertFrom-Base64
set-alias hex2ascii Invoke-Hex2Ascii
set-alias touch Invoke-Touch
set-alias xcontains Invoke-xContains
set-alias length Invoke-Length
set-alias lower Invoke-ToLower
set-alias upper Invoke-ToUpper
set-alias decimal Invoke-ToDecimal
set-alias hex Invoke-ToHex
set-alias xargs Invoke-Xargs
set-alias xfind Invoke-XFind

set-alias string-replace Invoke-ReplaceString

set-alias swap Invoke-Swap
# set-alias fullpath Get-FullPath

set-alias klone Invoke-Clone
