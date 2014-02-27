@echo off& cd /d %windir%\system32
title Patch Or Restore Sublime Text 2& call :about
set pf32="%programfiles%\Sublime Text 2"
set pf64="%programfiles(x86)%\Sublime Text 2"
set acf1=HKLM\SOFTWARE\Microsoft\Windows NT\
set acf2=CurrentVersion\AppCompatFlags\Layers
set lyrsky="%acf1%%acf2%" /v "!pth!!prgm!"
set forinb=for /f "delims=*" %%b in
setlocal enabledelayedexpansion
for %%a in (%pf32% %pf64%) do (
if exist "%%~fa" (
%forinb% ('dir "%%~fa\*.exe" /b /s ^| findstr /i "sublime_text"') do (
set pth=%%~dpb& set prgm=%%~nxb
)
if exist "!pth!!prgm!" (
:tskl
taskkill /f /fi "status eq running" /im "!prgm!" /t>nul
tasklist /fi "status eq running" | findstr /i "!prgm!">nul
if !errorlevel!==0 goto tskl
for %%c in ("!pth!!prgm!") do (
if exist "!pth!!prgm!.bak" (
reg query %lyrsky% /f RUNASADMIN /d>nul
if !errorlevel!==0 reg delete %lyrsky% /f>nul
move /y "!pth!!prgm!.bak" "!pth!!prgm!">nul
echo                   Sublime Text original file restored& echo.
) else (
echo                   Sublime Text backup file not found& echo.
)
)
)
)
)
endlocal& timeout /t 2 >nul& exit
:about
echo.& echo.
echo               =============================================
echo               ^|^|             Sublime Text 2              ^|^|
echo               ^|^|            patch or restore             ^|^|
echo               ^|^|                                         ^|^|
echo               ^|^|            batch by 1n0n1m0s            ^|^|
echo               ^|^|                aug 2013                 ^|^|
echo               =============================================
echo.& echo.
