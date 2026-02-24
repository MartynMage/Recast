@echo off
echo Building Recast...
pip install pyinstaller >nul 2>&1
pyinstaller --onefile --windowed --name Recast --icon=assets/icon.ico src/main.py
echo.
echo Done! Executable is at dist\Recast.exe
pause
