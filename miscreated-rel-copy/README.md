# Miscreated Live Release Copy CMD Script

I've created this script to help Miscreated QA Testers maintain separate copies
of the game for testing and playing the live release, respectively, and to help
avoid potentially large downloads every time the want to switch between the
environments.

You will only need to execute this script to update your release copy once every
time an update or hotfix is released by the dev team.

## How to use this script
Download both [miscreated-rel-copy.cmd](https://github.com/Spafbi/MyGameSettings/raw/master/miscreated-rel-copy/miscreated-rel-copy.cmd) and [shortcut.exe](https://github.com/Spafbi/MyGameSettings/raw/master/miscreated-rel-copy/Shortcut.exe) by right-mouse-clicking the links and selecting _Save link as..._ and save them both to the same local directory on your computer.

Use a text editor, such as `notepad`, to edit the `MISDIR` and `RELDIR` variables
in the `miscreated-rel-copy.cmd` file to reflect the locations where your
Miscreated game copies will be located.

 * `MISDIR` is the variable defining the path where your Steam library version
 of Miscreated is installed. 
 * `RELSDIR` is the variable defining the path where you wish to maintain your
 _live release_ version of the game. 

The two lines you need to edit are seen in the following example and reflect the
values on my personal computer; your locations will likely differ. 

```
set MISDIR=D:\Program Files (x86)\Steam\steamapps\common\Miscreated
set RELDIR=D:\Games\Miscreated
```

Whenever you need to update the live release copy of the game, execute the
`miscreated-rel-copy.cmd` script by using your mouse to click (or double-click) 
the script, and then follow the onscreen instructions.

### Note: `Shortcut.exe`
Watch for the following message in the output of the script's console:
```
'shortcut' is not recognized as an internal or external command,
operable program or batch file.
```
If you happen to see that message, a quick fix is to close the console window,
copy `shortcut.exe` to your `C:\Windows\System32` directory, and re-run the
script.

#### Explanation
That message occurs if for some reason the script cannot find `shortcut.exe`
in locations provided by the `PATH` environment variable. While it _should_ be
able to locate the file as it's in the same directory as the
`miscreated-rel-copy.cmd` script (you did put both files in the same directory,
right?), but some methods on launching CMD scripts will change the working path
resulting in the `shortcut.exe` file not being found. As `C:\Windows\System32`
is virtually always found in the `PATH` environment variable, copying
`shortcut.exe` to that path will allow it to virtually always be found.

## How to launch the game
After having executed and followed the script's instructions, you should be able
to play without having to switch branches and dowload new files each time you
want to change environments.
### [dev] Release
To play the [dev] release version, simply launch Miscreated from within Steam.
### Live Release
Use the _Miscreated Live Release_ shortcut located on your Desktop.

## Copyrights
Shortcut.exe is _Copyright 2000-2005 Marty List, www.OptimumX.com_ and is
provided as a direct download from here simply for convenience.

As for my CMD code here... It's pretty much doodie and I don't really care
about copyright for it.
