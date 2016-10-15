CC = gcc
CXX = g++
LD = g++

CFLAGS = -I/usr/include/SDL -O0 -g -fsingle-precision-constant -ftree-vectorize
CFLAGS += -I. -Ilib/enet/include -Isrc -Ilib/irrlicht/include -Ilib/bullet/src -I/usr/include/freetype2/freetype -I/usr/include/freetype2 -I/usr/include/AL
CFLAGS += -DHAVE_OGGVORBIS -DNDEBUG
CXXFLAGS = $(CFLAGS) -std=gnu++03

LDFLAGS = -lSDL -lm -lpng -ljpeg -lGL -lz -lopenal -logg -lvorbis -lvorbisfile -lcurl -pthread -Wl,--gc-sections -flto 
EXE = gears
OBJS = $(patsubst %.c, %.o, $(shell find . -name \*.c))
OBJS += $(patsubst %.cpp, %.o, $(shell find . -name \*.cpp))
OBJS += $(patsubst %.S, %.o, $(shell find . -name \*.S))

all: $(EXE)

%.o: %.cpp
	@echo Compiling $<...
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(EXE): $(OBJS)
	$(LD) $^ -o $@ $(CXXFLAGS) $(LDFLAGS)

.PHONY: clean
clean:
	rm -f `find . -name \*.o`
	rm -f $(EXE)
