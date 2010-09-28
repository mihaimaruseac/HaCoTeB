.PHONY: all clean

all:
	cd src && make
	mv src/hacoteb .

clean:
	cd src && make clean
	rm -f *.hi *.o Main hacoteb
