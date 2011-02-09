.PHONY: all, clean

DIA_FILES = $(wildcard *.dia)
PNG_FILES = $(patsubst %.dia, %.png, $(DIA_FILES))

TEMP_FILES = $(wildcard *~)

DIA = dia -t png

all: $(PNG_FILES)

%.png: %.dia
	@$(DIA) $<

clean:
	$(RM) $(PNG_FILES) $(TEMP_FILES)
