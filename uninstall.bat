@echo off
setlocal

:: Uninstall All Mods
echo Uninstalling current mods...
timeout /t 1 /nobreak >nul

:: Delete All Mods
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\ME2" rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\ME2"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mods" rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mods"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\SeamlessCoop" rmdir /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\SeamlessCoop"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\dinput8.dll" del /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\dinput8.dll"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\dinput8.dll" del /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\dinput8.dll"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mod_loader_config.ini" del /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mod_loader_config.ini"
if exist "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mod_loader_log.txt" del /s /q "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\mod_loader_log.txt"
cls

:: Finish
endlocal