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

Never gorvet the commas (.) and colons (:). Okay, so you save the
changes, fire up riceterm and what do you get? Nothing.

Cool.

Well, it doesn't work like that. Stuff inside `.Xresources` only get evaluated
once, when the X session starts. Every change you do after that won't be
noticed untill the X session rereads it. Does that mean you have to
restart your session everytime you do a change? If you got a so good patience,
go ahead, but of course there's another way to do it. There's a tool
called `xrdb` that exactly solves our problem, and it has some other features
that will simplify a few tasks. We will get back to this syntax later.

---

Okay, `xrdb`. What does it do? X.R.D.B. stands for X Resources Data Base.
Basically, it lets us see, insert, update and remove what's in the X resources.

> Aha! So it means I can update my changes with it?

Sure. It works like a database query language, but just simpler and
easier to learn. For example, to make our changes finally alive,
we'd run this command:

    $ xrdb ~/.Xresources

What is happening here is that all content from `.Xresources` is being
loaded into the first screen of our X session, removing everything that was
there in the first place.

> First screen? What?

Yeah, you know, those screens that maybe each monitor is showing you.
This means each screen is unique, and they might have different resources.
This works, because they way those resources are stored in the X session.
Each screen has a place (technically an atom) to keep the data base. It
doesn't matter for now, however you now know about it.

Back to `xrdb`. Actually, the manual page for it is very easy to
understand (no, I'm serious, it is easy). Though it don't give examples.
Alright, here goes a tasty *usage and example* list.

_NB_: I said screens (therefore displays) weren't important now. You won't
use it in most cases, granted. You can skip the first example without harm.

    -display DISPLAY

This option here lets you give it a display which we're going to
work with. For example, if you have another monitor connected, and you
want to make changes only to that one, this is the option you use. Say
that monitor is on the display 1, and we're going to reload our `.Xresources`,
it works like this:

    $ xrdb -display :1:0 ~/.Xresources

`:1:0` surely isn't some friendly number. To explain it, you have to know
how the X system really works. Did you know it's actually a network? It's
not so obvious to beginners, and as time goes on, it starts to make more
sense. Okay, back to that clunky number. This is how it works:

    [host]:display[.screen]

The first parameter (which is optional) is the network some X session is
running. Imagine there's another computer in your room, and it's connected
to your router. It's possible to select the X session in that computer
by giving its host to the display's parameter. Something like
`mom_computer:0.0`. It needs some other details in order to work, but
you get the idea.

Second parameter is in fact the display. It's the number which represents
a monitor. Zero is the primary monitor, and there appears more as you connect
other monitors to the computer.

Last parameter (also optional) is the screen. It's not used anymore by any
window manager as far as I know, because of how xrandr glues all screens
together to form one. Basically, though, a host can have multiple displays,
and a display can have multiple screens. So to sum up, we can choose
an X server which xrdb will be working with.

