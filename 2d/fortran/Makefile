FC=gfortran
CFLAGS=-I/usr/include -O3
LDFLAGS=-lfftw3
EXE=fft_2d.x
SRC=fft_2d.f90
OBJ=$(SRC:.f90=.o)

all: $(SRC) $(EXE)

$(EXE): $(OBJ)
	$(FC) $(OBJ) -o $(EXE) $(LDFLAGS)


%.o: %.f90 
	$(FC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.mod $(OBJ) $(EXE) plot.dat
