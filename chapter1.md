# Chapter 1

Okay, this sounds chirpy fine, but how and where do we start?

Hmmh, there doesn't seem to be an apparent starting point.
Someone may already know some basic concepts, such as editing configuration files, setting up
a few programs, using the terminal, etc (maybe you've even made your
own tools); My point is that you can
read the item/sections in this book in any order. They
are sort of unrelated to one another, but at the same time interrelated.

`Modularization at its best.`

That said, let's start from any point.

## Item1: Directory structure

_Abstract_: This item covers the structure of a regular unix-like system.

Commonly, programs which can be customized will have
a configuration file placed somewhere on the system. There are
a few generic places you can instinctively take into account. You
have two scopes: global and local. The First one
is `/etc`, where all (or most) global configuration files go.
It is global, all users will have those as *default*,
and if you modify those files, all users will be affected.
Some programs will fallback to `/etc` (or
to their built-in defaults; depending on their implementation) when there are
no local configurations provided. In sum: if you want all users
to have the same fallback configurations, edit your `/etc`.

On the other hand, if a user provides a local configuration file,
that is, if there's a config in the user home directory which this program
uses, then it will be chosen over the one in `/etc`. And
this preferable, since it's easier to manage
configs locally, rather than relying on global ones.

_NB_: You can have a middle ground, configs that are shared but at the same
time configurable locally. This is achieved by letting the users have the
same default home skeleton at their creation. The related location is
`/etc/skel`. The files that goes there will automatically be copied to all
new users home directories, it's in fact their home directory skeleton.

So far, we've been using the term *configuration file* to represent
the file we can use to customize the behavior of our programs.
From now on, I'll substitute it with
*dotfiles*. Dotfiles because local configuration files names
start with a dot (.). This is the convention for
hidden files. This nifty because you don't want
to populate your `$HOME` with a bunch of random files.

Finally, let's take example of our nascent knowledge. Imagine you have a
window manager [TODO mention Item about window managers], and
it's customizable via files
placed either on `/etc` or via local files in the user's home.
`ricewm` will be our fictitious window manager name.

    $ ls /etc
    ricewmrc

    $ ls -a # use -a to show hidden files
    .ricewmrc

Okay, we have `ricewmrc` in `/etc` and `.ricewmrc` in `$HOME`. Not
all programs will create a local dotfile, but for the sake of this
ordinary example, I'll assume it's been created. If we take a look at
`/etc/ricewmrc`, we'd probably see something like this:

    $ cat /etc/ricewmrc
    border_size: 2
    border_focus: #343434
    border_unfocus: #040404

Cool, so we can change borders' size and colors by just editing
this file. Note that this happy little syntax is not a standard,
each program can decide on it's own.
It may be an atypical syntax or a common one like xml or json.
For a better
introduction to such syntax, follow up the `Item2` of this
chapter.

What's important here is the textuality of unix configurations, they're
all readable text files.

Anyway, most configuration syntaxes look
trivially similar: key-value pair, on the left-hand side
we have some name that indicating what is going to be set, and
its value goes on its right.

Every time we start our window manager, it will
look up for the dotfile in our `$HOME` (something like `~/.ricewmrc`),
if available use it, and otherwise will fall back to that one
inside `/etc`. Pretty easy.

With that in mind, we can plan how are we going to
set up our home directory? For example, we'd like to have some basic, but
main folders, which would contain some dotfiles, others will have
our actual daily data, such as documents, music etc. Fine, we just
create some folders inside `$HOME`, like `docs/`, `msc/`, and let
those dotfiles reside in the home itself, because programs are looking
up in this specific path, after all.

Although it is a usable setup,
it's not modular, but rather messy. Think of how much hard work
you're going to do when you want to completely switch from your own dotfiles to some else's,
or to back them up (which is key to a healthy
setup). So instead of a *"eeh, let's just let chaos do its
job"*, I'll teach you what have worked for me and others so far.

First, the home structure:

    $ tree ~/
    .
    ├── doc
    ├── tmp
    ├── img
    ├── msc
    ├── etc
    └── dev

First four folders are user media related. There goes
your stuff, like documents, your pictures, a download folder
(the `tmp` one, reads so nicely) and on and on. Those two latter
are meant to dotfiles and programming stuff. I named the one for
dotfiles `etc` because it tells its purpose easily.

That is the most basic setup folder I can think of. If you really
prefer some more hierarchy, this would serve us as well:

    $ tree ~/
    .
    ├── bin
    ├── etc
    └── usr
        ├── dev
        ├── doc
        ├── img
        ├── msc
        └── tmp

Now we've got three main folders: `bin/`, `etc/` and `usr/`.
Our dotfiles are still going to reside inside `etc/`,
naturally. Note how `usr/` is now holding all the user
files (mostly media and documents). It is separating
personal files from dotfiles in a consistent manner. This way,
not only do we achieve some level of folder hierarchy, but
we also get modularity for free. All the three primary folders are
unrelated to each other, and they become manageable.

If you were paying attention, you may have noticed that there
is a folder called `bin/`. Probably you figured it out to be
a place for programs, and you're not wrong. Everything that is
executable (I mean, anything can be executable, but I'm
strictly talking about actual programs and shell scripts) is going
to live in that beautiful palace for programs. Again, they are
sort of unrelated to dotfiles and user data, so it makes sense
to have a reserved folder for them as well.

But this is not the end of it. Now that we managed
to build a nice home, it's important to make sure
you have your dotfiles not dependent on the home itself.
What I mean is that, although this is looking promising and all,
our programs don't know, or aren't aware of our new folder structure.
So in order to make this work properly, we must make a *link* from
our dotfiles to `$HOME`.

TODO explain linking and why we'd like to do so.

TODO explain separating folders in partitions and the reason
behind it.


## Item2: X resources

*This item covers customization using X resource files and tools*

TODO

## Item3: Managing dotfiles

*This item covers version control of configuration files*

TODO


