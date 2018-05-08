@echo off
ATTRIB -R BINGO.*
comprime -F -EX -SZAPTUDO BINGO.ZIP
ATTRIB +R BINGO.ZIP
MD \BACKUP >NUL
copy BINGO.ZIP \backup
copy BINGO.ZIP M:\backup
Echo.
echo.
echo 
