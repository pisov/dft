set size ratio 1
set xlabel "freq"
set ylabel "Amplitude (frequence domain)"
set x2label "time"
set y2label "Amplitude (time domain)"
set xtics nomirror
set x2tics nomirror
set ytics nomirror
set y2tics nomirror

plot   "heaviside.dat" u 2:4 title "Real part"               w boxes 
replot "heaviside.dat" u 2:5 title "Imagenary part"          w boxes 
replot "heaviside.dat" u 1:3 title "Time domain - Real part" w lp pt 5 ps 0.5 axes x2y2
pause -1
