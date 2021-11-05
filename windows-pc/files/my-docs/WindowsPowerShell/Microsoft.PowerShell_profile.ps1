# Windows horrible location: 
# My Documents\WindowsPowerShell\Microsoft.PowerShell.ps1

# Oh-My-Posh profile
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme powerlevel10k_classic

# General Standard programs. 
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Customized alias for specific use. 
Remove-Item Alias:r

New-Alias powerbi "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe"
New-Alias rstudio "C:\Program Files\R\RStudio\bin\rstudio.exe"
New-Alias azcopy  "C:\Users\DiegoVillamil\Programs\Portable,Zipped\AzCopy\azcopy_windows_amd64_10.10.0\azcopy.exe"


# Customized functions, that may or may not be useful. 

#function AZ-Copy([string]$Command, [string]$Args)
#{    
#	"C:\Users\DiegoVillamil\Programs\Portable,Zipped\AzCopy\azcopy_windows_amd64_10.10.0\azcopy.exe" $Command $Args
#}

#function Vim([string]$FileName)
#{
 #   "& 'C:\Program Files (x86)\Vim\vim82\vim.exe'" $FileName
#}
