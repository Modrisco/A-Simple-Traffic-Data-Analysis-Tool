cd 'C:\Users\Meng\Desktop\Presentation'
set term png
set output "packet.png"
set title "pr"  
set xlabel "Packets"  
set ylabel "PR/Frequency"  
set xrange [-1:6]  
set yrange [0:10]    
set boxwidth 0.5
set style fill solid 0.5
plot "result.csv" using 1:(1) smooth frequency w boxes t "frequency"

set term png
set output "time.png"  
set title "ping time"  
set xlabel "server"  
set ylabel "time"  
set xrange [-1:10]  
set yrange [0:100]  
plot "time.csv" using 1 title "minimum" with linespoints, '' using 2 title "maximum" with linespoints, '' using 3 title "average"  with linespoints