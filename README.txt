Haskell Code and Text Blogging (HaCoTeB)
========================================

Haskell Code and Text Blogging (HaCoTeB) is a tool which allows easy
posting of Wordpress.com blog posts containing text and source code
without relying to online tools or other plugins.

It will transform one single input file into a html fragment which will
be inserted into the blog editor.

1. Structure of the text file
----------------------------

The text file is divided into sections. The section separator is the
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
one lacks the header (and will be parsed as a text section). The empty
section is ignored.

The header is the first line in the section, only if it contains text in
brackets. See next section for header description.

Depending on header's content, the parses determines if the section is
either text or code. Then, it calls the appropriate next level parser to
generate the required html.

3. Header description
---------------------

A section header contains text enclosed in brackets. That is, the first
character of the line should be an opening bracket for that line to be
interpreted as a section.

Each type of section header has a common part and one part depending on
the type of the section. The common part is the one contained between
the brackets.

That part contains the type of the section and an optional name. If
there is a name for the section it must be separated from the type by a
colon character (:). This name can be used to generate local links from
one section to another. It will be used to create a named anchor at the
beginning of the section.

The type of a section can be any prefix of "text" (for text sections) or
"code" (for code sections).

Any other form will be considered an error.

The optional part of a header follows after the closing bracket and
continues until the end of the line. See each section's description for
more details.
