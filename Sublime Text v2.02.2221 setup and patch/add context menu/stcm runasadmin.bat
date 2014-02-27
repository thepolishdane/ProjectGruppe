@echo off& cd /d %windir%\system32
title Add Or Remove Sublime Text Context Menu& call :logo
set chc=Press A to add and R to remove Sublime Text context menu:
choice /c ARX /d X /t 30 /n /m "%chc%"
set prgm=sublime_text& set stcm=HKCR\*\shell\Sublime Text
goto %errorlevel%
:3
exit
:2
echo.& reg query "%stcm%" /ve /f "Open With Sublime Text">nul
if %errorlevel%==0 reg delete "%stcm%" /f
timeout /t 2 >nul& exit
:1
echo.& if not exist "%~dp0%prgm%.exe" (
cls& call :about
echo                 Sublime Text executable file not found& echo.
echo                 This context menu add or remove script& echo.
echo                 Must be in the same directory as program
timeout /t 9 >nul& exit
)
reg add "%stcm%" /d "Open With Sublime Text" /f
reg add "%stcm%" /v "Icon" /d "\"%~dp0%prgm%.ico\"" /f
reg add "%stcm%\Command" /d "\"%~dp0%prgm%.exe\" \"%%1\"" /f
timeout /t 2 >nul& exit
:logo
echo.
echo                SSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo                SSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo                SSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo               SSSSSSSSSSS        SSSSSSSSSSSS
echo               SSSSSSSSS           SSSSSSSSSSS
echo               SSSSSSSSS      SSSSSSSSSSSSSSSS
echo               SSSSSSSSSS         SSSSSSSSSSSS
echo               SSSSSSSSSSSSS        SSSSSSSSSS
echo               SSSSSSSSSSSSSSSSS     SSSSSSSSS
echo               SSSSSSSSS   SSSSS     SSSSSSSSS
echo              SSSSSSSSSS            SSSSSSSSSSS
echo              SSSSSSSSSSSSS       SSSSSSSSSSSSS
echo              SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo              SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo              SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
echo.
goto :eof
:about
echo.& echo.
echo               =============================================
echo               ^|^|              Sublime Text               ^|^|
echo               ^|^|       add or remove context menu        ^|^|
echo               ^|^|                                         ^|^|
echo               ^|^|            batch by 1n0n1m0s            ^|^|
echo               ^|^|                aug 2013                 ^|^|
echo               =============================================
echo.& echo.
