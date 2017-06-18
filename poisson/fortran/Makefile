FC=gfortran
CFLAGS=-I/usr/include -O3
LDFLAGS=-lfftw3
EXE=poisson.x
SRC=poisson.f90
OBJ=$(SRC:.f90=.o)

all: $(SRC) $(EXE)

$(EXE): $(OBJ)
	$(FC) $(LDFLAGS) $(OBJ) -o $(EXE)


%.o: %.f90 
	$(FC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.mod $(OBJ) $(EXE)
