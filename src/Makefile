.PHONY: all clean run

TARGET = hctb
ALEXSOURCES = $(shell find . -type f -name '*.x')
ALEX_GEN_SOURCES = $(patsubst %.x, %.hs, $(ALEXSOURCES))
ALEX = alex
SOURCES = $(shell find . -type f -name '*.hs')
HIFILES = $(patsubst %.hs, %.hi, $(SOURCES))
OFILES = $(patsubst %.hs, %.o, $(SOURCES))

all: $(TARGET)

%.hs: %.x
	@$(ALEX) $<

$(TARGET): $(SOURCES) $(ALEX_GEN_SOURCES)
	@ghc --make Main.hs -o $(TARGET)

run: $(TARGET)
	./$(TARGET) ../test/examples/1.txt
	./$(TARGET) ../test/examples/2.txt

clean:
	@$(RM) $(TARGET) $(HIFILES) $(OFILES) $(ALEX_GEN_SOURCES)
