


SoundVolumeView v1.85
Copyright (c) 2013 - 2019 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

SoundVolumeView is a simple tool for Windows Vista/7/8/2008/10 that
displays general information and current volume level for all active
sound components on your system, and allows you to mute and unmute them
instantly.
SoundVolumeView also allows you to save a sound profile into a file,
containing the current volume level and the mute/unmute state of all
sound components, as well as the default sound devices, and then later,
load the same file to restore exactly the same volume levels and settings.
There is also extensive command-line support, which allows you to
save/load profiles, change current volume of every sound component, and
mute/unmute every sound component, without displaying any user interface.



System Requirements
===================

This utility works on Windows Vista, Windows 7, Windows 8, Windows 2008,
and Windows 10. Both 32-bit and 64-bit systems are supported.
Windows XP and older systems are not supported.



Versions History
================


* Version 1.85:
  o Added new command-line options: /SetListenToThisDevice ,
    /SetPlaybackThroughDevice , /RunAsAdmin

* Version 1.83:
  o Fixed bug: SoundVolumeView failed to remember the last
    size/position of the properties window if it was not located in the
    primary monitor.
  o You can now send the data to stdout by specifying empty string as
    filename, for example:
    SoundVolumeView.exe /scomma "" | more

* Version 1.82:
  o You can now resize the properties window, and the last
    size/position of this window is saved in the .cfg file.

* Version 1.81:
  o Added /ChangeVolumeChannel command-line option, for changing the
    volume of specific channel.

* Version 1.80:
  o Added 'Selected Channel' option (Under the Options menu). If you
    want to change the volume of specific channel, you can choose the
    desired channel from this menu, and then use the Increase/Decrease
    1%/5%/10% options (under the Volume menu) or the mouse wheel to
    change the volume of the selected channel.

* Version 1.75:
  o Added support for setting the volume of specific channels for
    specific application from command-line. For example, the following
    command sets the volume of the left channel to 50% only for Chrome
    Web browser:
    SoundVolumeView.exe /SetVolumeChannels "chrome.exe" 50 100
  o Also, the current channels volume of application is displayed in
    the 'Channels Percent' column.
  o Added 'focusedname' to all command-line options, which allows you
    to change the volume all instances of the focused application.
  o Fixed bug: When using 'focused' in command-line and but there was
    no focused application, SoundVolumeView changed the 'System Sounds'
    items.

* Version 1.72:
  o Added 'Align Numeric Columns To Right' option.

* Version 1.71:
  o You can now specify "DefaultCaptureDevice" and
    "DefaultRenderDevice" in the [Name] parameter of all command-line
    options in order to refer the default render/capture device.

* Version 1.70:
  o Added /WaitForItem command-line option, which instructs
    SoundVolumeView to wait until the sound item appears. You can use
    this feature to change the application volume for applications that
    are currently not running. For example, if you want to mute the sound
    of Chrome Web browser and it's not running at this moment:
    SoundVolumeView.exe /Mute chrome.exe /WaitForItem 0
  o Disabled devices are now displayed with disabled icon.

* Version 1.66:
  o Added /GetPercentChannel command-line option.

* Version 1.65:
  o Added 'Command-Line Friendly ID' column. You can use the string
    displayed in this column in all command-line options when you have
    multiple items with the same name (For example: 2 'Speakers'
    devices). This ID is more friendly than the ID provided by Windows
    operating system ('Item ID' column), for example: "Realtek High
    Definition Audio\Device\Speakers" and "2- USB
    AUDIO\Device\Microphone".

* Version 1.60:
  o Added 'Disable Device' and 'Enable Device' options.
  o Added 'Show Disabled Devices' option, when it's turned on,
    SoundVolumeView displays disabled items.
  o Added 'Device State' column - Displays whether a device is active
    or disabled.
  o Added new command-line options - /Disable , /Enable ,
    /DisableEnable

* Version 1.57:
  o Added 'Copy Mute/Unmute Command' option (Ctrl+M), which copies to
    the clipboard a command to mute and unmute the selected sound
    component (Using the /Switch command-line option).

* Version 1.56:
  o Added /ChangeVolumeDecibel command-line option, which allows you
    to increase/decrease the volume of devices and subunits in Decibel,
    for example:
    SoundVolumeView.exe /ChangeVolumeDecibel "Microphone Boost" -10

