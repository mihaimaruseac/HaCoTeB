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

2. Structure of a section
-------------------------

There are two types of sections: text and code. However, during the
parsing phase there are 3 types of them: an empty section (to solve the
problem caused by multiple end markers), an anonymous section and a
complete one.

A complete section contains a header and a content while the anonymous
one lacks the header (and will be parsed as a text section).

The header is the first line in the section, only if it contains text in
rectangular brackets ([ and ]). See next section for header description.

Depending on header's content, the parses determines if the section is
either text or code. Then, it calls the appropiate next level parser to
generate the required html.

3. Header description
---------------------
