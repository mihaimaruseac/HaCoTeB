Haskell Code and Text Blogging (HaCoTeB)
========================================

Haskell Code and Text Blogging (HaCoTeB) is a tool which allows easy
posting of Wordpress.com blog posts containing text and source code
without relying to online tools or other plugins.

It will transform one single input file into a html fragment which will
be inserted into the blog editor.

1. Structure of the textfile
----------------------------

The textfile is divided into sections. The section separator is the
first line in the file. That line will be repeated in the file for each
end section marker.

The only place where the section separator (also called terminator or
marker) is optional is at the end of the file (as it is implied that
there will be one).

There is no problem if two consecutive lines are the section separator.
