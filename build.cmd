@echo off
@set TEMP=ra95_build.exe
@set TARGET=ra95.exe
del %TEMP% >nul 2>&1
del %TARGET% >nul 2>&1
:: build
echo Listing tool versions
echo -------------------------------------------------------------
set PATH=C:\w64devkit\bin
nasm -version
echo.
ld -version
echo.
make -version
echo.
echo Building [make]
echo -------------------------------------------------------------
make clean
make
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
