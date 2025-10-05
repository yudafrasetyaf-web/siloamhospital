@echo off
echo ================================================
echo  Setting Up Environment Files
echo ================================================
echo.

echo Creating .env files...

if not exist ".env" (
    copy .env.example .env
    echo Created root .env
)

cd backend
if not exist ".env" (
    copy .env.example .env
    echo Created backend .env
)

cd ..\frontend
if not exist ".env.local" (
    copy .env.local.example .env.local
    echo Created frontend .env.local
)

cd ..

echo.
echo ================================================
echo  Environment files created!
echo ================================================
echo.
echo IMPORTANT: Edit the .env files with your settings:
echo  - backend\.env - Set your database credentials
echo  - frontend\.env.local - Set API URL
echo.
pause
