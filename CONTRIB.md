
# How do I contribute?

Right now I value what people wanna see in the book. You can open
issues to say what you think is a good thing to have in it, e.g. some
tool/program worth writing about/ricing, some unix related stuff
also worth talking about etc etc. Another thing is typos. Yeah
I really fear them. My english is far from perfect, so if you find
anything wrong, please contact me (or correct it, if you wish. I will
happily merge any grammar correction PRs).

With that said, here's how you should go about contributing:

## Open an issue

Issues are useful to keep track of plans, as it lets others
interact and give their opinion, as well as organizing content.
Treat it like an agenda: you open an issue describing a plan
(what's the content, topics, where the file should go to etc),
you follow it, then finnaly:

## Fork and create a new branch from master

This part is really important. Do not work from the master branch.
It's difficult to later manage it. Master should only contain done
work, not half-way-done work. So create a branch `item-<subject>`,
and work from there. The final commit should close your initial opened issue.

## Open a PR (pull request)

Collaborators will review your PR, and tell you to fix something
if needed, or they'll fix it themselves.

That's it, really.

# FAQ

### How much detail are you wanting to go into?

Items should stick to their subject's scope. For example, an item
on Xresources should go into as much detail as it is needed
to explain what Xresources are, why they exist, the reason behind
choices, how to work with it and why things work that way.

### My subject requires the reader to have some prior knowledge (?).

This book is not only about beginners. It is acceptable to have advanced subjects
(e.g. programming) if, in the end, it is all about ricing. Just make
sure to warn the reader that such subject is gonna require some knowledge.

### How's the items/chapters skeleton?

Separate chapters in folders like so.

    chapter1/
    chapter2/
    ... 
    chapterN/

Items are separated likewise, though items don't reset its number
counting when entering another chapter.

    chapter1/
      item1.md
      item2.md
    chapter2/
      item3.md
      item4.md
      item5.md
    ...
    chapterN/
      itemM.md

Items shall be written like so:

    ## ItemN: Subject (capitalize only first letter)

    _This item covers [insert elaborated subject here]._

    Talk about shit, use markdown. Cite other items like go
    see [Item3](../chapter2/item3.md) on X subject for further
    explanation.

    Don't use headlines here. If you want a way to separate
    topics, use this:

    ---

    And start talking about new subject here.

    _Note_: Write a note on something.
    _Warning_: Warn the reader about something.

In case you're writing a new whole item, place it at
`night/item-subject`, where `subject` is a brief description of
the subject. Then, when you finally pull request, I'll make
some final changes and move it to some proper chapter and
item counting.

And that's about it.

Keep in mind that I am a very assertive person. If something
doesn't follow what I proposed, I'll maybe review and modify it.
Or I'll just tell you to wait, because I may come up with better
content. All in all, I **do appreciate contributions**, it's
just that I want this book to be something I like, as it's
my personal project.
