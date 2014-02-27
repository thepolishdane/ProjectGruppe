@echo off& cd /d %windir%\system32
title Patch Or Restore Sublime Text 2& call :about
set pf32="%programfiles%\Sublime Text 2"
set pf64="%programfiles(x86)%\Sublime Text 2"
set acf1=HKLM\SOFTWARE\Microsoft\Windows NT\
set acf2=CurrentVersion\AppCompatFlags\Layers
set lyrsky="%acf1%%acf2%" /v "!pth!!prgm!"
set forinb=for /f "delims=*" %%b in
set hxsarx86=8AC35B64890D0000000081C480 FEC05B64890D0000000081C480
set hxsarx64=8AC34C8D9C24E0 FEC04C8D9C24E0
set hxsarrg=5265676973746572656420746F20 5265676973746572656400000000
set hxptchr=/min /wait hexpatcher.exe !hxsar! -nobackup -quiet
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
echo              Sublime Text has been patched and will start...
echo.& start "program" /d "!pth!" "!prgm!"
) else (
reg query %lyrsky% /f RUNASADMIN /d>nul
if !errorlevel!==1 reg add %lyrsky% /d RUNASADMIN /f>nul
if %%~zc lss 5000000 set hxsar=%hxsarx86%
if %%~zc gtr 5000000 set hxsar=%hxsarx64%
copy /y "!pth!!prgm!" "!pth!!prgm!.bak">nul
echo              Sublime Text is being patched and will start...
echo.& start "program" /d "%~dp0" %hxptchr% "!pth!!prgm!"
set hxsar=%hxsarrg%& start "program" /d "%~dp0" %hxptchr% "!pth!!prgm!"
start "program" /d "!pth!" "!prgm!"
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
