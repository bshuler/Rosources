@echo off
title Install Rosources Texture Pack
cls

echo Welcome to the Rosources texture pack installer
echo Press any key to begin installation...
pause>nul
echo.
if exist "Rosources Texture Pack*" goto packexist else goto packnoexist

:packnoexist
echo Unable to find Rosources Texture Pack folder
echo Please ensure this folder exists before installing
echo.
goto finish

:packexist
echo Rosources Texture Pack Folder Found!
if exist %appdata%\.minecraft\resourcepacks goto folderexists else goto foldernotexists

:folderexists
echo Minecraft Resource Packs Folder Found!
echo.
if exist "%appdata%\.minecraft\resourcepacks\Rosources Texture Pack"  goto removeoldversion
echo Installing...
goto installfolder

:installfolder
echo.
xcopy /I "Rosources Texture Pack" "%appdata%\.minecraft\resourcepacks\Rosources Texture Pack" /E /V /H /K
echo.
echo Finished installing Rosources texture pack
goto finish

:foldernotexists
echo Unable to find Minecraft Resource Packs Folder!
echo Please ensure that the directory "%appdata%\.minecraft\resourcepacks" exists
goto finish

:removeoldversion
echo Removing old version...
rmdir /S /Q "%appdata%\.minecraft\resourcepacks\Rosources Texture Pack"
echo Installing new version...
goto installfolder

:finish
echo Press any key to close the installer...
pause>nul
exit 0
