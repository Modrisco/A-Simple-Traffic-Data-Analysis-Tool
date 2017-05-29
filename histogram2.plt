cd 'C:\Users\Meng\Desktop\Presentation'
set term png
set output "localpacket.png"
set title "pr"  
set xlabel "Packets"  
set ylabel "PR/Frequency"  
set xrange [-1:6]  
set yrange [0:7]    
set boxwidth 0.5
set style fill solid 0.5
plot "localresult.csv" using 1:(1) smooth frequency w boxes t "frequency"

set term png
set output "localtime.png"  
set title "ping time"  
set xlabel "server"  
set ylabel "time"  
set xrange [-1:6]  
set yrange [0:50]  
plot "localtime.csv" using 1 title "minimum" with linespoints, '' using 2 title "maximum" with linespoints, '' using 3 title "average"  with linespoints