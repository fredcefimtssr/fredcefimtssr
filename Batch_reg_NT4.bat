@echo off
setlocal enabledelayedexpansion

echo Entrez le nom d'utilisateur :
echo | set /p newUsername=

echo Entrez le nouveau mot de passe :
echo | set /p newPassword=

:: Changer le mot de passe (à adapter selon NT4)
net user !newUsername! !newPassword!

:: Générer le fichier .reg pour l'autologon (à adapter selon NT4)
(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [HKEY_LOCAL_MACHINE\Software\YourApplication]
    echo "Setting1"="Value1"
    echo "Setting2"="Value2"
) > ChangePasswordAndAutoLogon_NT4.reg

:: Fusionner les modifications du registre
regedit /s ChangePasswordAndAutoLogon_NT4.reg

:: Supprimer le fichier .reg
del ChangePasswordAndAutoLogon_NT4.reg

echo Le mot de passe pour l'utilisateur !newUsername! a été modifié et l'autologon a été activé avec succès (NT4).

endlocal
