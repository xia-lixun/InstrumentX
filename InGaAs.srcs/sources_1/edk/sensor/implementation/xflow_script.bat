@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc7z010clg400-1 -nt timestamp -bm sensor.bmm "D:/Git/InstrumentX/InGaAs.srcs/sources_1/edk/sensor/implementation/sensor.ngc" -uc sensor.ucf sensor.ngd 

@REM #
@REM # Command line for map
@REM #
map -o sensor_map.ncd -w -pr b -ol high -timing -detail -logic_opt on -intstyle pa -register_duplication -xe n sensor.ngd sensor.pcf 

