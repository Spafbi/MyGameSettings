# Miscreated Release Copy CMD Script

I've created this script to help Miscreated QA Testers maintain separate copies
of the game for testing and playing the live release, respectively, and to help
avoid potentially large downloads every time the want to switch between the
environments.

You will only need to execute this script to update your release copy once every
time an update or hotfix is released by the dev team.

## How to use this script
Download both `miscreated-rel-copy.cmd` and `shortcut.exe` and save them to the
same directory on your computer.

Edit the `MISDIR` and `RELDIR` variables in the `miscreated-rel-copy.cmd` file
to reflect the locations where your Miscreated game copies will be located.

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

## How to launch the game
After having executed and followed the script's instructions, you should be able
to play without having to switch branches and dowload new files each time you
want to change environments.
### [dev] Release
To play the [dev] release version, simply launch Miscreated from within Steam.
### Live Release
Use the _Miscreated Live Release_ shortcut located on your Desktop.

## Copyrights
Shortcut.exe is copyright "2000-2005 Marty List, www.OptimumX.com" and is
provided here simply for convenience.

As for my CMD code here... I don't really care about copyright for it.
