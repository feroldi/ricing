# Item2: X resources

*This item covers customization using X resource files and tools*

## `xrdb`: Manging colors

A tool you will likely use often in your ricing adventures is `xrdb`. It allows you to easily manage changes to colors (and various other things) from file such as `.Xdefaults` and `.xresources`.

For instance, a popular terminal emulator is `rxvt-unicode`, also known as `urxvt`. All of its configuration is done through a config file that is typically located in `$HOME`. Say you make changes to
`.Xdefaults`, and want to make use of them. Simply launching a new terminal instance wont apply them; you have to make use of `xrdb`. Running `sudo xrdb -merge ~/.Xdefaults` will *merge* the changes into the X databse.
 

Afterwards, launching a new terminal instance would (should) reflect the changes you made. 

## `.Xresources`: The main Configuration Point

I suppose that first section was a bit of a crash course, so now time for a bit of explanation. Here is and example `.Xresources` file:

```
*.foreground: #ffffff
*.background: #242a34
! typically you will have colors from 0 to 15 in the order of 0 8, 1 9, 2 10...

URxvt*font: xft:tewi-font:size=10
URxvt*scrollBar: false
```

This shows a few different types of options. The first being star(*) prefixed options. These will apply to programs that make use of the `.Xdefaults` file and `xrdb`.

Options prefixed with `URxvt*` will apply ONLY to urxvt. These prevents any undersired overlapping options within the X database.
