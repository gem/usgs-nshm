#!/bin/csh
# run camap  and other Calif. background for 2008 USGS PSHA model
set PATH = ( /home/harmsen/bin $PATH )
# The above insures that programs in harmsen/bin will be used for the runs
echo run CAmap, creepmap, brawmap, and others
echo Argument 1 should be a subdirectory name where log files will go.
if ($1a == a)goto error
if ($2 == shear ) goto SHEAR
# May want subset of runs involving strike slip only
hazgridXnga2 CAdeep.in > $1/cadeep.log
echo Below CAmapC and CAmapG runs use a special wtgrid to reduce mag gt 6.5 rates
hazgridXnga3 CAmapC_21.in > $1/cac21.log &
hazgridXnga3 CAmapC_24.in > $1/cac24.log &
hazgridXnga3 CAmapG_21.in > $1/cag21.log &
hazgridXnga3 CAmapG_24.in > $1/cag24.log &
hazgridXnga3 brawmap.in > $1/braw.log
hazgridXnga2 creepmap.in > $1/creepm.log
SHEAR:
# San Gorgornio pass region
hazgridXnga3 sangreg.in > $1/gorgornio.log
# Creeping section, near Parkfield CA
hazgridXnga3 Mendomap.in > $1/mendo.log &
echo next South of Ca extensional region impext
hazgridXnga3 impextC.in > $1/iec.log &
hazgridXnga3 impextG.in > $1/ieg.log &
hazgridXnga3 mojave.in > $1/mojave.log
echo Next shear zones of CA-NV border region
hazgridXnga2 SHEAR1.in > $1/she1c.log &
hazgridXnga2 SHEAR2.in > $1/she2g.log &
hazgridXnga2 SHEAR3.in > $1/she3c.log &
hazgridXnga2 SHEAR4.in > $1/she4g.log &
exit 0
error:
echo please enter the Log file directory or folder as arg 1
exit 1
