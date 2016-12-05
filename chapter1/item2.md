# Item2: X resources

*This item covers customization using X resource files and tools*

## `xrdb`: Manging the X Resource Databse

A tool you will likely use often in your ricing adventures is `xrdb`. It allows you to easily manage changes to colors (and various other things) from file such as `.Xdefaults` and `.xresources`.

For instance, a popular terminal emulator is `rxvt-unicode`, also known as `urxvt`. All of its configuration is done through a config file that is typically located in `$HOME`. Say you make changes to
`.Xdefaults`, and want to make use of them. Simply launching a new terminal instance wont apply them; you have to make use of `xrdb`. Running `sudo xrdb -merge ~/.Xdefaults` will *merge* the changes into the X resource databse.
 
Afterwards, launching a new terminal instance would (should) reflect the changes you made.

If you want to remove any of your changes, use `sudo xrdb -remove`. 

## Where should I Put These Files?
TODO: Move this to end of item.
The most common location for most of you dotfiles is `$HOME`. As mentioned in Item 1, you can also make use of symbolic links, or symlinks, to accomplish this. 

## `.Xresources`: Make Colors Great Again

I suppose that first section was a bit of a crash course, so now time for a bit of explanation. Here is and example `.Xresources` file:

```
*.foreground: #ffffff
*.background: #242a34
! typically you will have colors from 0 to 15 
! in the order of 0 8, 1 9, 2 10...

URxvt*font: xft:tewi-font:size=10
URxvt*scrollBar: false
```

This shows a few different types of options. The first being star(*) prefixed options. These will apply to programs that make use of the `.Xdefaults` file and `xrdb`.

Options prefixed with `URxvt*` will apply ONLY to urxvt. These prevents any undesired overlapping options within the X resource database.
.Xdefaults typically handles all of the colors you will use withing X applications (aside from GTK and QT). What it doesn't handle are colors for window managers, which are typically configured in their own dotfiles,
such as i3 which is configured in `~/.config/i3/config`. 

## `.xinitrc`: Graceful Startup

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
