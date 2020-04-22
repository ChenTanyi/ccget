CC = g++
LIBS = -lssl -lcrypto

# Compiler flags, -g for debug, -c to make an object file
CFLAGS = -c -g

TARGET = ccget

SRC := src
OBJ := obj

SOURCES := $(wildcard $(SRC)/*.cc)
OBJECTS := $(patsubst $(SRC)/%.cc, $(OBJ)/%.o, $(SOURCES))

# Link the target with all objects and libraries
$(TARGET) : $(OBJECTS)
	$(CC)  -o $(TARGET) $(OBJECTS) $(LIBS)

# Compile the source files into object files
$(OBJ)/%.o: $(SRC)/%.cc
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(TARGET) $(OBJECTS)