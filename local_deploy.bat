@echo off

set log_file=deploy.log

echo.  > %log_file%
:: Read configuration
echo Reading config.json...  >> %log_file%
for /f "tokens=*" %%i in ('powershell -command "Get-Content config.json | ConvertFrom-Json | Select-Object -ExpandProperty closeOnCompletion"') do set closeOnCompletion=%%i
for /f "tokens=*" %%i in ('powershell -command "Get-Content config.json | ConvertFrom-Json | Select-Object -ExpandProperty destinationFolder"') do set destinationFolder=%%i

set source_folder=".\build"

echo Found valid destination path. >> %log_file%
if not exist "%destinationFolder%" mkdir "%destinationFolder%"
for /d %%d in ("%source_folder%\*") do (
    xcopy /E /Y "%%d" "%destinationFolder%\%%~nxd" 2>> %log_file%
    if errorlevel 0 (
        echo ^> PACK: %%~nxd was copied successfully! >> %log_file%
    ) else (
        echo Error: Failed to copy %%~nxd >> %log_file%
    )
)t

echo.  >> %log_file%
echo Pack compilation successful!  >> %log_file%

:: Check if it should close when finished
if "%closeOnCompletion%"=="False" (
    @pause
)