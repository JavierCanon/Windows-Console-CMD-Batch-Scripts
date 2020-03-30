@echo off
pushd .
for %%a in (*.pdf) do (
   call p.bat "%%~fa"
)
