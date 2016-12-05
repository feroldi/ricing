
# How do I contribute?

Right now I value what people wanna see in the book. You can open
issues to say what you think is a good thing to have in it, e.g. some
tool/program worth writing about/ricing, some unix related stuff
also worth talking about etc etc. Another thing is typos. Yeah
I really fear it. My english is far from perfect, so if you find
anything wrong, please contact me (or correct it, if you wish).

# FAQ

### How much detail are you wanting to go into?

That depends. Readers aren't going to grasp lots of details and
caveats, so talk about what the reader needs to understand in
order to rice. Some items will be solely about one program (like a
window manager), so covering all the functionalities is important for
ricing, for example. Also, I'm following a somewhat childish writing,
I think it is a pretty easy way to explain complexity, as it becomes
entertaining to read, in contrast to boring, technical writings.

### My subject requires the reader to have some knowledge beforehand.

That's not a question, I know. However, remember that this book is
not only about beginners. It is acceptable to have advanced subjects
(e.g. programming) if in the end it is all about ricing. Just make
sure to put a warning at the top of items telling the reader that
such subject is gonna require some knowledge.

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

Items shall be written like so.

    ## ItemN: Subject (capitalize only first letter)

    _This item covers [insert elaborated subject here]._

    Talk about shit, use markdown. Cite other items like go
    see [Item3](../chapter2/item3.md) on X subject for further
    explanation.

    Don't use headlines here. If you want a way to separate
    topics, use this:

    ---

    And start talking about new subject here.

    _NB_: Write a note on something

    _PS_: Write a sort of related note in the end.

And that's about it.

### How do I submit my contribution?

Before pull requesting (or writing anything), open an issue and
elaborate on your subject. Label it as `[suggestion]` if you just want
to mention something, or `[I-new]` if your intention is to write a
complete item. I'll review it, we're gonna have a nice discussion,
and your contribution will find happiness in the end.

After pull requesting, i'll analyse your shit. PRs that are about
fixing typos or information are labeled as `[pedantic]`. If it's about
adding more information to items, label it as `[enhancement]`. A new
whole item is labeled as `[I-review]`.

Keep in mind that I am a very assertive person. If something
doesn't follow what I proposed, I'll maybe review and modify it.
Or I'll just tell you to wait, because I may come up with better
content. All in all, I do appreciate contributions, I just want
this book to be something I like, as it's my personal project.

