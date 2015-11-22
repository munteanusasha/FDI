@echo off

REM if advanced mode prompt for transfer system files.

if "%FADV%" == "" goto AssumeYes

:AdvancedMode
vcls /f %TSF% /b %TSB% /c %TSC% /y2 /h24
vframe /b %TFB% /f %TFF% %TFS% textbox /t %FLANG% XFER_FRAME
vecho /t %FLANG% XFER? %TFH% %FDRIVE% %TFF%
vecho
vframe /b %TFB% /f %TFF% hidden /t %FLANG% XFER_OPTS
vecho /t %FLANG% XFERY
vecho /n /t %FLANG% XFERN
vchoice /a %TFC% Ctrl-C /d 1

if errorlevel 200 FDICTRLC.BAT %0
if errorlevel 2 goto SkipSysXfer

:AssumeYes
set OSYS=y
verrlvl 0
goto Done

:SkipSysXfer
set OSYS=n
verrlvl 0

:Done