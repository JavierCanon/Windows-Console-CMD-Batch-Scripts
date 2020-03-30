@echo on
::-------------------------------------------::
:: Arma3 Backup Script                       ::
:: Made by Orbitus for MRU an nirownation.de ::
:: If you need help contact me               ::
:: info@orbitus-esport.de                    ::
::-------------------------------------------::

:: Variables
:: Do you want to use the File Backup?
set _usefilebackup=true
:: Where do you want to save the backups
set _backupdir=I:\A3Backups
:: Where is your game directory
set _gamedir=I:\A3Tanoa
:: Where is your directory for the logs of A3
set _logdir=I:\A3Tanoa\SC
:: MySQL Data
:: Turn MySQL Backup on/off! If you set it to true(on) then you have to provide youre MySQL Data
set _usemysqlbackup=true

:: Login and Database
set _dbuser=exile
set _dbpassword=password
set _database=exile
set _dbhost=127.0.0.1
set _dbport=3306
:: Here you have to define the path to your bin directory of mysql where the mysqldump.exe is
set _mysqlpath=C:\Program Files\MySQL\MySQL Server 5.7\bin

:: Backup Timestamp
set _backuptime=%DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4%_%TIME:~0,2%-%TIME:~3,2%

:: Here you can define if you want a full backup or only a backup of @mods,mpmissions directory 
set _fullbackup=true
:: Custom Directorys? You want to save some custom directories? Heres a place to define them
set _usecustomdirectory=false
set _customdir01=C:\path\to\custom\dir01
set _customdir02=C:\path\to\custom\dir02
set _customdir03=C:\path\to\custom\dir03
set _customdir04=C:\path\to\custom\dir04
set _customdir05=C:\path\to\custom\dir05


:: Backup Script
echo Your backup will be saved at: %_backupdir%\%_backuptime%
echo Your chosen Game directory is: %_gamedir%
echo Is everything alright? If not you have no time to interrupt the backup by closing this window

:: Sleep 10 seconds
ping -n 10 127.0.0.1 > NUL

:: Create Backup Directory
mkdir %_backupdir%\%_backuptime%\files
mkdir %_backupdir%\%_backuptime%\mysql
echo Backup directory created...
echo Backup files into chosen directory ...

:: Sleep 10 seconds
ping -n 10 127.0.0.1 > NUL

if %_usemysqlbackup% == true GOTO MYSQLBACKUP
REM Mysql Backup skipped
	GOTO FILEBACKUP
:MYSQLBACKUP
REM Starting MySQL Backup
%_mysqlpath%\mysqldump.exe -P %dbport% -h %dbhos% -u%_dbuser% -p%_dbpassword% %_database% > %_backupdir%\%_backuptime%\mysql\%_database%_backup.sql

:: Sleep 10 seconds
ping -n 10 127.0.0.1 > NUL
:FILEBACKUP
if %_usefilebackup% == true GOTO FILEBACKUP2
REM File Backup skipped
	GOTO END
:FILEBACKUP2
REM Starting File Backup
:: Sleep 10 seconds
ping -n 10 127.0.0.1 > NUL
if %_fullbackup%  == true GOTO FULLBACKUP
REM Only the important Data will be saved! For Fullbackup change variable _fullbackup to true!
