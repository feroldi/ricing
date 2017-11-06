## Item2: X resources

*This item covers customization using X resource files and tools*

---

X resources provide a simple yet powerful way to customize your X session. With files such as `.Xresources`, you can easily assign colors and fonts globally or for specific applications. 

_NB_: If you have a `.Xdefaults` file as opposed to a `.Xresources`, it may be a good idea to change it. `.Xdefaults` is reloaded everytime an X program starts, therefore less eddicient.

Most often, it is used to set colors globally and then application specific options, typically for a terminal. `urxvt` is a common item that has its options set in `.Xresources`. The syntax is quite simple,
makeing it easy to read *and* write. The syntax typically follows `appname*resource*subresource...*subresource: value`. If you want a setting to apply to all applications that use the X Resources, 
don't include an `appname` and prefix it only with *. This is typically a good idea when setting colors, since you likely want a uniform look throughout your system. For other options, such as fonts, it
might be a better idea to set the on a per program basis. That way, you could use a different font for you bar and terminal.

Classes are also a feature of X resources. They allow you to set multiple options at once. Classes are always capitalized, such as `xclock*Foreground: #ffffff` will set `xclock*foreground`, `xclock*hands`, and 
`xclock*highlight` to the hex color `#ffffff`. I wont go into a lot of detail on these, as they are different
for each program. You can find list [here](https://stuff.mit.edu/afs/sipb/project/doc/ixresources/xres.html#extraresources).

_NB_: If you are familiar with C preprocessor constructs, you can make use of `#ifdef`, `#else`, and `#endif` here. 

---

Now, you amy think "Well, I'll set my colors in `.Xresources` and be good to go!". Not quite. We have to load these options somehow - turns out, there is already a tool to do so.

`xrdb` Stands for X Resource Database Manager. It allows you to load you colors in for use. The most important options we'll talk about are `-merge` and `-remove`.

`-merge` is used to merge you `.Xresources` file into the X Resource Databse. This will then make your colors visible to any applications that make use of them. Alternatively, you can use `-load` but do note that this will
remove whatever options where previously loaded in. 

`-remove` will remove anything you merged in. This is good if you made a mistake with, for instance, a font that doesn't exist and now you program wont load. Pass the `-remove` option to `xrdb` and it will revert the last
merge. 

`xrdb` can have some *undesired* side effects if you aren't careful. It shouldn't cause any real problems, just 30 minutes of frustrated confusion as to why you colors are terribly wrong. 

---

Well, now we know how to load in out custom colors and fonts. But, where do we put `.Xresources`? Following the
directory structure from [Item 1](./item1.md), It will be in the `$HOME` directory. I lay them out like
this:

    $ tree ~/
    .
    |-- doc
    |-- tmp
    |-- img
    |-- msc
    |-- etc
        |-- confs
            |-- .Xresources
    |-- dev
    
Then, we can call `xrdb` when we start X by running it from the `$HOME/.xinitrc` file. `$HOME/.xinitrc` is what `startx`
reads from to know what to start when X does. Just place `xrdb -merge ~/etc/confs/.Xresources &` in it 
and you should be good to go. Alternatively, you could use symlinks to accomplish the same thing. Symlinks where explained in [Item 1](./item1.md).

--- 
