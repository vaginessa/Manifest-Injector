@echo off
::                                                        external resources (path normalised)
set FILE_MANIFEST="%~dp0generic.manifest"
set FILE_MT="%~dp0mt.exe"
for /f %%a in ("%FILE_MANIFEST%")do ( set "FILE_MANIFEST=%%~fsa"  )
for /f %%a in ("%FILE_MT%")do       ( set "FILE_MT=%%~fsa"        )

:LOOP
echo.

::has argument ?
if ["%~1"]==[""] (
  echo done.
  goto END;
)

echo "%~1"

::argument exist ?
if not exist %~s1 (
  echo not exist
  goto NEXT;
)
::file exist ?
echo exist
if exist %~s1\NUL (
  echo is a directory
  goto NEXT;
)
::OK
echo is a file
::-------------------------------------------------------------------------------------------
::-------------------------------------------------------------------------------------------

set FILE_INPUT=%~s1
set FILE_EXT=%~x1

set RUN_CMD=%FILE_MT% -nologo -manifest %FILE_MANIFEST% -outputresource:%FILE_INPUT%;1

if /i ["%FILE_EXT%"] == [".dll"] ( 
  set RUN_CMD=%FILE_MT% -nologo -manifest %FILE_MANIFEST% -outputresource:%FILE_INPUT%;2
)

echo %RUN_CMD%
call %RUN_CMD%

::-------------------------------------------------------------------------------------------
::-------------------------------------------------------------------------------------------
:NEXT
shift
goto LOOP

:END
pause

