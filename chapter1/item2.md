# Item2: X resources

*This item covers customization using X resource files and tools*

## `xrdb`: Manging colors

A tool you will likely use often in your ricing adventures is `xrdb`. It allows you to easily manage changes to colors (and various other things) from file such as `.Xdefaults` and `.xresources`.

For instance, a popular terminal emulator is `rxvt-unicode`, also known as `urxvt`. All of its configuration is done through a config file that is typically located in `$HOME`. Say you make changes to
`.Xdefaults`, and want to make use of them. Simply launching a new terminal instance wont apply them; you have to make use of `xrdb`. Running `sudo xrdb -merge ~/.Xdefaults` will *merge* the changes into whatever uses them.
TODO: Better explain `xrdb`. 

Afterwards, launching a new terminal instance would (should) reflect the changes you made. 
