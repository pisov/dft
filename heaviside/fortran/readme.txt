1. Compile the example

gfortran fft_heaviside.f90 -I/usr/include -lfftw3 -o fft.x

2. Execute and create data file

./fft.x > heaviside.dat

3. Plot the result function

gnuplot plot.gnu

4. Exercise

4.1 Write code who make BACKWARD transform

4.2 Change the Signal function with triangular shape:

        /
        | 2 * x      , x < 1/2
h(x) = < 
        | 2 * (1 - x), x >= 1/2
        \

4.3 Create time shift using transform:

 
h'(x-x0) <=> H(f) * Exp[ 2 * i * Pi * f * x0  ]

         N    N
k = [ - ---, --- ]
         2    2
      k
f = -----
 k   N*D 

D = 1 / N

4.4 Plot both shifted and original functions h(x) and h'(x) for x0 = 0.2


