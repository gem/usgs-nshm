#!/bin/csh
echo California fault seismic hazard. About to run aFault_aPriori, MoBal, and unseg
echo Creeping section of SAF flt is also run here although  2007 model is GR like
echo Input files are current as of March 26 2008
echo hazFXnga7c is the version of hazFXnga with latest 2008 NGA updates
cd /home/harmsen/CA
hazFXnga7c aFault_aPriori_D2.1.in > aF1.log
hazFXnga7c aFault_MoBal_EllB.in > aF2.log
hazFXnga7c aFault_MoBal.HB.in > aF3.log
hazFXnga7c aFault_unsegEll.in > aF4.log
hazFXnga7c aFault_unseg_HB.in > aF5.log
hazFXnga7c creepflt.new.in > creepf.log &
echo Finished 5  California afault runs, plus creeping section
echo Creeping section has a GR model for 2007 final
exit
