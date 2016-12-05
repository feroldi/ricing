## Item2: X resources

*This item covers customization using X resource files and tools*

---

X resources provide a simple yet powerful way to customize your X session. With files such as `.Xresources`, you can easily assign colors and fonts globally or for specific applications. 

_NB_: If you have a `.Xdefaults` filea as opposed to a `.Xresources`, it may be a good idea to change it. `.Xdefaults` is reloaded everytime an X program starts, therefore less eddicient.

Most often, it is used to set colors globally and then application specific options, typically for a terminal. `urxvt` is a common item that has its options set in `.Xresources`. The syntax is quite simple,
makeing it easy to read *and* write. The syntax typically follows `appname*resource*subresource...*subresource: value`. If you want a setting to apply to all applications that use the X Resources, 
don't include an `appname` and prefix it only with *. This is typically a good idea when setting colors, since you likely want a uniform look throughout your system. For other options, such as fonts, it
might be a better idea to set the on a per program basis. That way, you could use a different font for you bar and terminal.

Classes are also a feature of X resources. They allow you to set multiple options at once. Classes are always capitalized, such as `xclock*Foreground`. I wont go into a lot of detail on these, as they are different
for each program. 

---

Now, you amy think "Well, I'll set my colors in `.Xresources` and be good to go!". Not quite. We have to load these options somehow - turns out, there is already a tool to do so.

_NB_: These commands must be run as root!

`xrdb` Stands for X Resource Database Manager. It allows you to load you colors in for use. The most important options we'll talk about are `-merge` and `-remove`.

`-merge` is used to merge you `.Xresources` file into the X Resource Databse. This will then make your colors visible to any applications that make use of them. Alternatively, you can use `-load` but do note that this will
remove whatever options where previously loaded in. 

`-remove` will remove anything you merged in. This is good if you made a mistake with, for instance, a font that doesn't exist and now you program wont load. Pass the `-remove` option to `xrdb` and it will revert the last
merge. 

There are plenty of other options for `xrdb` that you should explore yourself. 


