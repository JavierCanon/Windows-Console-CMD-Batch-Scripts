REM This script uses FFPLAY to display vectorscope
REM with waveform parade and luma of a window capture
REM Copyright (c) 2018 Jacob Maximilian Fober
REM This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
REM (CC BY-SA 4.0) https://creativecommons.org/licenses/by-sa/4.0/
echo off
cls
title=JMF Grading Scopes (window capture)
set /a cpuT=%NUMBER_OF_PROCESSORS%*3/2
call :logo
echo  浜様様様様様様様様様様様様様様融
echo  �To reset captured window name,�
echo  �please close the scope window.�
echo  藩様様様様様様様様様様様様様様夕
call :instruction
:scope
set /p name="Please enter window name to capture> "
ffplay -hide_banner -threads %cpuT% -f gdigrab -framerate 11 ^
-i title=%name% -window_title^
 "JMF Grading Scopes - %name% - window capture" ^
-vf split=3[vector][wave][source],^

[vector]^
format=yuv444p9,^
vectorscope=mode=color3:graticule=color:colorspace=601,^
drawbox=w=5:h=5:t=2:x=208-2:y=194-2:c=sienna@0.8,^
drawbox=w=5:h=5:t=2:x=218-2:y=207-2:c=sienna@0.8,^
drawbox=w=5:h=5:t=2:x=234-2:y=227-2:c=sienna@0.8,^
drawbox=w=5:h=5:t=2:x=244-2:y=241-2:c=sienna@0.8,^
drawbox=w=4:h=4:t=1:x=317-2:y=364-2:c=skyblue@0.8^
[vector],^

[wave]^
scale=256:ih,^
split=2[parade][luma],^

[parade]^
format=gbrp,^
waveform=filter=lowpass:i=0.02:components=7:display=overlay^
[parade],^

[luma]^
format=yuva444p,^
waveform=filter=lowpass:scale=ire:graticule=green:flags=numbers+dots^
[luma],^

[parade][luma]hstack^

[wave],^

[source]^
scale=496:112:force_original_aspect_ratio=decrease,^
pad=w=512:h=128:x=-1:y=-1,^
format=gbrp,^
format=yuva444p^
[source],^

[vector][wave][source]vstack=inputs=3
if errorlevel 9009 (
	cls
	title=JMF Grading Scopes - Error
	ffplay
	echo.
	echo Missing FFplay.exe software.
	echo Please check your user Environment Variables in system settings.
	echo.
	echo You can download FFplay packages at:
	echo https://ffmpeg.org
	echo.
	echo ...press any key to visit download website
	pause
	start http://ffmpeg.zeranoe.com/builds/
)
cls
call :instruction
goto :scope
:logo
echo Made by...
echo  炳栩栩栩栩栩     栩栩栩�       栩栩栩� 炳栩栩栩栩栩栩栩栩桀
echo  異朮臆臆臆菓�   栩臆臆菓�     栩臆臆菓� 越朮臆臆臆臆臆臆菓桀
echo  碓栩憶臼臼渦栩 樂朮臼臼菓�   栩憶臼葦菓� 異朮憶臼臼渦栩栩栩桀
echo  憶 栩栩栩憶渦栩� 栩臆屋渦栩 栩憶臆臼葦菓� 異朮屋旭葦渦栩椣  �
echo  濂� 烝烝栩屋渦栩� 栩菓屋渦栩朮渦菓臆碓渦栩 異朮憶葦臆臆栩� 芦
echo   濂碓  芦栩屋渦栩� 炳栩臆渦臆渦菓栩臆碓渦栩 異朮屋渦栩栩栩椡�
echo    濂移葦屋栩屋渦栩旭澎栩臆碓渦菓朧栩臆碓渦栩 異朮屋渦栩� 碓烝
echo     炳栩臼碓栩屋渦栩旭� 栩臆渦菓� � 栩臆渦菓桎旭栩臆芦菓� 憶
echo     栩菓栩栩栩朮葦菓朧� 異朮臆栩 芦� 栩臆菓� 碓  栩臆菓桎 菓
echo    栩臆臆臆臆臆屋葦菓朮� 異朮栩� 渦� 異朮栩 芦�   栩菓� 胃�
echo   栩朮憶臼臼臼臼臼臼菓霸� 異栩� 芦濂�  栩�  芦芦�  栩�  �
echo   円栩栩栩栩栩栩栩栩栩栩�   �   貨 澎   �   円 濂�  �  葦
echo   屋�                  円�  �  貨   濂  �  貨   濂� � 芦�
echo   朧臆臼旭        旭葦渦 濂芦芦�     濂芦芦�     濂渦芦�JMF...
echo    朮臆憶臼旭  旭葦渦臆�  濂臆�       濂臆�       濂臆�
echo     烝烝烝烝    烝烝烝烝   炳�         炳�         炳�
echo.
goto :eof
:instruction
echo.
echo  Key bindings:
echo  敖陳陳陳賃陳陳陳陳陳陳陳陳陳陳�
echo  �"Q",ESC � Quit              �
echo  �"F"     � Toggle full-screen�
echo  �"P",SPC � Pause             �
echo  青陳陳陳珍陳陳陳陳陳陳陳陳陳陳�
echo.
