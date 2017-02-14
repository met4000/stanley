set menu_main_option=0
for /F "tokens=* delims=" %%a in (src\graphics\menu\first.txt) do echo %%a
:MAIN_MENU_OPT
choice /c wse /n
IF %errorlevel%==1 set /A menu_main_option=%menu_main_option%-1
IF %errorlevel%==2 set /A menu_main_option=%menu_main_option%+1
IF %errorlevel%==3 goto MAIN_MENU_OPT_END
set /A menu_main_option=(%menu_main_option%+3)%%3
goto MAIN_MENU_OPT
:MAIN_MENU_OPT_END
