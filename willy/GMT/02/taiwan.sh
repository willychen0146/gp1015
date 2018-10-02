# background
psbasemap -Ba1f1/a1f1::EwNs -Jm2 -R119/123/21/26 -G0/250/250 -K -Yc -Xc> report.ps
# coastline
pscoast -J -B -R -O -Di -W1 -G250/250/0 -K >> report.ps
# earthquake location
psxy eq.list -J -B -R -Sc0.01 -W0.01 -G150/0/0 -O -K >> report.ps

makecpt -T0/315/15 -Crainbow -Z > depth.cpt

awk '{ if ($4<=3) print $1,$2,$3}' eq.list| psxy eq.list -J -B -R -Sc0.01 -W0.01 -Cdepth.cpt -O -K>> report.ps
awk '{ if ($4=4 && $4>3) print $1,$2,$3}' eq.list| psxy eq.list -J -B -R -Sc0.01 -W0.01 -Cdepth.cpt -O -K>> report.ps
awk '{ if ($4<=5 && $4>4) print $1,$2,$3}' eq.list| psxy eq.list -J -B -R -Sc0.01 -W0.01 -Cdepth.cpt -O -K>> report.ps
awk '{ if ($4>5) print $1,$2,$3}' eq.list| psxy eq.list -J -B -R -Sc0.01 -W0.01 -Cdepth.cpt -O -K>> report.ps
# core
echo 121.29 22.83 | psxy -R -J -Sc0.8 -G255/0/0 -O -K >>report.ps
# core name
echo 121.15 22.9 12 0 0 CM M:4.6 Depth:5.9km| pstext -J -B -R -O -K >> report.ps
