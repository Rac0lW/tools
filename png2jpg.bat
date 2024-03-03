
@echo off
setlocal enabledelayedexpansion

:: 设置源文件夹和目标文件夹路径
set "SOURCE_DIR=G:\SteamLibrary\steamapps\common\This War of Mine\Portraits"
set "TARGET_DIR=G:\SteamLibrary\steamapps\common\This War of Mine\Portraits"

:: 如果目标文件夹不存在，则创建它
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

:: 转换文件夹中的所有PNG文件为JPEG
for %%F in ("%SOURCE_DIR%\*.png") do (
    set "FILENAME=%%~nF"
    ffmpeg -i "%%F" -qscale:v 2 "%TARGET_DIR%\!FILENAME!.jpg"
)

echo Conversion complete.
pause
