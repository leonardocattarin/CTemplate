PROGNAME = Main
_DEPS = functions

LIBS=-lm

IDIR =./include
ODIR=.
LDIR =../lib

CC=gcc
CFLAGS=-I$(IDIR) -Wall

DEPS_H = $(patsubst %,$(IDIR)/%.h,$(_DEPS).h)
DEPS_O = $(patsubst %,%.o,$(_DEPS))

_OBJ = $(PROGNAME).o $(DEPS_O)
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS_H)
	$(CC) -c -o $@ $< $(CFLAGS)

$(PROGNAME): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
	rm -f $(PROGNAME)
	rm -f plot.png
	
run: $(PROGNAME)
	./$(PROGNAME)
	gnuplot plot.p
