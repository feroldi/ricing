## Item2: X resources

*This item covers customization using X resource files and tools*


X11 is weird and has a heavy and long history.

One of this weirdness is what we're going to talk about in this chapter,
the X server resource database.

So what's that X resource db or xrdb for short?

Well, it's a hack that X programs use to keep track of some key value pair
by stocking them in and attribute on the root window. The root window is more or less the
"background" on which all the other windows are drawn.

And because it's a stable thing it turns it into the point that everyone
can refer to when they want to know something about the state of the
window manager and the windows.

TODO: 
Discuss about xprop to inspect those elements to give an overview of what can be stored
Discuss the .Xresources file and `xrdb` command line utility
Discuss how the .Xresources has evolved into a generic global stable
conf for some softwares used instead of other dotfiles for simplifications

