1. Compile the example source fft_2d.f90

make

or

gfortran fft_2d.f90 -o fft_2d.x -I/usr/include -lfftw3

2. Execute the code and generate plot.dat

./fft_2d.x > plot.dat

3. Plot 2D function

gnuplot plot.gnu

(Press enter to quit the gnuplot windowsi)

Task: Modify the code in order to solve 2D Poisson equation for


             x + y
f(x,y) =  2 E      x y (-3 + x + y + x y)

f(x,y) = 2 * exp(x+y)*x*y*(x*y+x+y-3)

Solution is: u(x,y) = x*y*(1-x)*(1-y)*exp(x+y)
