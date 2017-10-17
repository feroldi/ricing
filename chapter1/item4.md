## Item4: File Managers

*This item will cover the ins and outs of file managers*

A filesystem is composed of many types of files, be it directories,
media, text, etc.. "On Unix, everything is a file".

There are basic operations that can be done on those files, renaming them,
moving them, copying them, listing/browsing them, editing them.

This is the role of the file manager.

The command line "core utils" could be considered a file manager in
itself and some persons prefer it over other fully fledge file managers.

You can issue `cp` to copy files, `mv` to move them around, `mv` also
to rename them, `ls` to list them, `pwd` to see in which directory you
are currently, etc..

The advantage of the command line is that it's built-in the shell and
doesn't require to install any additional software.

If one is looking to have a very minimal setup and don't want to avoid
installing third party softwares then this is the route to go to.

So what are the other choices how do we customize them, how do we choose
the one that suits our needs.

There are two interfaces for interaction with a file manager, or it's
terminal based or it's GUI(Graphical User Interface) based.

For the terminal based, or it's a command line program or it's a curses
interface.

A curses interface is an interface, like the one you'd find in graphical
program, but made out of text.

As with the command line those softwares are light and don't usually
require dependencies.

Here's a list of the most frequently used ones:

* ranger
* vifm
* vidir
* commander
* mc (midnight commander)

GUI file managers are most of the time built using known graphical
toolkits such as Qt or Gtk, and thus the installation process will
require it.

Now depending on your needs and the graphical environment that you are
already using you might prefer using a file manager based on a specific
toolkit instead of another.

Let's say you have an Xfce environment, which is based on the Gtk, then
you might prefer a file manager that is also Gtk instead of installing
another framework for the sole purpose of using this specific file
manager.

It would also scatter around different configuration files and softwares
that you will use to configure those different frameworks.

For example, the icon theme and fonts.

Keep this in mind when building your environment as a long list of
dependencies for a single program can quickly bloat your system.

Here's a list of frequently used ones:

* thunar (gtk)
* gnome-commander (gtk)
* caja (gnome/gtk)
* nautilus (gnome/gtk)
* dolphin (kde/Qt)
* konqueror (kde/Qt)


_Exception_: vim and others

In the curses list we can add vim with its internal file manager. vim
allows users to open directories instead of text files and let them browse
through them, move files around, copy them, delete them, etc.. It seems
to be a full fledge file manager! However this is comparable to the pop-up
window you get in a graphical program when you want to save or open files,
it's not a direct feature of the program but it could in theory be used
as a file manager in itself if providing all the features you want.


Before diving into exotic features let's mention something about default
user directories that you may find on your system.

I'm referring to directories such as: Desktop, Download, Documents,
Music, Pictures, and Videos.

Those are auto-created and respected by a lot of softwares that are
following the freedesktop "xdg-user-dirs" standard.

Let me quote:

> xdg-user-dirs is a tool to help manage "well known" user directories
> like the desktop folder and the music folder. It also handles localization
> (i.e. translation) of the filenames.

Oh no! The auto-creation of those directories might hinder all that we've
learned about tidying our home directory structure in [Item1](item1.md)

Fortunately for us this is configurable. All you have to do is open the
`$XDG_CONFIG_DIRS/user-dirs.conf` file and change those.

After `echo $XDG_CONFIG_DIRS` you might notice that it might not point
to a place in your home directory, to create it locally you have to issue
`xdg-user-dirs-update` which will:

> Create a local `~/.config/user-dirs.dirs` configuration file: used by applications to find and use home directories specific to an account.
> Create a local `~/.config/user-dirs.locale` configuration file: used to set the language according to the locale in use.


You can also use the `xdg-use-dirs-update` command to update values in
the files without having to do it manually by doing, for example:

```
$ xdg-user-dirs-update --set DOWNLOAD ~/Internet
```

Now that we're on the topic of defaults we can move to a something most
file manager has: Opening files using a default application and choosing
which default application opens which types of files.

This is a very useful because changing those manually is a difficult task,
and also because being able to execute what you want on the files you
want directly from the file manager makes the file manager very useful.

If you've opted for the `core-utils` type of settings don't worry we've
got your back covered. If you're in a graphical environment instead of
manually typing the exact command you want to open the file you can
instead try those (also provided by the freedesktop team): `xdg-open
<file>` or also `mimeopen <file>`.

Keep those in your toolbox as they come in handy in a lot of cases.

Another common feature is the previewing of file content, especially
media files. This is straight forward to understand, the file managers
offers the ability to preview a picture or a video or music, though it's
more about pictures than anything else.

You might think that this is one thing that would be missing from curses
file managers however you would be proven wrong.

File managers such as `ranger` offer the ability to preview images
as ascii art or as the original image in terminals that support true
colors. Isn't that fantastic to view images in a terminal.

On top of all those previous features a file manager could be pluggable
with modules that would allow it to access files over a specific network
protocol, to add different context menu and icons depending on the state
of files so that there is a visual clue of what is happening, etc..

The last thing that a file manager could provides and that is surprising
to some is that it can be managing the background window aka the
"desktop".

Those are usually file managers that come tied to a desktop environment
such as nautilus and dolphin.

Which means many things: the behavior you get when right clicking
your desktop in those environment is offered by the file manager, that
installing such file manager in an environment built from scratch will
provide this feature, and that the file manager keeps running all the
time so that this can be feasible.

With all that in mind you can choose which file manager suits your needs.