* Version 1.55:
  o Added 'Decrease Volume Step (dB)' (Ctrl+7) and 'Increase Volume
    Step (dB)' (Ctrl+8) options which increase/decrease the volume
    accoding to the default volume step displayed in 'Volume Step' column.
  o Added 'Export All Items' option.

* Version 1.50:
  o Added 'Direction' column (Capture or Render)
  o Added /SetVolumeChannelsDecibel command-line option, which allows
    you to set the channel volume of devices and subunits in Decibel, for
    example:
    SoundVolumeView.exe /SetVolumeChannelsDecibel "Speakers" -20.5 -18.5
  o Added /SetVolumeDecibel command-line option, which allows you to
    set the volume of devices and subunits in Decibel, for example:
    SoundVolumeView.exe /SetVolumeDecibel "Speakers" -14
  o Added Subunits of capture devices (Like 'Microphone Boost')
  o You can set the 'Microphone Boost' value from command-line, for
    example:
    SoundVolumeView.exe /SetVolumeDecibel "Microphone Boost" 30
  o Fixed bug: When using '*' with devices on /SetVolumeChannels
    command-line option, SoundVolumeView set the volume channel to zero
    instead of leaving it without change.

* Version 1.45:
  o Added 'Save Sound Profile - Selected Items' option (Alt+S), which
    creates a profile only from the items you select.

* Version 1.43:
  o Added /GetMute command-line option that returns the current Mute
    status.

* Version 1.42:
  o Added option to return the current volume level in percent (for
    using in scripts and batch files). The return value is the percent
    value multiplied by 10, for example:
    SoundVolumeView.exe /GetPercent Speakers
    echo %errorlevel%

* Version 1.41:
  o Added option to set the percent of change for every wheel move in
    the 'Change Volume With Mouse Wheel' option ('Mouse Wheel % Change'
    menu)

* Version 1.40:
  o Added 'Change Volume With Mouse Wheel' option, which allows you
    to increase/decrease the volume of selected items by scrolling the
    mouse wheel. You can choose to change the volume with the mouse wheel
    when the Ctrl key is down or when the left mouse button is down or
    when the middle button is down. The default option is 'When Ctrl key
    is down'.

* Version 1.36:
  o You can now specify only a part of name or id of the sound item
    in all command-line options ( /SetVolume, /Mute , /Unmute , and so
    on...), for example: If ID of a subunit is
    "{2}.\\?\hdaudio#func_01&ven_10ec&dev_0889&subsys_1458a002&rev_1000#4&3
    828eb94&0&0201#{6994ad04-93ef-11d0-a3cc-00a0c9223196}\singlelineouttopo
    /0002000c" , the following command will mute this subunit:
    SoundVolumeView.exe /Mute "singlelineouttopo/0002000c"

* Version 1.35:
  o Added 'Auto Size Columns On Update' option.

* Version 1.33:
  o You can now use the /SetVolumeChannels command-line option with
    devices.

* Version 1.32:
  o Added option to set from command-line the volume of focused
    application, for example:
    SoundVolumeView.exe /SetVolume focused 50

* Version 1.31:
  o Fixed bug: When there were multiple application volume items of
    the same process filename, and you tried to set one of them,
    SoundVolumeView set the wrong item.

* Version 1.30:
  o SoundVolumeView now displays the process names (Some of them
    without the full path) for most processes when you run it without
    elevation ('Run As Administrator').
  o Fixed the Ctrl+C (Copy Selected Items) key.
  o You can now specify the process ID in the /SetVolume
    /ChangeVolume /Mute /Unmute /Switch command-line options.

* Version 1.27:
  o Added 'Run As Administrator' option (Ctrl+F11), for viewing the
    icon and information of applications running as admin.

* Version 1.26:
  o Added /SwitchDefault command-line option, which allows you to
    switch between 2 default devices, for exmaple:
    SoundVolumeView.exe /SwitchDefault
    "{0.0.0.00000000}.{a77a09b2-1ec6-49c3-860a-68945904a2f1}"
    "{0.0.0.00000000}.{7747b192-73b2-47d3-a2c0-168e94af7f9e}" 0


* Version 1.25:
  o Added option to set from command-line the volume of all
    applications at once, for example:
    SoundVolumeView.exe /SetVolume AllAppVolume 50

* Version 1.22:
  o Fixed bug: SoundVolumeView failed to remember the last
    size/position of the main window if it was not located in the primary
    monitor.

* Version 1.21:
  o Added 'Always On Top' option.

* Version 1.20:
  o Added 'Process ID' and 'Window Title' columns (For application
    volume items).

