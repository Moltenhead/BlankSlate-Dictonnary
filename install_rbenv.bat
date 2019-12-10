@echo off
setlocal

rem Set your rbenv directry
set instpath="%USERPROFILE%\.rbenv-win"
rem Clone git repositry
call git clone https://github.com/nak1114/rbenv-win.git %instpath%

rem Config path
rem rem Add the bin & shims directory to your PATH environment variable for access to the rbenv command
rem rem get current PATH environment
rem for /f "skip=2 delims=" %%a in ('reg query HKCU\Environment /v Path') do set orgpath=%%a
rem rem update PATH environment
rem reg add HKCU\Environment /v Path /d "%instpath%\bin;%instpath%\shims;%orgpath:~22%" /f
setx RBENV_ROOT %instpath%
rem check new PATH environment
rem for /f "skip=2 delims=" %%a in ('reg query HKCU\Environment /v Path') do set orgpath=%%a
rem echo New PATH user local environment variable :"%orgpath:~22%"
echo.

rem Restart your shell
echo Please restart your shell
echo.

