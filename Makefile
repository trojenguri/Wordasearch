CXX=g++
CPPFLAGS=--std=c++11 -O2
LDFLAGS=$(shell pkg-config --cflags opencv)
LDLIBS=$(shell pkg-config --libs opencv) -I/usr/include/leptonica -I/usr/include/tesseract -llept -ltesseract 

SRCS=detect.cpp trie/trie.cpp trie/trienode.cpp graph/graph.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

all: detect

detect: $(OBJS)
	$(CXX) $(CPPFLAGS) $(OBJS) -o detect $(LDFLAGS) $(LDLIBS)

trie.o: trie.cpp trie.h trienode.h
trienode.o: trienode.cpp trienode.h
graph/graph.o: graph/graph.cpp graph/graph.h

clean:
	$(RM) $(OBJS) ./detect
