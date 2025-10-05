@echo off
echo ================================================
echo  Installing Dependencies
echo ================================================
echo.

echo [1/2] Installing Backend Dependencies...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Backend installation failed!
    pause
    exit /b 1
)

echo.
echo [2/2] Installing Frontend Dependencies...
cd ..\frontend
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Frontend installation failed!
    pause
    exit /b 1
)

echo.
echo ================================================
echo  Installation Complete!
echo ================================================
echo.
echo You can now run: start-dev.bat
echo.
pause
