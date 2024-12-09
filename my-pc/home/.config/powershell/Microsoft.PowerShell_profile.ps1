# Windows horrible location: 
# My Documents\WindowsPowerShell\Microsoft.PowerShell.ps1

# Paquetes para configurar el Prompt.  
Import-Module posh-git

Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Import-Module dotenv

$ThisRepo = "C:\Users\DiegoVillamil\Library\Repos\z-Outsiders\pc-setup"
$TheTheme = "windows-pc\files\powershell\posh-themes\p10k_dx.omp.yaml" 
oh-my-posh init pwsh --config "$ThisRepo/$TheTheme" | Invoke-Expression

# Customized alias for specific use. 
Remove-Item Alias:r

$AppData = "C:\Users\DiegoVillamil\AppData"
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

function Load-Dotenv {
	[CmdletBinding(SupportsShouldProcess)]
  [Alias('dotenv')]
  param(
    [ValidateNotNullOrEmpty()]
    [String] $Path = '.env',
    [ValidateSet('Environment', 'Regular')]
    [String] $Type = 'Environment')
  $Env = Get-Content -raw $Path | ConvertFrom-StringData
  $Env.GetEnumerator() | Foreach-Object {
    $Name, $Value = $_.Name, $_.Value
    $Uncomment = [Regex]::Replace($Value, "\s*(#.*)?", "") # Trim Space and Comment
    $TheMatch = [Regex]::Match($Uncomment, "^([`"'])?([^\s#=]*?)([`"'])?$")

    if (-not $TheMatch.Success) {
      throw [System.IO.InvalidDataException] "Not regex match in '$Name': $Value"
    } elseif ($TheMatch.Groups[1].Value -ne $TheMatch.Groups[3].Value) {
      throw [System.IO.InvalidDataException] "Mismatched quotes in '$Name': $Value"
    }
    $TheVar = $TheMatch.Groups[2].Value
    if ($PSCmdlet.ShouldProcess($Name, "Importing $Type Variable")) {
      switch ($Type) {
        'Environment' { Set-Content -Path "env:\$Name" -Value $TheVar}
        'Regular' { Set-Variable -Name $Name -Value $TheVar -Scope Script } }
    }
  }
}


# New-Alias powerbi "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe"
# New-Alias sap-hana "C:\Program Files\sap\hdbclient\hdbsql.exe"

# New-Alias rstudio "C:\Users\DiegoVillamil\AppData\Local\R\RStudio\bin\rstudio.exe"
# New-Alias azcopy  "C:\Users\DiegoVillamil\Programs\Portable,Zipped\AzCopy\azcopy_windows_amd64_10.10.0\azcopy.exe"
# New-Alias code "C:\Users\DiegoVillamil\AppData\Local\Programs\Microsoft VS Code\Code.exe" 

# Customized functions, that may or may not be useful. 

<# function prompt
{
  $prompt = & $GitPromptScriptBlock
  $prompt += "$([char]27)]9;12$([char]7)"
  
  $loc = Get-Location
  if ($loc.Provider.Name -eq "FileSystem") {
    $prompt += "$([char]27)]9;9;`"$($loc.Path)`"$([char]7)"
  }
  $prompt
}
#>

#function Vim([string]$FileName) {
#   "& 'C:\Program Files (x86)\Vim\vim82\vim.exe'" $FileName }
