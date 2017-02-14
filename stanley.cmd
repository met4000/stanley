@echo off
if not defined iammaximised (
    set iammaximised=1
    start /max "" "%0" "%*"
    exit
)

::Define %BS% as backspace
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

set fn=%date:/=.%.%time::=.%
set fn=%fn:a=%
set fn=%fn:d=%
set fn=%fn:e=%
set fn=%fn:f=%
set fn=%fn:h=%
set fn=%fn:i=%
set fn=%fn:m=%
set fn=%fn:n=%
set fn=%fn:o=%
set fn=%fn:r=%
set fn=%fn:s=%
set fn=%fn:t=%
set fn=%fn:u=%
set fn=%fn:w=%
set fn=log\%fn: =%.log

echo [%time%] [LOAD] Starting main program>>%fn%

title The Story

echo [%time%] [LOAD] Loading log variables>>%fn%
call src\log\variables.cmd


:MENU_MAIN
echo [%time%] [%info%] Loading main menu>>%fn%
call src\batch\menu\first.cmd
if (%menu_main_option%)==(0) goto MAIN_START
if (%menu_main_option%)==(1) goto MAIN_OPTION
if (%menu_main_option%)==(2) goto MAIN_EXIT

echo [%time%] [%err%] Main Menu code completed, but no option triggered>>%fn%
goto END

::Start game
:MAIN_START
echo [%time%] [%info%] Loading Story:Main>>%fn%
src\story\main.cmd
echo [%time%] [%err%] Main Story code completed, with no redirect>>%fn%
goto END

::Settings
:MAIN_OPTION
echo [%time%] [%info%] Loading Settings>>%fn%
src\settings\main.cmd
echo [%time%] [%err%] Settings code completed, with no redirect>>%fn%
goto END



::FUNCTIONS


:SHUTDOWN
echo [%time%] [LOAD] Writing to save...>>%fn%

:END
echo [%time%] [END] Closing main program>>%fn%
exit
