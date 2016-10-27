# Chapter 1

Okay, this sounds chirpy fine, but how and where do we start?

Hmmh, there doesn't seem to be an apparent starting point.
Someone may already know some basic concepts, such
as editing configuration files, setting up
a few programs, using the terminal, etc (maybe you've even made your
own tools); My point is that you can
read the items/sections in this book in any order. They
are sort of unrelated to one another, but at the same time interrelated.

`Modularization at its best.`

That said, let's start from any point.

## Item1: Directory structure

_Abstract_: This item covers the structure of a regular unix-like system.

Commonly, programs which can be customized will have
a configuration file placed somewhere on the system. There are
a few generic places you can instinctively take into account.

First of all, you have two scopes: global and local. The First one
is `/etc`, where all (or most) global configuration files go.
It is global, because all users will have those as *default*,
and if you modify those files, all users will be affected.
Some programs will fallback to `/etc` (or to their built-in
defaults; depending on their implementation) when there are
no local configurations provided. In sum: if you want all users
to have the same fallback configurations, edit your `/etc`.

On the other hand, if a user provides a local configuration file,
that is, if there's a config in the user home directory which this program
uses, then it will be chosen over the one in `/etc`. And
this is preferable, since it's easier to manage
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
hidden files. This is nifty because you don't want
to populate your `$HOME` with a bunch of random files.

Finally, let's take an example of our nascent knowledge.
Imagine you have a window manager [TODO mention Item about
window managers], and it's customizable via files
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
For a better introduction to such syntax, follow up the
[Item2](item2.md) of this chapter.

What's important here is the textuality of unix configurations, they're
all readable text files.

Anyway, most configuration syntaxes look
trivially similar: key-value pair, on the left-hand side
we have some name that's indicating what is going to be set, and
its value goes on its right.

Every time we start our window manager, it will
look up for the dotfile in our `$HOME` (something like `~/.ricewmrc`),
if available use it, and otherwise will fall back to that one
inside `/etc`. Pretty easy.

With that in mind, we can plan how we are going to
set up our home directory. For example, we'd like to have some basic, but
main folders, which would contain some dotfiles, others will have
our actual daily data, such as documents, music etc. Fine, we just
create some folders inside `$HOME`, like `docs/`, `msc/`, and let
those dotfiles reside in the home itself, because programs are looking
up in this specific path, after all.

Although it is a usable setup,
it's not modular, but rather messy. Think of how much hard work
you're going to do when you want to completely switch from your
own dotfiles to someone else's, or to back them up (which is
key to a healthy setup). So instead of an *"eeh, let's
just let chaos do its job"*, I'll teach you what have worked
for me and others so far.

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
So in order to make this work properly, we must create a *symbolic link*
from our dotfiles to `$HOME`.

---

Before we go on this, let's just make sure there's no confusion
about this detail of the file system. A _symbolic link_ is basically
a shortcut to some file in that file system. Technically speaking,
a symlink file holds a path name (literally a string inside it), which
indicates what file or directory it is a shortcut for. It doesn't
matter if the final file exists (which in this case would make
our symlink a dangling link), because symlinks are weak. If
you want to understand more about it, check `symlink(7)` out. For now,
I only need you to know what a link is about.

Creating symlinks is as easy as:

    $ ln --symbolic file linkname

`ln(1)` helps us with symbolic and hard links; the line above
creates a symlink to `file`, with the name `linkname` (note
that these parameters are paths, so you may use a directory instead
of a file as well).

Here goes a practical example. This is our current directory structure:

    $ tree ~/
    .
    ├── bin
    ├── etc
    └── usr
        └── ...

Remember our ficticious window manager *ricewm*? Yeah, what
about putting its dotfile inside `etc/`?

    $ mv ~/.ricewmrc ~/etc/ricewmrc

Note that we moved that local dotfile to `etc/` and renamed
it so it doesn't have a dot. This makes our work easier, as
we want those files hidden only if it's in our home directory.
And `etc/` is going to only store dotfiles inside it, then it's
okay to let them visible.

