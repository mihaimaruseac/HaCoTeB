.PHONY: all clean

all: hacoteb

hacoteb:
	cd src && make
	mv src/hacoteb .

clean:
	cd src && make clean
	rm -f *.hi *.o Main hacoteb
