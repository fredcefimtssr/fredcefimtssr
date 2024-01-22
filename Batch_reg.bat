@echo off

:: Fonction pour changer le mot de passe et activer l autologon
set /p newUsername=Entrez le nom d utilisateur: 
set /p newPassword=Entrez le nouveau mot de passe: 

:: Changer le mot de passe
net user %newUsername% %newPassword%

:: Generer le fichier .reg pour l autologon
echo Windows Registry Editor Version 5.00 > ChangePasswordAndAutoLogon.reg
echo. >> ChangePasswordAndAutoLogon.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> ChangePasswordAndAutoLogon.reg
echo "DefaultUserName"="%newUsername%" >> ChangePasswordAndAutoLogon.reg
echo "DefaultPassword"="%newPassword%" >> ChangePasswordAndAutoLogon.reg
echo "AutoAdminLogon"="1" >> ChangePasswordAndAutoLogon.reg

:: Importer le fichier .reg dans le registre
regedit /s ChangePasswordAndAutoLogon.reg

echo Le mot de passe pour l utilisateur %newUsername% a ete modifie et l autologon a ete active avec succès (Win2k).
exit /b 0

