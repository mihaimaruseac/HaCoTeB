.PHONY: all clean run

TARGET = hctb
TEST = ../test/examples/1.txt

all: $(TARGET)

$(TARGET):
	@ghc --make Main.hs -o $(TARGET)

run: $(TARGET)
	./$(TARGET) $(TEST)

clean:
	@$(RM) *.hi *.o $(TARGET)
	@$(RM) HaCoTeB/*.hi HaCoTeB/*.o
	@$(RM) HaCoTeB/Parse/*.hi HaCoTeB/Parse/*.o
	@$(RM) HaCoTeB/Output/*.hi HaCoTeB/Output/*.o
