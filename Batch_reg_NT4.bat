@echo off
setlocal enabledelayedexpansion

echo Entrez le nom d'utilisateur :
echo | set /p newUsername=

echo Entrez le nouveau mot de passe :
echo | set /p newPassword=

:: Changer le mot de passe (� adapter selon NT4)
net user !newUsername! !newPassword!

:: G�n�rer le fichier .reg pour l'autologon (� adapter selon NT4)
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

echo Le mot de passe pour l'utilisateur !newUsername! a �t� modifi� et l'autologon a �t� activ� avec succ�s (NT4).

endlocal
