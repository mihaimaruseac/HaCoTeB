.PHONY: all clean doc test src run

all: src doc

src:
	@make -s -C src

run:
	@make -s -C src run

doc:
	@make -s -C doc

clean:
	@make -s -C doc clean
	@make -s -C src clean

test:
	@cd test && ./test.sh; cd -

