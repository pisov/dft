set xrange [0:1]

set xlabel "x"
set ylabel "u(x)"

plot "plot.dat" u 1:3 w p pt 6 title "FFT"
replot x*(1-x)*exp(x) w l title "Exact"

pause -1
