.PHONY: all clean run

TARGET = hctb
SOURCES = $(shell find . -type f -name '*.hs')
HIFILES = $(patsubst %.hs, %.hi, $(SOURCES))
OFILES = $(patsubst %.hs, %.o, $(SOURCES))

all: $(TARGET)

$(TARGET): $(SOURCES)
	@ghc --make Main.hs -o $(TARGET)

run: $(TARGET)
	./$(TARGET) ../test/examples/1.txt
	./$(TARGET) ../test/examples/2.txt

clean:
	@$(RM) $(TARGET) $(HIFILES) $(OFILES)
