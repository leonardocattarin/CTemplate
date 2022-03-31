PROGNAME = main
_DEPS = functions
CLEANUP = plot.png data.csv

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

.PHONY: clean, clean-output

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ $(PROGNAME)

clean-output:
	rm -f $(CLEANUP)
	
run: $(PROGNAME)
	./$(PROGNAME)
	gnuplot plot.p
