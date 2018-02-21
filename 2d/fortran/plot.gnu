set xlabel "x"
set ylabel "y"
set zlabel "u(x,y)"

set dgrid3d 128, 128 
set hidden3d
splot "plot.dat" u 1:2:3 w l title "u(x,y)"

pause -1
