New-Item -Path "~\OneDrive - Bineo\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink -Value (Get-Item ".\files\my-docs\WindowsPowerShell\Microsoft.PowerShell_profile.ps1").FullName

New-Item -Path "~\.vimrc" -ItemType SymbolicLink -Value (Get-Item ".\shared-pcs/files\home\.vimrc").FullName