#!/bin/bash

# Skrip untuk membuat gambar dengan gnuplot

# Membuat file data untuk titik G dan G'
echo "7 -5" > titik_G.dat
echo "4 -1" > titik_G_prime.dat

# Menghitung translasi a dan b
a=$((4 - 7))
b=$((-1 - (-5)))

# Membuat file data untuk titik T
echo "$a $b" > titik_T.dat

# Skrip gnuplot
gnuplot << EOF
set terminal png size 600,400
set output "translasi.png"
set xrange [-10:10]
set yrange [-10:10]
set grid
set xlabel "X"
set ylabel "Y"
set title "Translasi Titik G ke G'"

# Plot titik G
plot "titik_G.dat" using 1:2 with points pt 7 lc rgb "blue" title "G (7, -5)", \
     
     # Plot titik G'
     "titik_G_prime.dat" using 1:2 with points pt 7 lc rgb "red" title "G' (4, -1)", \
     
     # Plot vektor translasi
     "titik_G.dat" using (\$1):(b) with vectors head filled size 0.5,15,60 lc rgb "green" notitle, \
     
     # Plot titik T
     "titik_T.dat" using 1:2 with points pt 7 lc rgb "black" title "T ($a,$b)"
EOF

# Menghapus file data
rm titik_G.dat titik_G_prime.dat titik_T.dat

echo "Gambar telah dibuat: translasi.png"
