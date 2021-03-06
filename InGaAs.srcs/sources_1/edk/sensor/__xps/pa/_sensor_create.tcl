######################################################
#
# XPS Tcl API script generated by PlanAhead
#
######################################################

cd "C:/Users/lixun/Documents/Hardware/zynq7010/InGaAs/InGaAs.srcs/sources_1/edk/sensor"
if { [xload new sensor.xmp] != 0 } {
  exit -1
}
xset arch zynq
xset dev xc7z010
xset package clg400
xset speedgrade -1

xset binfo 

if { [xset hier sub] != 0 } {
  exit -1
}
xset hdl vhdl
save proj
exit
