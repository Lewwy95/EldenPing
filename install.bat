@echo off
setlocal

:: Create 'Temp' Directory
if not exist "%~dp0\temp" mkdir "%~dp0\temp"

:: Set Current Version Number
set /p current=<version.txt

:: Get Latest Version File
echo Comparing versions...
type NUL > "%~dp0\temp\version_new.txt"
powershell -c "(Invoke-WebRequest -URI 'https://raw.githubusercontent.com/Lewwy95/EldenPing/main/version.txt').Content | Set-Content -Path '%~dp0\temp\version_new.txt'"
cls

:: Set Latest Version Number
set /p new=<"%~dp0\temp\version_new.txt"

:: Print Version Information
echo Checking for updates...
echo.
echo Current: v%current%
echo Latest: v%new%
timeout /t 2 /nobreak >nul
cls

:: Clear New Version File
del /s /q "%~dp0\temp\version_new.txt"
cls

:: Check For Different Version Files
if %new% neq %current% (
    echo Update required! Downloading...
    timeout /t 2 /nobreak >nul
    cls
    goto download
)

:: Check For Install
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\ME2\SeamlessCoop" goto finish

:: Not Installed
echo EldenPing is not installed! Installing...
timeout /t 2 /nobreak >nul
cls
goto install

:: Downloader
:download
echo Downloading latest revision...
echo.
powershell -c "(New-Object System.Net.WebClient).DownloadFile('https://github.com/Lewwy95/EldenPing/archive/refs/heads/main.zip','%~dp0\temp\EldenPing-main.zip')"
cls

:: Extract Latest Revision
echo Extracting latest revision...
powershell -c "Expand-Archive '%~dp0\temp\EldenPing-main.zip' -Force '%~dp0\temp'"
cls

:: Deploy Latest Revision
echo Deploying latest revision...
xcopy /s /y "%~dp0\temp\EldenPing-main" "%~dp0"
cls

:: Apply New Version File
break>version.txt
powershell -c "(Invoke-WebRequest -URI 'https://raw.githubusercontent.com/Lewwy95/EldenPing/main/version.txt').Content | Set-Content -Path '%~dp0\version.txt'"
cls

:: Uninstall All Mods
:install
call "%~dp0\uninstall.bat"

:: Install Mods
echo Installing mods...
xcopy /s /y /i "%~dp0\etc\*" "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game"
mkdir "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\SeamlessCoop"
cls

:: Clear 'Temp' Folder
echo Cleaning up...
del /s /q "%~dp0\temp\*"
rmdir /s /q "%~dp0\temp"
mkdir "%~dp0\temp"
cls

:: Finish
:finish
echo Installation is complete! Please launch the game with this bat file:
echo C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\ME2\launchmod_eldenring.bat
pause

:: Finish
endlocal
