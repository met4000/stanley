@echo off
if not defined iammaximised (
    set iammaximised=1
    start /max "" "%0" "%*"
    exit
)

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

::Main menu
echo [%time%] [%info%] Loading main menu>>%fn%
call src\batch\menu\first.cmd
pause

if %menu_main_option% == "Start Game" goto START

echo [%time%] [%err%] Main Menu code completed, but no option triggered>>%fn%
pause
goto :END

::Start game
:START
src\story\main.cmd




::FUNCTIONS


:SHUTDOWN
echo [%time%] [LOAD] Writing to save...>>%fn%

:END
echo [%time%] [END] Closing main program>>%fn%
exit
