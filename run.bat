@echo off
SETLOCAL

REM List of IDE directories to clean
SET IDE_LIST=("WebStorm" "IntelliJ" "CLion" "Rider" "GoLand" "PhpStorm" "Resharper" "PyCharm")

REM Loop through each IDE in the list and remove license-related files
FOR %%IDE IN %IDE_LIST% DO (
    FOR /D %%dir IN ("%USERPROFILE%\.%%IDE*") DO (
        REM Check if 'eval' directory exists and delete it
        IF EXIST "%%dir\config\eval" (
            ECHO Removing eval folder in %%dir
            RD /S /Q "%%dir\config\eval"
        )
        REM Check for 'other.xml' file and delete it
        IF EXIST "%%dir\config\options\other.xml" (
            ECHO Deleting other.xml in %%dir
            DEL /Q "%%dir\config\options\other.xml"
        )
    )
)

REM Remove JetBrains folder in APPDATA if present
IF EXIST "%APPDATA%\JetBrains" (
    ECHO Cleaning up JetBrains folder in APPDATA
    RMDIR /S /Q "%APPDATA%\JetBrains"
)

REM Remove JavaSoft registry key for JetBrains licenses
ECHO Deleting JavaSoft registry key
REG DELETE "HKEY_CURRENT_USER\Software\JavaSoft" /f

ENDLOCAL
