for /f "tokens=*" %%a in ('dir /b /s *.flv') do ffmpeg -i "%%a" -map_metadata -1 -vcodec copy -acodec copy "%%~pna.mp4"