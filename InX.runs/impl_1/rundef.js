//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "D:/Xilinx/14.7/ISE_DS/EDK/bin/nt64;D:/Xilinx/14.7/ISE_DS/EDK/lib/nt64;D:/Xilinx/14.7/ISE_DS/ISE/bin/nt64;D:/Xilinx/14.7/ISE_DS/ISE/lib/nt64;D:/Xilinx/14.7/ISE_DS/common/bin/nt64;D:/Xilinx/14.7/ISE_DS/common/lib/nt64;D:/Xilinx/14.7/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "D:/Xilinx/14.7/ISE_DS/EDK/bin/nt64;D:/Xilinx/14.7/ISE_DS/EDK/lib/nt64;D:/Xilinx/14.7/ISE_DS/ISE/bin/nt64;D:/Xilinx/14.7/ISE_DS/ISE/lib/nt64;D:/Xilinx/14.7/ISE_DS/common/bin/nt64;D:/Xilinx/14.7/ISE_DS/common/lib/nt64;D:/Xilinx/14.7/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "bitgen",
         "\"SensorMP_stub_routed.ncd\" \"SensorMP_stub.bit\" \"SensorMP_stub.pcf\" -w -intstyle pa" );
// post-commands:
ISEStep( "data2mem",
         " -bm \"SensorMP_stub_bd.bmm\" -bt \"SensorMP_stub.bit\"  -bd \"D:/Git/Sandbox/InX.srcs/sources_1/imports/microblaze/mb_bootloop_le.elf\" tag SensorMP_i_microblaze_0 -o b \"download.bit\" -p xc7z010clg400-1" );






function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
