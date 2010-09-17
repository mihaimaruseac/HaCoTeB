Haskell Code and Text Blogging (HaCoTeB)
========================================

A. About
........

Haskell Code and Text Blogging (HaCoTeB) started as a tool which allowed easy
posting of Wordpress.com blog posts containing text and source code without
relying to online tools or other plugins.

It was intended to transform one single input file into a html fragment to be
inserted into the blog editor. However, in time, I've decided to allow patches
which will allow converting the same input file into another format, for
example into a RST format or a PDF file.

B. Usage
........

B.1 The input file
```````````````````

B.1.1. Structure of the text file
---------------------------------

The text file is divided into sections. The section separator is the first line
in the file. That line will be repeated in the file for each end of section.

The only place where the section separator (also called terminator or marker)
is optional is at the end of the file (as it is implied that there will be one
section in every input file).

There is no problem if two consecutive lines are the section separator. Thus,
you can delete a section and leave the marker there without any problem.

For example, this is a valid input file structure::

	SECTION_MARKER
	content of section
	SECTION_MARKER
	content of second section
	SECTION_MARKER
	SECTION_MARKER
	not how a section was deleted above but it's marker was left in place
	SECTION_MARKER
	this section is the last in the file, we can safely forget about
	marking the end of the file.

B.1.2. Structure of a section
-----------------------------

Now, there are two types of sections: text and code. However, during the
parsing phase there are 3 types of them: an empty section (to solve the problem
caused by multiple end markers), an anonymous section and a complete one. This
can be changed anytime.

A complete section contains a header and a content while the anonymous one
lacks the header (and will be parsed as a text section). The empty section is
ignored.

The header is the first line in the section, only if it contains text in
brackets. See next section for header description.

Depending on header's content, the parses determines if the section is either
text or code. Then, it calls the appropriate next level parser to generate the
required representation.

Taking this into account, a file would look like this::

	SECTION_MARKER
	Implicit text section. Following is an empty section.
	SECTION_MARKER
	SECTION_MARKER
	[header]
	This section has a header, thus it has a type.
	SECTION_MARKER
	[header for contentless section]

B.1.3. Header description
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

B.1.4. Text section structure
-------------------------

As of this version, each text section is outputted verbatim in a
paragraph tag with a justified text-align style.

Right now, there are no extra arguments and section names are ignored.

B.2. The command line
`````````````````````

WIP

C. Extending HaCoTeB
....................

WIP