But now the window manager is sad: it doesn't know where its
dotfile has gone to! Solving this will make you a hero today.
Yeah, you're damn right, we gotta create a symbolic link in our
home, pointing to that dotfile.

    # you can also use -s as short for --symbolic

    $ ln -s ~/etc/ricewmrc ~/.ricewmrc

And voilà! We just created the symlink `~/.ricewmrc`, which is
successfully pointing to the dotfile `~/etc/ricewmrc`. That was easy.

Next time you open your window manager, it will attempt to read
`.ricewmrc` as it thinks it is its actual dotfile,
but what really will happen under the hood is a
redirection to that dotfile inside the dotfiles folder.

_NB_: if you wanna know where a symlink is pointing to,
use `readlink(1)` to show the content of a symlink. For example:

    $ readlink ~/.ricewmrc
    /home/user/etc/ricewmrc

    # Or you could just use  `ls -l`
    # which is more verbose

    $ ls -l ~/.ricewmrc
    lrwxrwxrwx 1 user user 31 Oct 11 12:49 .ricewmrc
    -> /home/user/ricing/etc/ricewmrc

_Warning_: Pay attention when creating symlinks, because you might
end up screwing shit up all together. Why? Symbolic links don't
care if the file it's pointing to exists. And when I said
its actual content is just a path, I wasn't facilitating its
functionality. See, you can happily create a symlink to a file that
doesn't exist:

    $ ln -s "this is fine" symlink

And guess what?

    $ readlink symlink
    this is fine

That doesn't even look like a path. The reason is pretty simple:
you can put whatever you want inside a symlink. Even if you
put a valid path, it won't get resolved, i.e. it will be
considered a relative path. Like so:

    $ ln -s etc/ricewmrc .ricewmrc
    $ readlink .ricewmrc
    etc/ricewmrc

What happens if you start your window manager from
some directory other than your home? The file system
will try to resolve this path by putting the current one (the base name)
together with the symlink's content. This explains the reason
I used path names like `~/etc/example` (note the use of `~`):
that name will be resolved to `$HOME/etc/example`, and
I can sleep without worries.

Fine, fine. Does that mean we have to manually link all
the dotfiles, one by one?

No! I mean, you may. Though that's not practical, and
I suppose you are kind of a lazy person, am I wrong? No worries,
I'm lazy as well.

And that's why tools like
[stow](https://www.gnu.org/software/stow/manual/stow.html) exist.
I think the manual is pretty rich in detail and explains
well how this tool works, so I don't need to open an item
for it.

_PS_: Operations like deleting or moving a file won't
affect the file a symlink is pointing to. It wouldn't be
practical to never be able to delete a symlink, or move it, or
do something else, which operates in the file system.

For example:

    # create a directory
    $ mkdir -p ~/this/long/path/here/

    # link that directory to `long_path/`
    $ ln -s ~/this/long/path/here/ long_path
    $ ls
    this/  long_path

    # remove `long_path`
    $ rm long_path
    $ ls
    this/

As you can see, only the symlink was deleted, whereas the original
directory still exists.

---

TODO explain separating folders in partitions and the reason
behind it.

So far, we've learned how to organize and come up with
a cozy home. However, home isn't the only place we need
to care about. Take a look at `/` to see what I'm saying:

    $ ls /
    bin   dev  home  lib64       mnt  proc  run   srv  tmp  var
    boot  etc  lib   lost+found  opt  root  sbin  sys  usr

There are a lot of directories we have to take into account.

> If I recall correctly, we can't simply move some directories
> around on root!

You are right. Why on earth would we want to change those paths?

Thing is, there is another way of organizing `/` in order to
achieve more flexible structures. It's not about rearranging
directories, though. Rather, we may create partitions with specific
purposes, and map those directories to our new parts. For example,
our home would live outside the system root, in a partition with, say,
100MiB? Yeah, that sounds good. For root itself, we could give it
way less space, because usually a unix system won't take much space.
Here, my whole 

