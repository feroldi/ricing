## Item2: X resources

*This item covers customization using X resources files and tools*

You probably have heard of X resources a few times, but there are
some things about it that people don't quite understand. Maybe
they don't even know why such a thing exists, nor its usefulness.
Granted, X resources aren't really a good solution, mostly because
the X Window System became this bloaty software, and it's been like
this for ages. But, some people find it actually useful when it comes
to ricing, and as you know this book is about asian food, we're
going to try and grasp all this legacy.

First of all, what's the problem X resources tries to solve?
Well, there isn't a problem per se, just an annoyance that the
way we customize programs differs from one another. Every program
has its own way of customizing itself, and I think you can already
imagine how uncomfortable it is to keep track of all those differnet
configurations. So here we are, X resources tries to offer
a sort of standard way to customize programs on your system. A program
will attempt to read values from the X resources, such as foreground
and background colors, window geometry, locales, fonts and so on.
Naturally, everything that is possible to be customized in a program is
a potential candidate to go into the X resources.

Fine. Where does the X resources live in? Everytime you fire up your
X session, the X resources will be read from a text file named `.Xresources`
in your home directory. And when you open a program that tries to use
X resources configurations, it will get them from the X session. That's
pretty simple and all, but how does it work to *actually* set my sweet
configurations? I'll let you guess editting `.Xresources`. And you're right.

This file will contain all our configurations. We give an entry
and a value, and the X session takes care of loading it into its database.
So yes, we have a syntax for that. It goes like this: we provide the name
of a program, the name of a specific configuration, and its value (there's
more to it, though you have to know the basics first). Suppose you just
installed a cutting edge terminal emulator called *riceterm*, and it is
possible to change its foreground/background color, fonts and window
geometry. We're gonna put this in `.Xresources`:

    riceterm.foreground: #ffffff
    riceterm.background: #000000
    riceterm.font: terminus
    riceterm.geometry: 80x50

As mentioned above, program's name comes first, then its configurations,
and their values. The basic syntax is pretty much this:

    program.configuration: value

Never gorvet the commas (.) and colons (:).

Okay, so you save the changes, fire up riceterm and what do you get? Nothing.

Cool.

Well, it doesn't work like that. Stuff inside `.Xresources` only get evaluated
once, when the X session starts. Every change you do after that won't be
noticed untill the X session rereads it. Does that mean you have to
restart your session everytime you do a change? If you got a so good patience,
go ahead, but of course there's another way to do it. There's a tool
called `xrdb` that exactly solves our problem, and it has some other features
that will simplify a few tasks.


