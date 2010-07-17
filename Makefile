# DO NOT DELETE: Beginning of Haskell dependencies
#HaCoTeB.o : HaCoTeB.hs
#Main.o : Main.hs
#Main.o : HaCoTeB.hi
# DO NOT DELETE: End of Haskell dependencies

.PHONY: all clean

all: hacoteb

hacoteb: *.hs
	ghc --make Main.hs
	mv Main hacoteb

clean:
	rm -f *.hi *.o Main hacoteb
