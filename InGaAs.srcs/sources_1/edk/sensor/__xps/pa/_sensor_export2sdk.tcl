######################################################
#
# XPS Tcl API script generated by PlanAhead
#
######################################################

proc _main_ {} {
  cd "C:/Users/lixun/Documents/Hardware/zynq7010/InGaAs/InGaAs.srcs/sources_1/edk/sensor"
  if { [ catch {xload xmp sensor.xmp} result ] } {
    exit 10
  }
  # Set the export bmm/bit 0
  xset sdk_export_bmm_bit 0
  # Set the export dir
  xset sdk_export_dir C:/Users/lixun/Documents/Hardware/zynq7010/InGaAs/InGaAs.sdk/SDK/SDK_Export
  if { [catch {run exporttosdk} result] } {
    return -1
  }
  return $result
}

# Export Hardware Data
if { [catch {_main_} result] } {
  exit -1
}

# Check return status and exit
if { [string length $result] == 0 } {
  exit 0
} else {
  exit $result
}
