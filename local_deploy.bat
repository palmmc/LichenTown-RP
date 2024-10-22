@echo off

:: Log to deploy.log
set log_file=deploy.log

echo. > %log_file%
:: Read configuration
echo Reading config.json... >> %log_file%
for /f "tokens=*" %%i in ('powershell -command "Get-Content config.json | ConvertFrom-Json | Select-Object -ExpandProperty closeOnCompletion"') do set closeOnCompletion=%%i
for /f "tokens=*" %%i in ('powershell -command "Get-Content config.json | ConvertFrom-Json | Select-Object -ExpandProperty destinationFolder"') do set destinationFolder=%%i

:: Define folders
set source_folder=".\build"
set server_folder=".\server"

:: Check for valid paths
echo Found valid destination path. >> %log_file%
if not exist "%destinationFolder%" mkdir "%destinationFolder%"
if not exist "%server_folder%" mkdir "%server_folder%"

:: Iterate copy files
for /d %%d in ("%source_folder%\*") do (
    xcopy /E /Y "%%d" "%destinationFolder%\%%~nxd" 2>> %log_file%
    if errorlevel 0 (
        echo ^> PACK: %%~nxd was copied successfully! >> %log_file%
    ) else (
        echo Error: Failed to copy %%~nxd >> %log_file%
    )

    :: Check for existing release
    set "zip_file=%server_folder%\%%~nxd-latest.zip"

    :: Remove existing release
    if exist "!zip_file!" (
        echo Deleting existing zip file: !zip_file! >> %log_file%
        del "!zip_file!" 2>> %log_file%
        if errorlevel 1 (
            echo Error: Failed to delete existing zip file: !zip_file! >> %log_file%
        )
    )

    :: Archive latest release
    powershell -command "Compress-Archive -Path '%%d\*' -DestinationPath '%server_folder%\%%~nxd-latest.zip' -Force" 2>> %log_file%
    if errorlevel 0 (
        echo ^> ZIP: %%~nxd was zipped and moved to server successfully! >> %log_file%
    ) else (
        echo Error: Failed to zip and move %%~nxd >> %log_file%
    )
)

echo. >> %log_file%
certutil -hashfile "./server/Palms-Tidbits-latest.zip" SHA1 >> %log_file%

echo. >> %log_file%
echo Pack compilation successful! >> %log_file%

:: Check if it should close when finished
if "%closeOnCompletion%"=="False" (
    @pause
)