echo You are about to download https://chocolatey.org/install.ps1
echo Please inspect the URL ^  then confirm or deny installation
#  remove this for hands free install
$yn = Read-Host -Prompt 'Continue Y or N'

$Date = Get-Date -format yyyy-M-d
Write-Host "Config windows on '$Date'" 


#@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat #None -ExecutionPolicy Bypass -Command "iex ((New-Object #System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET #"PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

Set-ExecutionPolicy Bypass -Scope Process -Force 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install jdk8  jre8 -y | Out-File  -Append  install-$Date.log
choco install androidstudio -y	| Out-File  -Append   install-$Date.log
choco install slack	| Out-File  -Append   install-$Date.log

choco install notepadplusplus atom 7zip -y | Out-File  -Append   install-$Date.log
choco install googlechrome  -y  | Out-File  -Append   install-$Date.log