* Version 1.15:
  o Added 'Copy Item ID' and 'Copy Item Name' options.

* Version 1.13:
  o Added accelerator keys to the 'Set Default' options.

* Version 1.12:
  o Fixed issue: /SaveProfile command-line option failed to save the
    sound settings file when running it from a batch file without
    specifying the full path of the sound settings file.

* Version 1.11:
  o Added option to choose another font (font name and size) to
    display the sound components list. (Options -> Select Another Font)

* Version 1.10:
  o Added 'Sort On Every Update' option. If it's turned on,
    SoundVolumeView will sort the list every time that a new item is
    added or an existing item is updated.

* Version 1.06:
  o Added 'Start As Hidden' option. When this option and 'Put Icon On
    Tray' option are turned on, the main window of SoundVolumeView will
    be invisible on start.
  o Added 'Clear Recent Files List' option.

* Version 1.05:
  o Added 'Set Default' options (Under the Volume menu) to set the
    default device.
  o Added documentation for /SetDefault command-line option (It was
    exist on v1.00, but I forgot to add it to the help file of
    SoundVolumeView...)

* Version 1.00 - First release.



Start Using SoundVolumeView
===========================

SoundVolumeView doesn't require any installation process or additional
dll files. In order to start using it, simply run the executable file -
SoundVolumeView.exe

After running SoundVolumeView, the main window is displays all sound
items found in your systems. There are 3 types of items: devices,
subunits, and application volume.
For every item, the current volume level is displayed in percent unit.
For devices and subunits, the volume level is also displayed in Decibel.
For subunits, the volume level is displayed for every channel separately.



Increase/Decrease/Mute Volume
=============================

In the main window of SoundVolumeView, you can select one or more items,
and then mute, unmute, increase, or decrease the volume of selected
items, using accelerator keys:
* Mute - F7
* Unmute - F8
* Mute/Unmute switch - F9
* Decrease volume 1% - Ctrl+1
* Increase volume 1% - Ctrl+2
* Decrease volume 5% - Ctrl+3
* Increase volume 5% - Ctrl+4
* Decrease volume 10% - Ctrl+5
* Increase volume 10% - Ctrl+6

The Increase/Decrease options can also be used for specific channel. In
order to do that, choose the desired channel from Options -> Selected
Channel.



Sound Profiles
==============

SoundVolumeView allows you to save all your current sound settings into a
sound profile filename, and then load it later when you want to restore
these settings.
The sound profile file stores the following information:
* Volume level of all active sound components on your system. (Devices,
  Subunits, and application volume) For Subunits, the volume level of
  every channel is stored separately.
* Mute/Unmute state of all active sound components on your system.
  (Devices, Subunits, and application volume)
* Default render/capture device.

You can save and load sound profiles by using the 'Save Sound Profile'
and 'Load Sound Profile' options under the File menu, or by using the
/SaveProfile and /LoadProfile command-line options. There is also a
recent menu located under the File menu, which allows you to easily load
the last 10 sound profiles you used, as well as you can also load the
recent 5 sound profiles from the tray menu (If the tray icon is turned on)

Be aware that sound profiles are bound to specific computer and its
devices. You cannot save a sound profile in one computer and then load it
into another computer.



Command-Line Options
====================

You can use the command-line options below to change the volume level and
mute/unmute status of every sound component on your system.
In the [Name] parameter , you can specify one of the following fields:
* The name of the item, as appeared under the 'Name' column. (If you
  have multiple items with identical name, you should use the ID field.)
* The ID of the item, as appeared under the 'Item ID' column.
* The ID of the item, as appeared under the 'Command-Line Friendly ID'
  column (This ID is generated by SoundVolumeView and it's designed to be
  more friendly than the 'Item ID' column)
* You can also specify only a part of the 'Name' or 'Item ID'. For
  example, if the device name is 'Speakers1', specifying 'Speakers' will
  also work.
* For sound devices (Type = 'Device'), you can also use the value
  specified under the 'Device Name' column.
