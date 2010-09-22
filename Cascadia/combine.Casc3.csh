#!/bin/csh
echo This script combines the various Cascadia source files into one per SA period
echo 'Two such combined files are written one at 0.1 d spatial sampling one at 0.05 d.'
if ($1 == ab ) goto ab
if ($1 == combine3 ) goto combine3
hazallXL.v2 combine.zhao.1hz
hazallXL.v2 combine.geox.1hz
hazallXL.v2 combine.zhao.5hz
hazallXL.v2 combine.geox.5hz
hazallXL.v2 combine.zhao.pga
hazallXL.v2 combine.geox.pga
ab:
hazallXL.v2 combine.ab.1hz
hazallXL.v2 combine.ab.5hz
hazallXL.v2 combine.ab.pga
combine3:
echo Here Cascadia files have been combined for each of three atten models
echo Next, the three are combined into one for each period in 1hz 5hz pga
hazallXL.v2 combine.3attn.5hz
hazallXL.v2 combine.3attn.pga
hazallXL.v2 combine.3attn.1hz
echo Next the 0.1 d data are interpolated onto a 0.05 d grid
hazinterp.nga < hazinterp.in
ls -l cascadia.05d.*
echo The above files may be added to the fault and background source files sampled 0.05
exit 0
