#!/bin/csh
# if you make arg 1 crustal, only crustal sources are added deep omitted
#cshell script for combining WUS background or gridded hazard
# USGS 2007 2008 PSHA
set PGMDIR = /home/harmsen/bin
# other users will need to reset paths
if ($1 == crustal)goto crustal
if ($1 == two) goto two
echo combining the wus gridded
$PGMDIR/hazallXL.v2 combine.grid1107.1hz
$PGMDIR/hazallXL.v2 combine.grid1107.5hz
$PGMDIR/hazallXL.v2 combine.grid1107.pga
$PGMDIR/hazallXL.v2 combine.grid1107.1hz.p
$PGMDIR/hazallXL.v2 combine.grid1107.1hz.m
$PGMDIR/hazallXL.v2 combine.grid1107.5hz.p
$PGMDIR/hazallXL.v2 combine.grid1107.5hz.m
$PGMDIR/hazallXL.v2 combine.grid1107.pga.p
$PGMDIR/hazallXL.v2 combine.grid1107.pga.m
$PGMDIR/hazallXL.v2 combine.wusgrid.2007.1hz
$PGMDIR/hazallXL.v2 combine.wusgrid.2007.5hz
$PGMDIR/hazallXL.v2 combine.wusgrid.2007.pga
echo Next we interpolate the grids to 0.05 d, using hazinterp.nga
hazinterp.nga < hazinterp.grid.in
ls -l wusgrid.*.2007
ls -l wusgrid05.*.2007
exit 0
two:
$PGMDIR/hazallXL.v2 combine.grid.2hz
$PGMDIR/hazallXL.v2 combine.grid.2hz.m
$PGMDIR/hazallXL.v2 combine.grid.2hz.p
$PGMDIR/hazallXL.v2 combine.grid.2sc
$PGMDIR/hazallXL.v2 combine.grid.2sc.p
$PGMDIR/hazallXL.v2 combine.grid.2sc.m
echo next combine branches and interpolate
$PGMDIR/hazallXL.v2 combine.wusgrid.2007.2hz
$PGMDIR/hazallXL.v2 combine.wusgrid.2007.2sc
hazinterp.nga < hazinterp.grid2.in
ls -l wusgrid*.2*.2007
exit 0
crustal:
echo combining the wus CRUSTAL gridded only
$PGMDIR/hazallXL.v2 combine.gridBC.1hz
$PGMDIR/hazallXL.v2 combine.gridBC.5hz
$PGMDIR/hazallXL.v2 combine.gridBC.pga
$PGMDIR/hazallXL.v2 combine.gridBC.1hz.p
$PGMDIR/hazallXL.v2 combine.gridBC.1hz.m
$PGMDIR/hazallXL.v2 combine.gridBC.5hz.p
$PGMDIR/hazallXL.v2 combine.gridBC.5hz.m
$PGMDIR/hazallXL.v2 combine.gridBC.pga.p
$PGMDIR/hazallXL.v2 combine.gridBC.pga.m
$PGMDIR/hazallXL.v2 combine.wusgrid.BC.1hz
$PGMDIR/hazallXL.v2 combine.wusgrid.BC.5hz
$PGMDIR/hazallXL.v2 combine.wusgrid.BC.pga
echo Next we interpolate the grids to 0.05 d, using hazinterp.nga
$PGMDIR/hazinterp.nga < hazinterp.BC.in
ls -l wusgrid.*.BCROCK
ls -l wusgrid05.*.BCROCK
exit 0
