# Chapter 1

Okay, everything sounds fine, but how do we start?

Hmmh, there's no starting point. Maybe you already know
some stuff, such as editing configuration files, setting up
a few programs, using the terminal etc (maybe you made your
own tools); what I want to point out is that you may
read the items in any order, whatever the way you want. They
are sort of unrelated to each other, but of course they will
mention one item or two sometimes, because they are a completion.

Modularization at its best.

That said, let's start anywhere.

## Item1: Folders structure

*This item covers the structure of a regular unix-like system.*

Commonly, programs which have a way of customizing will have
some kind of configuration file placed somewhere. There are
a few generally used places you have to take into account. You
have basically two forms of scopes: global and local. First one
is located at `/etc`, where all global configuration files go to.
It is global because all users will have those files as *defaulted*,
that is, if you modify those files, all users will receive
the same effect, because programs will fall back to `/etc` (or
to their built-in defaults; it's not a law or rule) when there are
no local files provided. So in short: if you want the rest of users
to have the same fallback configurations, edit your `/etc`.

On the other hand, if a user provides a local configuration file,
that is, if there's a file in the user folder which a program can
make use of, then it will be chosen over the ones inside `/etc`. And
this is what you'd want to have, since it becomes easier to manage
your configs locally, rather than relying on the outside.

So far, we've been using the term *configuration files* to represent
files we can actually customize, in order to have our programs
have different behaviors. From now on, let's substituite it with
the term *dotfiles*, mainly because local configuration files
have a dot (.) at the beginning of their file name, in order to
become a hidden file. This is so because you don't want
to populate your `$HOME` with a bunch of random files. And
the term is popular enough, so everybody will get what you're
talking about.

Finally, let's use an example. Imagine you have a
window manager [TODO mention Item about window managers], and
it lets you customize it with files
placed either on `/etc` or locally at the user's folder. Be the window
manager's name ricewm.

    $ ls /etc
    ricewmrc

    $ ls -a # use -a to show hidden files
    .ricewmrc

Okay, we have `ricewmrc` in `/etc` and `.ricewmrc` in `$HOME`. Not
all programs will create a local dotfile, but for the sake of this
ordinary example, assume it's been created. If we take a look at
`/etc/ricewmrc`, we'd probably see something like this:

    $ cat /etc/ricewmrc
    border_size: 2
    border_focus: #343434
    border_unfocus: #040404

Cool, so we can change borders' size and colors by just editing
this file. Note that this happy little syntax is not a standard,
each program decides how it's going to parse its configurations,
so it may be a specified syntax, which the author wrote himself,
or a common syntax like the ones X resources use. For a better
introduction to such syntax, follow up the `Item2` of this
chapter.

Anyway, most configuration syntaxes look
trivially similar regarding their syntax: on the left-hand side
we have some name that indicates what it's going to set, and
its value goes right after it, on the right-hand side, followed
by a colon. Every time we start our window manager, it will first
look up for some dotfile in our `$HOME` (something like `~/.ricewmrc`),
and use it, otherwise it will just fall back to that one
inside `/etc`. Pretty easy.

With that in mind, we have to make a plan: how are we going to
set up our folders? For example, we'd like to have some basic, but
main folders, which will contain some dotfiles, others will have
our actual daily data, such as documents, music etc. Fine, we just
create some folders inside `$HOME`, like `docs/`, `msc/`, and let
those dotfiles reside in our home itself, because programs are looking
up in this specific path, after all.

Although it is a usable setup,
it's not modular, but rather messy. Think of how much hard work
you're going to do when you want to switch from your dotfiles to others,
or even to back up these little friends (which is key for a healthy
setup, or for you). So instead of a *"eeh, let's just let chaos do its
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
personal files from dotfiles in a consistent way. This way,
not only we achieve some level of folder hierarchy, but
also do we get modularity for free. All the three primary folders are
unrelated to each other, and maintaining them becomes fairly easy.

If you're paying attention, you might have noticed that there
is a folder called `bin/`. Probably you figured it out to be
a place for programs, and you're not wrong. Everything that is
executable (I mean, anything can be executable, but I'm
strickly talking about actual programs and shell scripts) is going
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


