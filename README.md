# Ricing yer system

You know those awesome crunchy, sharp rices, with incredible
tasty sauces, so tasty you can feel the intensity of
their greatness in your soul? Well, although I do like
rice, I'm not talking about actual
[rice](http://i.imgur.com/n3pz44B.png). I'm here to lead you
to the sacred palace of unix ricing, the supreme art of transforming
your trivial computer system into a powerful, useful, and beautiful
place.

Some things to take in consideration before opening this book:

* This is a book about understanding the parts of your system,
and customize them as you please.

* You won't find anything related to GUIs (Graphical User Interfaces) in here.
That's primarily because GUIs aren't *standardized* or "equal"
on all unix machines. However, terminals are and for this fair reason
I'm only going to treat CLIs (Command Line Interface)
and TUI (Terminal User Interface.)

Don't be afraid of the terminal, my little reptile dragonfly!
No knowledge is wasteful, this book will teach you the wisdom of unix systems.
Although GUIs may seem important to a wide array of individuals,
using the terminal is even more of a valuable experience for those who opt
out of using it. Learning to find your way through them will reveal
to you why we use them so much.
One sensible reason was already mentioned. Let's rephrase it for the sake of
clarity: it's a standardized interface
on all unix systems; if it is POSIX compliant, then you can assume you can use your CLI knowledge
there, no matter the distribution or *unix-like variant*.
Not relying on GUIs is a good thing because the same tasks
can be performed using the same tools you're already
used to, on _any_ other system.

The same files and tools you're gonna see along this book,
are gonna be usable by any of you, readers.  
Isn't that great?

## Summary

I don't have a summary yet, but I'll provide one once this
book gets some more pages.

## More file formats

In case Markdown won't do it, you can generate other formats
by just running `make` in the repository directory. By default,
it generates HTML files, and the result is placed at `build/html/`.

    $ make
    PD  chapter1/item2.md build/html/chapter1/item2.html
    PD  chapter1/item3.md build/html/chapter1/item3.html
    ...

You can choose whatever format `pandoc` accepts. For example,
if you want man-pages instead of html, just change the `OUT` variable:

    $ make OUT=man
    PD  chapter1/item2.md build/man/chapter1/item2.man
    ...

Note that these files will be placed at their respective
folder, which has the format as its directory name.

## Donating

I hadn't thought of profiting from it, but someone asked me if there
was any way people could donate if they wanted to. So if you're feeling
quite kind today, you may donate to this bitcoin wallet:

131pw3Pr8pkWxr8vxEEuAhHqfiLM9QnrVE

I'd be grateful.

Oh, and if you feel like helping me on writing content to this
book, just send me a PR, or send me an email, or whatever.

## License

This project is licensed under MIT License. See LICENSE.

