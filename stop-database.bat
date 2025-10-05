@echo off
echo ========================================
echo  Stopping Database Containers
echo ========================================
echo.

docker-compose down

echo.
echo Database containers stopped.
echo.
pause
