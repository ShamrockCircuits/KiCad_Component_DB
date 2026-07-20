@echo off
setlocal

set SCRIPT_DIR=%~dp0
set XLSX_PATH=%SCRIPT_DIR%\libdb.xlsx
set SQLITE_PATH=%SCRIPT_DIR%\libdb.sqlite

"%SCRIPT_DIR%\_scripts\dist\xlsx_to_sqlite.exe" "%XLSX_PATH%" "%SQLITE_PATH%" -v

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Conversion failed.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo Done. Updated %SQLITE_PATH%
pause