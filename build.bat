@echo off
echo Building Recast...
python -m pip install pyinstaller >nul 2>&1
python -m PyInstaller --onefile --windowed --name Recast src/main.py
echo.
echo Done! Executable is at dist\Recast.exe
pause
