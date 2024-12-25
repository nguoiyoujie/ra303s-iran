@echo off
@set TEMP=ra95_build.exe
@set TARGET=ra95.exe
del %TEMP% >nul 2>&1
del %TARGET% >nul 2>&1
copy ra95.dat %TEMP% 1>nul
@if errorlevel 1 goto handleerror

echo Building [petool]
echo -------------------------------------------------------------
tools\petool.exe %TEMP% edit AUTO rwxc
tools\petool.exe %TEMP% add .patch rwxci 196608 ::0x30000
@if errorlevel 1 goto handleerror
::tools\petool.exe ra95.exe add .patch rwxci 131072
echo.
echo Building [nasm]
echo -------------------------------------------------------------
tools\linker.exe src\main.asm src\main.inc %TEMP% tools\nasm.exe -I./include/
@if errorlevel 1 goto handleerror
@move %TEMP% %TARGET%
echo.
echo Success
exit /b 0

:handleerror
echo.
echo.
echo An error has occured. Check above messages.
pause
exit /b 1
