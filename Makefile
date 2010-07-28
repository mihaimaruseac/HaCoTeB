.PHONY: all clean

all: hacoteb

hacoteb: *.hs
	ghc --make Main.hs
	mv Main hacoteb

clean:
	rm -f *.hi *.o Main hacoteb
