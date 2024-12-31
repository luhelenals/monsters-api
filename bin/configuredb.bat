@echo off
REM PostgreSQL credentials and configuration
SET DB_HOST=localhost
SET DB_USER=postgres
SET DB_PASS=postgres123
SET DB_NAME=monstersdb

REM Set the PGPASSWORD environment variable to automatically provide the password
SET PGPASSWORD=%DB_PASS%

REM Disconnect any active connections to the Monsters database
echo Terminating active connections to %DB_NAME%...
psql -h %DB_HOST% -U %DB_USER% -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '%DB_NAME%' AND pid <> pg_backend_pid();"
if errorlevel 1 (
    echo "Error: Failed to terminate active connections."
    pause
    exit /b 1
)

REM Drop the database
echo Dropping the database...
psql -h %DB_HOST% -U %DB_USER% -d postgres -c "DROP DATABASE IF EXISTS %DB_NAME%;"
if errorlevel 1 (
    echo "Error: Failed to drop the database."
    pause
    exit /b 1
)

REM Recreate the database
echo Creating the database...
psql -h %DB_HOST% -U %DB_USER% -d postgres -c "CREATE DATABASE %DB_NAME%;"
if errorlevel 1 (
    echo "Error: Failed to create the database."
    pause
    exit /b 1
)

REM Run the SQL file
echo Executing the SQL file...
psql -h %DB_HOST% -U %DB_USER% -d %DB_NAME% -f bin/sql/monsters.sql
if errorlevel 1 (
    echo "Error: Failed to execute the SQL file."
    pause
    exit /b 1
)

echo "Database reset successfully!"
pause
