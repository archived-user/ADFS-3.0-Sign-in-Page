### This is a powershell script to update ADFS sign-on portal.
### Create this directory "c:\sso_theme\" and place this script in it.
### To run, please type the following command in powershell:
### & "c:\sso_theme\runtheme.ps1"

### Please make sure to first set the active theme as "custom1" by running the following commands:
# New-AdfsWebTheme -Name custom1 -SourceName default  ##clones a new theme named "custom1" from the default theme
# Set-AdfsWebConfig -ActiveTheme custom1              ##sets the theme "custom1" as the active theme

### You can also export the theme to modify:
# Export-AdfsWebTheme –Name custom –DirectoryPath c:\theme

### You can freely modify style.css, onload.js, the logo and the illustration of the sign-on portal
### Once done, the following commands will update the theme:
Write-Host "Updating theme custom1 ..."
Set-AdfsWebTheme -TargetName custom1 -StyleSheet @{path="c:\sso_theme\style.css"}
Set-AdfsWebTheme -TargetName custom1 -Logo @{path="c:\sso_theme\logo.png"}
Set-AdfsWebTheme -TargetName custom1 -Illustration @{path="c:\sso_theme\image.png"}
Set-AdfsWebTheme -TargetName custom1 -AdditionalFileResource @{Uri="/adfs/portal/script/onload.js"; path="c:\sso_theme\onload.js"}
Write-Host "Customisation completed!"