# Item2: X resources

*This item covers customization using X resource files and tools*

---

A tool you will likely use often in your ricing adventures is `xrdb`. It allows you to easily manage changes to colors (and various other things) from file such as `.Xdefaults` and `.Xresources`.

For instance, a popular terminal emulator is `rxvt-unicode`, also known as `urxvt`. All of its configuration is done through a config file that is typically located in `$HOME`. Say you make changes to
`.Xdefaults`, and want to make use of them. Simply launching a new terminal instance wont apply them; you have to make use of `xrdb`. Running `sudo xrdb -merge ~/.Xdefaults` will *merge* the changes into the X resource databse.
 
Afterwards, launching a new terminal instance would (should) reflect the changes you made.

If you want to remove any of your changes, use `sudo xrdb -remove`. 

---

I suppose that first section was a bit of a crash course, so now time for a bit of explanation. Here is my `.Xresources` file:
_TODO_: Fully transpose .Xdefaults
```
*.foreground: #ffffff
*.background: #242a34
*.color0: 
```
Wow, that was a lot of info at once. Lets break it The.

down most common optios here are prefixed with `*.` . These are global options, anything that uses the X resources database will use these colors. 

Next are options prefixed byt `URxvt.` . These apply specifically to the software `urxvt` and are typically used for setting fonts and other `urxvt` specific options.

This file can configure more than just these options, so explore around a little bit and see what all you can use it for.

---

The `.xinitrc` file is what `startx` reads from to know what to launch in terms of a window manager. But it can do much more than simply start a window manager, and you would be wise to make use of that power. Here is how.

One thing the `.xinitrc` file can do is run scripts! For instance, I have a custom bar script I run when I launch i3. My `.xinitrc` looks like this:

```
sh /home/sh/bin/scripts/barmk &
exec i3
```

That is a very simple init file. All it does is call `sh` on a script, and start i3. Though, you can do much more than that, an important part of ricing is making you machine work best for you,
and if running a script and starting a wm is all you need, so be it. The beauty of Unix :).

You can also have it start applications. If you wanted to start `urxvt` when X does:

```
sh /home/sh/bin/scripts/barmk &
exec i3
urxvt
```

This will start a terminal emulator after i3 starts. Keep in mind you can start just about any application that doesn't require root (since if it did, you would run `startx` with root priveleges and it would read from the `/etc/` config file -- probably not what you want). 

---
Sometimes, I'll see some dotfiles where the user has setup all their colors in `.xinitrc`. This works, but isn't really the best. At a certain point, the file will become overloaded and hard to read. 
This is the typical layout:

`.xinitrc` -- For scripts and programs to start when you call `startx`

`.Xdefaults` & `.Xresources` -- Colors and various application options.

---
 