* For application items (type = 'Application), you can also specify the
  process filename, (for example: firefox.exe) or the process ID (for
  example: 3271).
* You can specify 'AllAppVolume' to change the volume of all
  applications at once. For example, in order to set the volume of all
  applications to 100%:
  SoundVolumeView.exe /SetVolume AllAppVolume 100
* You can specify 'Focused' to change the volume of focused application.
* You can specify 'FocusedName' to change the volume of all instances
  of focused application.
* You can specify "DefaultCaptureDevice" and "DefaultRenderDevice" in
  order to refer the default render/capture device.



/GetPercent [Name]
Returns the current volume level in percent, multiplied by 10, for using
in scripts and batch files.

/GetMute [Name]
Returns the current Mute status. (1 = Muted, 0 = Not Muted)

/GetPercentChannel [Name] [Channel Number]
Returns the current volume level of specific channel in percent,
multiplied by 10. In the [Channel Number] parameter you should specify 0
for the first channel, 1 for the second channel, and so on...

/SetVolume [Name] [Volume]
Set the sound volume of the specified item. The [Volume] is a number
between 0 and 100.

/SetVolumeDecibel [Name] [Volume]
Set the sound volume of the specified item. The [Volume] is in decibels.

/ChangeVolumeDecibel [Name] [Volume]
Increase/decrease the sound volume of the specified item. The [Volume] is
in decibels.

/SetVolumeChannels [Name] [Volume Channel 1] [Volume Channel 2] ...
Set the sound volume of every channel separately. The [Volume Channel X]
is a number between 0 and 100, or '*' if you don't want to change the
volume of this channel.

/SetVolumeChannelsDecibel [Name] [Volume Channel 1] [Volume Channel 2] ...
Only for subunit and device items. Set the sound volume of every channel
separately. The [Volume Channel X] is the volume in Decibels , or '*' if
you don't want to change the volume of this channel.

/ChangeVolume [Name] [Volume]
Changes the volume of the specified item. The [Volume] is a number
between -100 and 100, which specifies the percent of volume level to
increase (positive number) or decrease (negative number).

/ChangeVolumeChannel [Name] [Channel Number] [Volume]
Changes the channel volume of the specified item. In the [Channel Number]
parameter you should specify 0 for the first channel, 1 for the second
channel, and so on...
The [Volume] is a number between -100 and 100, which specifies the
percent of volume level to increase (positive number) or decrease
(negative number).

/Mute [Name]
Mutes the volume of the specified item.

/Unmute [Name]
Unmutes the volume of the specified item.

/Disable [Name]
Disables the specified device

/Enable [Name]
Enables the specified device

/DisableEnable [Name]
Switches the specified device between active and disabled state.

/Switch [Name]
Switches the volume of the specified item between mute and unmute state.

/SetDefault [Name] [Default Type]
Sets the default device.
The [Default Type] parameter specifies one of the following values:
0 - Console
1 - Multimedia
2 - Communications

/SwitchDefault [Name1] [Name2] [Default Type]
Switch between 2 default devices.
The [Default Type] parameter specifies one of the following values:
0 - Console
1 - Multimedia
2 - Communications

/SetListenToThisDevice [Name] [0 | 1]
Sets the 'Listen to this device' value (For recording devices only).
0 = No, 1 = Yes.
You must run SoundVolumeView as administrator in order to the set the
'Listen to this device' value.
Example: SoundVolumeView.exe /RunAsAdmin /SetListenToThisDevice
"Microphone" 1

/SetPlaybackThroughDevice [Recording Device] [Playback Device]
Sets the 'Playback through this device' value.
You must run SoundVolumeView as administrator in order to the set the
'Playback through this device' value.
Example: SoundVolumeView.exe /RunAsAdmin /SetPlaybackThroughDevice
"Microphone" "{0.0.0.00000000}.{7747b192-73b2-47d3-a2c0-168e94af7f9e}"

/RunAsAdmin
Runs SoundVolumeView as administrator (for using with
/SetPlaybackThroughDevice and /SetListenToThisDevice command-line options)

/WaitForItem [Number Of Seconds]
Instructs SoundVolumeView to wait the specified number of seconds until
the sound item appears. You can use this feature to change the
application volume for applications that are not running at this moment.
For example, if you want to mute the sound of Chrome Web browser and it's
not running at this moment:
SoundVolumeView.exe /Mute chrome.exe /WaitForItem 5000

In the above exmaple, SoundVolumeView will wait up to 5000 seconds (The
process will remain in memory). If during the 5000 seocnds period you run
the Chrome Web browser, SoundVolumeView will detect it, mute the sound of
Chrome application and then the process of SoundVolumeView will be
terminated. You can specify 0 in [Number Of Seconds] if you want to wait
infinitely.

/SaveProfile [Filename]
Saves the current sound settings into the specified profile filename.

/LoadProfile [Filename]
Restores the sound settings from the specified profile filename.

Here's some examples:
* SoundVolumeView.exe /GetPercent "Speakers"
* SoundVolumeView.exe /GetPercentChannel "Speakers" 0
* SoundVolumeView.exe /GetMute "Speakers"
* SoundVolumeView.exe /SetVolume
  "{0.0.0.00000000}.{a77a09b2-1ec6-49c3-860a-68945904a2f1}" 15
* SoundVolumeView.exe /SetVolume "Speakers" 22.5
* SoundVolumeView.exe /SetVolume "High Definition Audio
  Device\Device\Speakers" 50
* SoundVolumeView.exe /SetVolume AllAppVolume 100
* SoundVolumeView.exe /SetVolumeDecibel "Speakers" -11
* SoundVolumeView.exe /ChangeVolume "Front Green In" -10
* SoundVolumeView.exe /ChangeVolume
  "{2}.\\?\hdaudio#func_01&ven_10ec&dev_0889&subsys_1458a002&rev_1000#4&382
  8eb94&0&0201#{6994ad04-93ef-11d0-a3cc-00a0c9223196}\singlelineouttopo/000
  2000c&" 5
* SoundVolumeView.exe /ChangeVolumeChannel "vlc.exe" 0 -20
* SoundVolumeView.exe /Mute "singlelineouttopo/0002000c&"
* SoundVolumeView.exe /Mute "DefaultRenderDevice"
* SoundVolumeView.exe /SetVolumeChannels "Front Pink In" 45 55
* SoundVolumeView.exe /SetVolumeChannels "Front" * 60 * 40
* SoundVolumeView.exe /SetVolumeDecibel "Microphone Boost" 20
* SoundVolumeView.exe /ChangeVolumeDecibel "Microphone Boost" 10
* SoundVolumeView.exe /Mute "Firefox.exe"
* SoundVolumeView.exe /Mute "Firefox.exe" /WaitForItem 3600
* SoundVolumeView.exe /SetVolume "chrome.exe" 75
* SoundVolumeView.exe /SetVolumeChannels "chrome.exe" 50 100
* SoundVolumeView.exe /Unmute "VLC media player"
* SoundVolumeView.exe /Switch "C:\Program Files\Firefox.exe"
* SoundVolumeView.exe /Switch 3217
* SoundVolumeView.exe /Switch Focused
* SoundVolumeView.exe /Switch FocusedName
* SoundVolumeView.exe /Switch "Realtek High Definition
  Audio\Device\Speakers"
* SoundVolumeView.exe /DisableEnable Speakers
* SoundVolumeView.exe /SetDefault
  "{0.0.0.00000000}.{a77a09b2-1ec6-49c3-860a-68945904a2f1}" 0
* SoundVolumeView.exe /SetDefault
  "{0.0.0.00000000}.{a77a09b2-1ec6-49c3-860a-68945904a2f1}" 1
* SoundVolumeView.exe /SetDefault "DENON-AVAMP" 1
* SoundVolumeView.exe /SwitchDefault
  "{0.0.0.00000000}.{a77a09b2-1ec6-49c3-860a-68945904a2f1}"
  "{0.0.0.00000000}.{7747b192-73b2-47d3-a2c0-168e94af7f9e}" 0
* SoundVolumeView.exe /SaveProfile "C:\Temp\Profile1.spr"
* SoundVolumeView.exe /LoadProfile "C:\Temp\Profile2.spr"

You can also use the following command-line parameters to export the list
of all sound items info a file:

/stext <Filename>
Save the list of all sound items into a regular text file.

/stab <Filename>
Save the list of all sound items into a tab-delimited text file.

/scomma <Filename>
Save the list of all sound items into a comma-delimited text file (csv).

/stabular <Filename>
Save the list of all sound items into a tabular text file.

/shtml <Filename>
Save the list of all sound items into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all sound items into HTML file (Vertical).

/sxml <Filename>
Save the list of all sound items into XML file.



Translating SoundVolumeView to other languages
==============================================

In order to translate SoundVolumeView to other language, follow the
instructions below:
1. Run SoundVolumeView with /savelangfile parameter:
   SoundVolumeView.exe /savelangfile
   A file named SoundVolumeView_lng.ini will be created in the folder of
   SoundVolumeView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run SoundVolumeView, and all
   translated strings will be loaded from the language file.
   If you want to run SoundVolumeView without the translation, simply
   rename the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
