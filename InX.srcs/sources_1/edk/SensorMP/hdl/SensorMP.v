//-----------------------------------------------------------------------------
// SensorMP.v
//-----------------------------------------------------------------------------

module SensorMP
  (
    processing_system7_0_MIO,
    processing_system7_0_PS_SRSTB_pin,
    processing_system7_0_PS_CLK_pin,
    processing_system7_0_PS_PORB_pin,
    processing_system7_0_DDR_Clk,
    processing_system7_0_DDR_Clk_n,
    processing_system7_0_DDR_CKE,
    processing_system7_0_DDR_CS_n,
    processing_system7_0_DDR_RAS_n,
    processing_system7_0_DDR_CAS_n,
    processing_system7_0_DDR_WEB_pin,
    processing_system7_0_DDR_BankAddr,
    processing_system7_0_DDR_Addr,
    processing_system7_0_DDR_ODT,
    processing_system7_0_DDR_DRSTB,
    processing_system7_0_DDR_DQ,
    processing_system7_0_DDR_DM,
    processing_system7_0_DDR_DQS,
    processing_system7_0_DDR_DQS_n,
    processing_system7_0_DDR_VRN,
    processing_system7_0_DDR_VRP,
    RESET,
    fsl_i2s_0_i2s_bck_pin,
    fsl_i2s_0_i2s_lrck_pin,
    fsl_i2s_0_i2s_dati_pin,
    fsl_i2s_1_i2s_bck_pin,
    fsl_i2s_1_i2s_lrck_pin,
    fsl_i2s_1_i2s_dati_pin
  );
  inout [53:0] processing_system7_0_MIO;
  input processing_system7_0_PS_SRSTB_pin;
  input processing_system7_0_PS_CLK_pin;
  input processing_system7_0_PS_PORB_pin;
  inout processing_system7_0_DDR_Clk;
  inout processing_system7_0_DDR_Clk_n;
  inout processing_system7_0_DDR_CKE;
  inout processing_system7_0_DDR_CS_n;
  inout processing_system7_0_DDR_RAS_n;
  inout processing_system7_0_DDR_CAS_n;
  output processing_system7_0_DDR_WEB_pin;
  inout [2:0] processing_system7_0_DDR_BankAddr;
  inout [14:0] processing_system7_0_DDR_Addr;
  inout processing_system7_0_DDR_ODT;
  inout processing_system7_0_DDR_DRSTB;
  inout [31:0] processing_system7_0_DDR_DQ;
  inout [3:0] processing_system7_0_DDR_DM;
  inout [3:0] processing_system7_0_DDR_DQS;
  inout [3:0] processing_system7_0_DDR_DQS_n;
  inout processing_system7_0_DDR_VRN;
  inout processing_system7_0_DDR_VRP;
  input RESET;
  input fsl_i2s_0_i2s_bck_pin;
  input fsl_i2s_0_i2s_lrck_pin;
  input fsl_i2s_0_i2s_dati_pin;
  input fsl_i2s_1_i2s_bck_pin;
  input fsl_i2s_1_i2s_lrck_pin;
  input fsl_i2s_1_i2s_dati_pin;

  // Internal signals

  wire Ext_BRK;
  wire Ext_NM_BRK;
  wire [0:31] bram_cntlr_data_portb_BRAM_Addr;
  wire bram_cntlr_data_portb_BRAM_Clk;
  wire [0:31] bram_cntlr_data_portb_BRAM_Din;
  wire [0:31] bram_cntlr_data_portb_BRAM_Dout;
  wire bram_cntlr_data_portb_BRAM_EN;
  wire bram_cntlr_data_portb_BRAM_Rst;
  wire [0:3] bram_cntlr_data_portb_BRAM_WEN;
  wire [0:31] bram_cntlr_instruction_porta_BRAM_Addr;
  wire bram_cntlr_instruction_porta_BRAM_Clk;
  wire [0:31] bram_cntlr_instruction_porta_BRAM_Din;
  wire [0:31] bram_cntlr_instruction_porta_BRAM_Dout;
  wire bram_cntlr_instruction_porta_BRAM_EN;
  wire bram_cntlr_instruction_porta_BRAM_Rst;
  wire [0:3] bram_cntlr_instruction_porta_BRAM_WEN;
  wire [0:0] clock_generator_0_CLKOUT0;
  wire clock_generator_0_LOCKED;
  wire debug_module_0_Debug_SYS_Rst;
  wire debug_module_0_MBDEBUG_0_Dbg_Capture;
  wire debug_module_0_MBDEBUG_0_Dbg_Clk;
  wire [0:7] debug_module_0_MBDEBUG_0_Dbg_Reg_En;
  wire debug_module_0_MBDEBUG_0_Dbg_Shift;
  wire debug_module_0_MBDEBUG_0_Dbg_TDI;
  wire debug_module_0_MBDEBUG_0_Dbg_TDO;
  wire debug_module_0_MBDEBUG_0_Dbg_Update;
  wire debug_module_0_MBDEBUG_0_Debug_Rst;
  wire fsl_v20_0_i2s_mb0_FSL_M_Control;
  wire [0:31] fsl_v20_0_i2s_mb0_FSL_M_Data;
  wire fsl_v20_0_i2s_mb0_FSL_M_Full;
  wire fsl_v20_0_i2s_mb0_FSL_M_Write;
  wire fsl_v20_0_i2s_mb0_FSL_S_Control;
  wire [0:31] fsl_v20_0_i2s_mb0_FSL_S_Data;
  wire fsl_v20_0_i2s_mb0_FSL_S_Exists;
  wire fsl_v20_0_i2s_mb0_FSL_S_Read;
  wire fsl_v20_1_i2s_mb0_FSL_M_Control;
  wire [0:31] fsl_v20_1_i2s_mb0_FSL_M_Data;
  wire fsl_v20_1_i2s_mb0_FSL_M_Full;
  wire fsl_v20_1_i2s_mb0_FSL_M_Write;
  wire fsl_v20_1_i2s_mb0_FSL_S_Control;
  wire [0:31] fsl_v20_1_i2s_mb0_FSL_S_Data;
  wire fsl_v20_1_i2s_mb0_FSL_S_Exists;
  wire fsl_v20_1_i2s_mb0_FSL_S_Read;
  wire [0:31] lmb_v10_0_LMB_ABus;
  wire lmb_v10_0_LMB_AddrStrobe;
  wire [0:3] lmb_v10_0_LMB_BE;
  wire lmb_v10_0_LMB_CE;
  wire [0:31] lmb_v10_0_LMB_ReadDBus;
  wire lmb_v10_0_LMB_ReadStrobe;
  wire lmb_v10_0_LMB_Ready;
  wire lmb_v10_0_LMB_Rst;
  wire lmb_v10_0_LMB_UE;
  wire lmb_v10_0_LMB_Wait;
  wire [0:31] lmb_v10_0_LMB_WriteDBus;
  wire lmb_v10_0_LMB_WriteStrobe;
  wire [0:31] lmb_v10_0_M_ABus;
  wire lmb_v10_0_M_AddrStrobe;
  wire lmb_v10_0_M_ReadStrobe;
  wire [0:0] lmb_v10_0_Sl_CE;
  wire [0:31] lmb_v10_0_Sl_DBus;
  wire [0:0] lmb_v10_0_Sl_Ready;
  wire [0:0] lmb_v10_0_Sl_UE;
  wire [0:0] lmb_v10_0_Sl_Wait;
  wire [0:31] lmb_v10_1_LMB_ABus;
  wire lmb_v10_1_LMB_AddrStrobe;
  wire [0:3] lmb_v10_1_LMB_BE;
  wire lmb_v10_1_LMB_CE;
  wire [0:31] lmb_v10_1_LMB_ReadDBus;
  wire lmb_v10_1_LMB_ReadStrobe;
  wire lmb_v10_1_LMB_Ready;
  wire lmb_v10_1_LMB_Rst;
  wire lmb_v10_1_LMB_UE;
  wire lmb_v10_1_LMB_Wait;
  wire [0:31] lmb_v10_1_LMB_WriteDBus;
  wire lmb_v10_1_LMB_WriteStrobe;
  wire [0:31] lmb_v10_1_M_ABus;
  wire lmb_v10_1_M_AddrStrobe;
  wire [0:3] lmb_v10_1_M_BE;
  wire [0:31] lmb_v10_1_M_DBus;
  wire lmb_v10_1_M_ReadStrobe;
  wire lmb_v10_1_M_WriteStrobe;
  wire [0:0] lmb_v10_1_Sl_CE;
  wire [0:31] lmb_v10_1_Sl_DBus;
  wire [0:0] lmb_v10_1_Sl_Ready;
  wire [0:0] lmb_v10_1_Sl_UE;
  wire [0:0] lmb_v10_1_Sl_Wait;
  wire microblaze_0_MB_Reset;
  wire [31:0] microblaze_0_axi_ipc_M_ARADDR;
  wire [1:0] microblaze_0_axi_ipc_M_ARBURST;
  wire [3:0] microblaze_0_axi_ipc_M_ARCACHE;
  wire [0:0] microblaze_0_axi_ipc_M_ARID;
  wire [7:0] microblaze_0_axi_ipc_M_ARLEN;
  wire [1:0] microblaze_0_axi_ipc_M_ARLOCK;
  wire [2:0] microblaze_0_axi_ipc_M_ARPROT;
  wire [3:0] microblaze_0_axi_ipc_M_ARQOS;
  wire [0:0] microblaze_0_axi_ipc_M_ARREADY;
  wire [2:0] microblaze_0_axi_ipc_M_ARSIZE;
  wire [0:0] microblaze_0_axi_ipc_M_ARVALID;
  wire [31:0] microblaze_0_axi_ipc_M_AWADDR;
  wire [1:0] microblaze_0_axi_ipc_M_AWBURST;
  wire [3:0] microblaze_0_axi_ipc_M_AWCACHE;
  wire [0:0] microblaze_0_axi_ipc_M_AWID;
  wire [7:0] microblaze_0_axi_ipc_M_AWLEN;
  wire [1:0] microblaze_0_axi_ipc_M_AWLOCK;
  wire [2:0] microblaze_0_axi_ipc_M_AWPROT;
  wire [3:0] microblaze_0_axi_ipc_M_AWQOS;
  wire [0:0] microblaze_0_axi_ipc_M_AWREADY;
  wire [2:0] microblaze_0_axi_ipc_M_AWSIZE;
  wire [0:0] microblaze_0_axi_ipc_M_AWVALID;
  wire [0:0] microblaze_0_axi_ipc_M_BID;
  wire [0:0] microblaze_0_axi_ipc_M_BREADY;
  wire [1:0] microblaze_0_axi_ipc_M_BRESP;
  wire [0:0] microblaze_0_axi_ipc_M_BVALID;
  wire [63:0] microblaze_0_axi_ipc_M_RDATA;
  wire [0:0] microblaze_0_axi_ipc_M_RID;
  wire [0:0] microblaze_0_axi_ipc_M_RLAST;
  wire [0:0] microblaze_0_axi_ipc_M_RREADY;
  wire [1:0] microblaze_0_axi_ipc_M_RRESP;
  wire [0:0] microblaze_0_axi_ipc_M_RVALID;
  wire [63:0] microblaze_0_axi_ipc_M_WDATA;
  wire [0:0] microblaze_0_axi_ipc_M_WID;
  wire [0:0] microblaze_0_axi_ipc_M_WLAST;
  wire [0:0] microblaze_0_axi_ipc_M_WREADY;
  wire [7:0] microblaze_0_axi_ipc_M_WSTRB;
  wire [0:0] microblaze_0_axi_ipc_M_WVALID;
  wire [31:0] microblaze_0_axi_ipc_S_ARADDR;
  wire [1:0] microblaze_0_axi_ipc_S_ARBURST;
  wire [3:0] microblaze_0_axi_ipc_S_ARCACHE;
  wire [0:0] microblaze_0_axi_ipc_S_ARID;
  wire [7:0] microblaze_0_axi_ipc_S_ARLEN;
  wire [1:0] microblaze_0_axi_ipc_S_ARLOCK;
  wire [2:0] microblaze_0_axi_ipc_S_ARPROT;
  wire [3:0] microblaze_0_axi_ipc_S_ARQOS;
  wire [0:0] microblaze_0_axi_ipc_S_ARREADY;
  wire [2:0] microblaze_0_axi_ipc_S_ARSIZE;
  wire [4:0] microblaze_0_axi_ipc_S_ARUSER;
  wire [0:0] microblaze_0_axi_ipc_S_ARVALID;
  wire [31:0] microblaze_0_axi_ipc_S_AWADDR;
  wire [1:0] microblaze_0_axi_ipc_S_AWBURST;
  wire [3:0] microblaze_0_axi_ipc_S_AWCACHE;
  wire [0:0] microblaze_0_axi_ipc_S_AWID;
  wire [7:0] microblaze_0_axi_ipc_S_AWLEN;
  wire [1:0] microblaze_0_axi_ipc_S_AWLOCK;
  wire [2:0] microblaze_0_axi_ipc_S_AWPROT;
  wire [3:0] microblaze_0_axi_ipc_S_AWQOS;
  wire [0:0] microblaze_0_axi_ipc_S_AWREADY;
  wire [2:0] microblaze_0_axi_ipc_S_AWSIZE;
  wire [4:0] microblaze_0_axi_ipc_S_AWUSER;
  wire [0:0] microblaze_0_axi_ipc_S_AWVALID;
  wire [0:0] microblaze_0_axi_ipc_S_BID;
  wire [0:0] microblaze_0_axi_ipc_S_BREADY;
  wire [1:0] microblaze_0_axi_ipc_S_BRESP;
  wire [0:0] microblaze_0_axi_ipc_S_BUSER;
  wire [0:0] microblaze_0_axi_ipc_S_BVALID;
  wire [63:0] microblaze_0_axi_ipc_S_RDATA;
  wire [0:0] microblaze_0_axi_ipc_S_RID;
  wire [0:0] microblaze_0_axi_ipc_S_RLAST;
  wire [0:0] microblaze_0_axi_ipc_S_RREADY;
  wire [1:0] microblaze_0_axi_ipc_S_RRESP;
  wire [0:0] microblaze_0_axi_ipc_S_RUSER;
  wire [0:0] microblaze_0_axi_ipc_S_RVALID;
  wire [63:0] microblaze_0_axi_ipc_S_WDATA;
  wire [0:0] microblaze_0_axi_ipc_S_WLAST;
  wire [0:0] microblaze_0_axi_ipc_S_WREADY;
  wire [7:0] microblaze_0_axi_ipc_S_WSTRB;
  wire [0:0] microblaze_0_axi_ipc_S_WUSER;
  wire [0:0] microblaze_0_axi_ipc_S_WVALID;
  wire [0:0] microblaze_0_axi_mem_INTERCONNECT_ARESETN;
  wire [63:0] microblaze_0_axi_periph_M_ARADDR;
  wire [3:0] microblaze_0_axi_periph_M_ARBURST;
  wire [7:0] microblaze_0_axi_periph_M_ARCACHE;
  wire [1:0] microblaze_0_axi_periph_M_ARESETN;
  wire [1:0] microblaze_0_axi_periph_M_ARID;
  wire [15:0] microblaze_0_axi_periph_M_ARLEN;
  wire [3:0] microblaze_0_axi_periph_M_ARLOCK;
  wire [5:0] microblaze_0_axi_periph_M_ARPROT;
  wire [7:0] microblaze_0_axi_periph_M_ARQOS;
  wire [1:0] microblaze_0_axi_periph_M_ARREADY;
  wire [5:0] microblaze_0_axi_periph_M_ARSIZE;
  wire [1:0] microblaze_0_axi_periph_M_ARVALID;
  wire [63:0] microblaze_0_axi_periph_M_AWADDR;
  wire [3:0] microblaze_0_axi_periph_M_AWBURST;
  wire [7:0] microblaze_0_axi_periph_M_AWCACHE;
  wire [1:0] microblaze_0_axi_periph_M_AWID;
  wire [15:0] microblaze_0_axi_periph_M_AWLEN;
  wire [3:0] microblaze_0_axi_periph_M_AWLOCK;
  wire [5:0] microblaze_0_axi_periph_M_AWPROT;
  wire [7:0] microblaze_0_axi_periph_M_AWQOS;
  wire [1:0] microblaze_0_axi_periph_M_AWREADY;
  wire [5:0] microblaze_0_axi_periph_M_AWSIZE;
  wire [1:0] microblaze_0_axi_periph_M_AWVALID;
  wire [1:0] microblaze_0_axi_periph_M_BID;
  wire [1:0] microblaze_0_axi_periph_M_BREADY;
  wire [3:0] microblaze_0_axi_periph_M_BRESP;
  wire [1:0] microblaze_0_axi_periph_M_BVALID;
  wire [63:0] microblaze_0_axi_periph_M_RDATA;
  wire [1:0] microblaze_0_axi_periph_M_RID;
  wire [1:0] microblaze_0_axi_periph_M_RLAST;
  wire [1:0] microblaze_0_axi_periph_M_RREADY;
  wire [3:0] microblaze_0_axi_periph_M_RRESP;
  wire [1:0] microblaze_0_axi_periph_M_RVALID;
  wire [63:0] microblaze_0_axi_periph_M_WDATA;
  wire [1:0] microblaze_0_axi_periph_M_WID;
  wire [1:0] microblaze_0_axi_periph_M_WLAST;
  wire [1:0] microblaze_0_axi_periph_M_WREADY;
  wire [7:0] microblaze_0_axi_periph_M_WSTRB;
  wire [1:0] microblaze_0_axi_periph_M_WVALID;
  wire [31:0] microblaze_0_axi_periph_S_ARADDR;
  wire [1:0] microblaze_0_axi_periph_S_ARBURST;
  wire [3:0] microblaze_0_axi_periph_S_ARCACHE;
  wire [0:0] microblaze_0_axi_periph_S_ARID;
  wire [7:0] microblaze_0_axi_periph_S_ARLEN;
  wire [1:0] microblaze_0_axi_periph_S_ARLOCK;
  wire [2:0] microblaze_0_axi_periph_S_ARPROT;
  wire [3:0] microblaze_0_axi_periph_S_ARQOS;
  wire [0:0] microblaze_0_axi_periph_S_ARREADY;
  wire [2:0] microblaze_0_axi_periph_S_ARSIZE;
  wire [0:0] microblaze_0_axi_periph_S_ARVALID;
  wire [31:0] microblaze_0_axi_periph_S_AWADDR;
  wire [1:0] microblaze_0_axi_periph_S_AWBURST;
  wire [3:0] microblaze_0_axi_periph_S_AWCACHE;
  wire [0:0] microblaze_0_axi_periph_S_AWID;
  wire [7:0] microblaze_0_axi_periph_S_AWLEN;
  wire [1:0] microblaze_0_axi_periph_S_AWLOCK;
  wire [2:0] microblaze_0_axi_periph_S_AWPROT;
  wire [3:0] microblaze_0_axi_periph_S_AWQOS;
  wire [0:0] microblaze_0_axi_periph_S_AWREADY;
  wire [2:0] microblaze_0_axi_periph_S_AWSIZE;
  wire [0:0] microblaze_0_axi_periph_S_AWVALID;
  wire [0:0] microblaze_0_axi_periph_S_BID;
  wire [0:0] microblaze_0_axi_periph_S_BREADY;
  wire [1:0] microblaze_0_axi_periph_S_BRESP;
  wire [0:0] microblaze_0_axi_periph_S_BVALID;
  wire [31:0] microblaze_0_axi_periph_S_RDATA;
  wire [0:0] microblaze_0_axi_periph_S_RID;
  wire [0:0] microblaze_0_axi_periph_S_RLAST;
  wire [0:0] microblaze_0_axi_periph_S_RREADY;
  wire [1:0] microblaze_0_axi_periph_S_RRESP;
  wire [0:0] microblaze_0_axi_periph_S_RVALID;
  wire [31:0] microblaze_0_axi_periph_S_WDATA;
  wire [0:0] microblaze_0_axi_periph_S_WLAST;
  wire [0:0] microblaze_0_axi_periph_S_WREADY;
  wire [3:0] microblaze_0_axi_periph_S_WSTRB;
  wire [0:0] microblaze_0_axi_periph_S_WVALID;
  wire [0:0] microblaze_0_reset_Bus_Struct_Reset;
  wire net_fsl_i2s_0_i2s_bck_pin;
  wire net_fsl_i2s_0_i2s_dati_pin;
  wire net_fsl_i2s_0_i2s_lrck_pin;
  wire net_fsl_i2s_1_i2s_bck_pin;
  wire net_fsl_i2s_1_i2s_dati_pin;
  wire net_fsl_i2s_1_i2s_lrck_pin;
  wire net_gnd0;
  wire [0:0] net_gnd1;
  wire [1:0] net_gnd2;
  wire [2:0] net_gnd3;
  wire [0:3] net_gnd4;
  wire [4:0] net_gnd5;
  wire [5:0] net_gnd6;
  wire [7:0] net_gnd8;
  wire [11:0] net_gnd12;
  wire [0:15] net_gnd16;
  wire [0:31] net_gnd32;
  wire [63:0] net_gnd64;
  wire [0:4095] net_gnd4096;
  wire net_vcc0;
  wire [1:0] pgassign1;
  wire processing_system7_0_DDR_WEB;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_PS_CLK;
  wire processing_system7_0_PS_PORB;
  wire processing_system7_0_PS_SRSTB;

  // Internal assignments

  assign processing_system7_0_PS_SRSTB = processing_system7_0_PS_SRSTB_pin;
  assign processing_system7_0_PS_CLK = processing_system7_0_PS_CLK_pin;
  assign processing_system7_0_PS_PORB = processing_system7_0_PS_PORB_pin;
  assign processing_system7_0_DDR_WEB_pin = processing_system7_0_DDR_WEB;
  assign net_fsl_i2s_0_i2s_bck_pin = fsl_i2s_0_i2s_bck_pin;
  assign net_fsl_i2s_0_i2s_lrck_pin = fsl_i2s_0_i2s_lrck_pin;
  assign net_fsl_i2s_0_i2s_dati_pin = fsl_i2s_0_i2s_dati_pin;
  assign net_fsl_i2s_1_i2s_bck_pin = fsl_i2s_1_i2s_bck_pin;
  assign net_fsl_i2s_1_i2s_lrck_pin = fsl_i2s_1_i2s_lrck_pin;
  assign net_fsl_i2s_1_i2s_dati_pin = fsl_i2s_1_i2s_dati_pin;
  assign microblaze_0_axi_periph_M_RLAST[1:1] = 1'b0;
  assign microblaze_0_axi_periph_M_BID[1:1] = 1'b0;
  assign microblaze_0_axi_periph_M_RID[1:1] = 1'b0;
  assign pgassign1[1:1] = clock_generator_0_CLKOUT0[0:0];
  assign pgassign1[0:0] = clock_generator_0_CLKOUT0[0:0];
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd12[11:0] = 12'b000000000000;
  assign net_gnd16[0:15] = 16'b0000000000000000;
  assign net_gnd2[1:0] = 2'b00;
  assign net_gnd3[2:0] = 3'b000;
  assign net_gnd32[0:31] = 32'b00000000000000000000000000000000;
  assign net_gnd4[0:3] = 4'b0000;
  assign net_gnd4096[0:4095] = 4096'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd5[4:0] = 5'b00000;
  assign net_gnd6[5:0] = 6'b000000;
  assign net_gnd64[63:0] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd8[7:0] = 8'b00000000;
  assign net_vcc0 = 1'b1;

  (* CORE_GENERATION_INFO = "processing_system7_0,processing_system7,{C_UART1_GRP_FULL_ENABLE = 0,C_UART1_UART1_IO = MIO 48 .. 49,C_UART1_PERIPHERAL_ENABLE = 1,C_I2C0_I2C0_IO = EMIO,C_I2C0_PERIPHERAL_ENABLE = 1,C_SD0_GRP_CD_IO = MIO 47,C_SD0_GRP_POW_ENABLE = 0,C_SD0_GRP_CD_ENABLE = 1,C_SD0_SD0_IO = MIO 40 .. 45,C_SD0_GRP_WP_ENABLE = 1,C_SD0_PERIPHERAL_ENABLE = 1,C_TTC0_PERIPHERAL_ENABLE = 0,C_ENET0_PERIPHERAL_ENABLE = 1,C_ENET0_GRP_MDIO_IO = MIO 52 .. 53,C_ENET0_RESET_ENABLE = 0,C_ENET0_ENET0_IO = MIO 16 .. 27,C_ENET0_GRP_MDIO_ENABLE = 1,C_USB0_RESET_IO = MIO 46,C_USB0_PERIPHERAL_ENABLE = 1,C_USB1_PERIPHERAL_ENABLE = 0,C_USB0_USB0_IO = MIO 28 .. 39,C_USB0_RESET_ENABLE = 1,C_QSPI_PERIPHERAL_ENABLE = 1,C_QSPI_QSPI_IO = MIO 1 .. 6,C_PJTAG_PERIPHERAL_ENABLE = 0,C_MIO_MIO[6]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[6]_SLEW = fast,C_MIO_MIO[5]_PULLUP = disabled,C_MIO_MIO[5]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[4]_SLEW = fast,C_MIO_MIO[3]_PULLUP = disabled,C_MIO_MIO[3]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[2]_SLEW = fast,C_MIO_MIO[1]_PULLUP = disabled,C_MIO_MIO[1]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[0]_SLEW = slow,C_MIO_MIO[5]_SLEW = fast,C_MIO_MIO[4]_PULLUP = disabled,C_MIO_MIO[4]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[3]_SLEW = fast,C_MIO_MIO[2]_PULLUP = disabled,C_MIO_MIO[2]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[1]_SLEW = fast,C_MIO_MIO[0]_PULLUP = disabled,C_MIO_MIO[0]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[13]_PULLUP = disabled,C_MIO_MIO[13]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[12]_SLEW = slow,C_MIO_MIO[11]_PULLUP = disabled,C_MIO_MIO[11]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[10]_SLEW = slow,C_MIO_MIO[9]_PULLUP = disabled,C_MIO_MIO[9]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[8]_SLEW = fast,C_MIO_MIO[7]_PULLUP = disabled,C_MIO_MIO[7]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[13]_SLEW = slow,C_MIO_MIO[12]_PULLUP = disabled,C_MIO_MIO[12]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[11]_SLEW = slow,C_MIO_MIO[10]_PULLUP = disabled,C_MIO_MIO[10]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[9]_SLEW = slow,C_MIO_MIO[8]_PULLUP = disabled,C_MIO_MIO[8]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[7]_SLEW = slow,C_MIO_MIO[6]_PULLUP = disabled,C_MIO_MIO[21]_SLEW = fast,C_MIO_MIO[20]_PULLUP = disabled,C_MIO_MIO[20]_IOTYPE = HSTL 1.8V,C_MIO_MIO[19]_SLEW = fast,C_MIO_MIO[18]_PULLUP = disabled,C_MIO_MIO[18]_IOTYPE = HSTL 1.8V,C_MIO_MIO[17]_SLEW = fast,C_MIO_MIO[16]_PULLUP = disabled,C_MIO_MIO[16]_IOTYPE = HSTL 1.8V,C_MIO_MIO[15]_SLEW = slow,C_MIO_MIO[14]_PULLUP = disabled,C_MIO_MIO[14]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[21]_PULLUP = disabled,C_MIO_MIO[21]_IOTYPE = HSTL 1.8V,C_MIO_MIO[20]_SLEW = fast,C_MIO_MIO[19]_PULLUP = disabled,C_MIO_MIO[19]_IOTYPE = HSTL 1.8V,C_MIO_MIO[18]_SLEW = fast,C_MIO_MIO[17]_PULLUP = disabled,C_MIO_MIO[17]_IOTYPE = HSTL 1.8V,C_MIO_MIO[16]_SLEW = fast,C_MIO_MIO[15]_PULLUP = disabled,C_MIO_MIO[15]_IOTYPE = LVCMOS 3.3V,C_MIO_MIO[14]_SLEW = slow,C_MIO_MIO[28]_SLEW = fast,C_MIO_MIO[27]_PULLUP = disabled,C_MIO_MIO[27]_IOTYPE = HSTL 1.8V,C_MIO_MIO[26]_SLEW = fast,C_MIO_MIO[25]_PULLUP = disabled,C_MIO_MIO[25]_IOTYPE = HSTL 1.8V,C_MIO_MIO[24]_SLEW = fast,C_MIO_MIO[23]_PULLUP = disabled,C_MIO_MIO[23]_IOTYPE = HSTL 1.8V,C_MIO_MIO[22]_SLEW = fast,C_MIO_MIO[28]_PULLUP = disabled,C_MIO_MIO[28]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[27]_SLEW = fast,C_MIO_MIO[26]_PULLUP = disabled,C_MIO_MIO[26]_IOTYPE = HSTL 1.8V,C_MIO_MIO[25]_SLEW = fast,C_MIO_MIO[24]_PULLUP = disabled,C_MIO_MIO[24]_IOTYPE = HSTL 1.8V,C_MIO_MIO[23]_SLEW = fast,C_MIO_MIO[22]_PULLUP = disabled,C_MIO_MIO[22]_IOTYPE = HSTL 1.8V,C_MIO_MIO[36]_PULLUP = disabled,C_MIO_MIO[36]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[35]_SLEW = fast,C_MIO_MIO[34]_PULLUP = disabled,C_MIO_MIO[34]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[33]_SLEW = fast,C_MIO_MIO[32]_PULLUP = disabled,C_MIO_MIO[32]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[31]_SLEW = fast,C_MIO_MIO[30]_PULLUP = disabled,C_MIO_MIO[30]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[29]_SLEW = fast,C_MIO_MIO[36]_SLEW = fast,C_MIO_MIO[35]_PULLUP = disabled,C_MIO_MIO[35]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[34]_SLEW = fast,C_MIO_MIO[33]_PULLUP = disabled,C_MIO_MIO[33]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[32]_SLEW = fast,C_MIO_MIO[31]_PULLUP = disabled,C_MIO_MIO[31]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[30]_SLEW = fast,C_MIO_MIO[29]_PULLUP = disabled,C_MIO_MIO[29]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[43]_SLEW = fast,C_MIO_MIO[42]_PULLUP = disabled,C_MIO_MIO[42]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[41]_SLEW = fast,C_MIO_MIO[40]_PULLUP = disabled,C_MIO_MIO[40]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[39]_SLEW = fast,C_MIO_MIO[38]_PULLUP = disabled,C_MIO_MIO[38]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[37]_SLEW = fast,C_MIO_MIO[43]_PULLUP = disabled,C_MIO_MIO[43]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[42]_SLEW = fast,C_MIO_MIO[41]_PULLUP = disabled,C_MIO_MIO[41]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[40]_SLEW = fast,C_MIO_MIO[39]_PULLUP = disabled,C_MIO_MIO[39]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[38]_SLEW = fast,C_MIO_MIO[37]_PULLUP = disabled,C_MIO_MIO[37]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[51]_DIRECTION = in,C_MIO_MIO[50]_PULLUP = disabled,C_MIO_MIO[50]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[48]_PULLUP = disabled,C_MIO_MIO[48]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[46]_PULLUP = disabled,C_MIO_MIO[46]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[45]_SLEW = fast,C_MIO_MIO[44]_PULLUP = disabled,C_MIO_MIO[44]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[51]_PULLUP = disabled,C_MIO_MIO[51]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[50]_DIRECTION = in,C_MIO_MIO[49]_PULLUP = disabled,C_MIO_MIO[49]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[47]_PULLUP = disabled,C_MIO_MIO[47]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[45]_PULLUP = disabled,C_MIO_MIO[45]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[44]_SLEW = fast,C_MIO_MIO[52]_PULLUP = disabled,C_MIO_MIO[52]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[53]_PULLUP = disabled,C_MIO_MIO[53]_IOTYPE = LVCMOS 1.8V,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 = -0.082,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 = -0.034,C_UIPARAM_DDR_T_RAS_MIN = 35.0,C_UIPARAM_DDR_T_RP = 7,C_UIPARAM_DDR_CWL = 6,C_UIPARAM_DDR_FREQ_MHZ = 525.000000,C_UIPARAM_DDR_SPEED_BIN = DDR3_1066F,C_UIPARAM_DDR_DEVICE_CAPACITY = 2048 MBits,C_UIPARAM_DDR_DRAM_WIDTH = 16 Bits,C_UIPARAM_DDR_BL = 8,C_UIPARAM_DDR_MEMORY_TYPE = DDR 3,C_UIPARAM_DDR_PARTNO = MT41K128M16 JT-125,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 = -0.03,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 = -0.073,C_UIPARAM_DDR_T_FAW = 40.0,C_UIPARAM_DDR_T_RC = 48.75,C_UIPARAM_DDR_T_RCD = 7,C_UIPARAM_DDR_CL = 7,C_UIPARAM_DDR_ROW_ADDR_COUNT = 14,C_UIPARAM_DDR_CLOCK_3_LENGTH_MM = 20.6,C_UIPARAM_DDR_CLOCK_1_LENGTH_MM = 20.6,C_UIPARAM_DDR_DQ_3_LENGTH_MM = 30.45,C_UIPARAM_DDR_DQ_1_LENGTH_MM = 22.8,C_UIPARAM_DDR_DQS_3_LENGTH_MM = 29.9,C_UIPARAM_DDR_DQS_1_LENGTH_MM = 22.87,C_DDR_V4.00.A_C_S_AXI_HP3_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP2_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP1_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP0_HIGHADDR = 0x1FFFFFFF,C_UIPARAM_DDR_BOARD_DELAY3 = 0.187,C_UIPARAM_DDR_BOARD_DELAY1 = 0.159,C_UIPARAM_DDR_TRAIN_DATA_EYE = 1,C_UIPARAM_DDR_TRAIN_WRITE_LEVEL = 1,C_UIPARAM_DDR_CLOCK_2_LENGTH_MM = 20.6,C_UIPARAM_DDR_CLOCK_0_LENGTH_MM = 20.6,C_UIPARAM_DDR_DQ_2_LENGTH_MM = 24,C_UIPARAM_DDR_DQ_0_LENGTH_MM = 27,C_UIPARAM_DDR_DQS_2_LENGTH_MM = 22.9,C_UIPARAM_DDR_DQS_0_LENGTH_MM = 27.85,C_DDR_V4.00.A_C_S_AXI_HP3_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP2_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP1_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP0_BASEADDR = 0x00000000,C_UIPARAM_DDR_BOARD_DELAY2 = 0.162,C_UIPARAM_DDR_BOARD_DELAY0 = 0.176,C_UIPARAM_DDR_USE_INTERNAL_VREF = 0,C_UIPARAM_DDR_TRAIN_READ_GATE = 1,C_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY = 165,C_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY = 165,C_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY = 165,C_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY = 165,C_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY = 180,C_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY = 180,C_GPIO_GPIO_IO = MIO,C_GPIO_PERIPHERAL_ENABLE = 1,C_GPIO_V2.00.A_C_EN_EMIO_GPIO = 0,C:GPIO_EMIO_GPIO_WIDTH = 64,C_SDIO_PERIPHERAL_FREQMHZ = 50,C_FPGA2_PERIPHERAL_FREQMHZ = 12.288000,C_FPGA0_PERIPHERAL_FREQMHZ = 100.000000,C_CRYSTAL_PERIPHERAL_FREQMHZ = 50.000000,C_PRESET_GLOBAL_CONFIG = Default,C_CAN_PERIPHERAL_FREQMHZ = 100,C_UART_PERIPHERAL_FREQMHZ = 50,C_ENET0_PERIPHERAL_FREQMHZ = 1000 Mbps,C_QSPI_PERIPHERAL_FREQMHZ = 200.000000,C_FPGA3_PERIPHERAL_FREQMHZ = 100.000000,C_FPGA1_PERIPHERAL_FREQMHZ = 175.000000,C_APU_CLK_RATIO_ENABLE = 6:2:1,C_APU_PERIPHERAL_FREQMHZ = 650.000000,C_PRESET_GLOBAL_DEFAULT = powerup,C_PRESET_BANK1_VOLTAGE = LVCMOS 1.8V,C_PRESET_FPGA_PARTNUMBER = xc7z010clg400-1,C_ENET0_PERIPHERAL_CLKSRC = IO PLL,C_FCLK2_PERIPHERAL_CLKSRC = ARM PLL,C_FCLK1_PERIPHERAL_CLKSRC = DDR PLL,C_PRESET_BANK0_VOLTAGE = LVCMOS 3.3V,C_PRESET_FPGA_SPEED = -1}" *)

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_processing_system7_0_wrapper
    processing_system7_0 (
      .CAN0_PHY_TX (  ),
      .CAN0_PHY_RX ( net_gnd0 ),
      .CAN1_PHY_TX (  ),
      .CAN1_PHY_RX ( net_gnd0 ),
      .ENET0_GMII_TX_EN (  ),
      .ENET0_GMII_TX_ER (  ),
      .ENET0_MDIO_MDC (  ),
      .ENET0_MDIO_O (  ),
      .ENET0_MDIO_T (  ),
      .ENET0_PTP_DELAY_REQ_RX (  ),
      .ENET0_PTP_DELAY_REQ_TX (  ),
      .ENET0_PTP_PDELAY_REQ_RX (  ),
      .ENET0_PTP_PDELAY_REQ_TX (  ),
      .ENET0_PTP_PDELAY_RESP_RX (  ),
      .ENET0_PTP_PDELAY_RESP_TX (  ),
      .ENET0_PTP_SYNC_FRAME_RX (  ),
      .ENET0_PTP_SYNC_FRAME_TX (  ),
      .ENET0_SOF_RX (  ),
      .ENET0_SOF_TX (  ),
      .ENET0_GMII_TXD (  ),
      .ENET0_GMII_COL ( net_gnd0 ),
      .ENET0_GMII_CRS ( net_gnd0 ),
      .ENET0_EXT_INTIN ( net_gnd0 ),
      .ENET0_GMII_RX_CLK ( net_gnd0 ),
      .ENET0_GMII_RX_DV ( net_gnd0 ),
      .ENET0_GMII_RX_ER ( net_gnd0 ),
      .ENET0_GMII_TX_CLK ( net_gnd0 ),
      .ENET0_MDIO_I ( net_gnd0 ),
      .ENET0_GMII_RXD ( net_gnd8 ),
      .ENET1_GMII_TX_EN (  ),
      .ENET1_GMII_TX_ER (  ),
      .ENET1_MDIO_MDC (  ),
      .ENET1_MDIO_O (  ),
      .ENET1_MDIO_T (  ),
      .ENET1_PTP_DELAY_REQ_RX (  ),
      .ENET1_PTP_DELAY_REQ_TX (  ),
      .ENET1_PTP_PDELAY_REQ_RX (  ),
      .ENET1_PTP_PDELAY_REQ_TX (  ),
      .ENET1_PTP_PDELAY_RESP_RX (  ),
      .ENET1_PTP_PDELAY_RESP_TX (  ),
      .ENET1_PTP_SYNC_FRAME_RX (  ),
      .ENET1_PTP_SYNC_FRAME_TX (  ),
      .ENET1_SOF_RX (  ),
      .ENET1_SOF_TX (  ),
      .ENET1_GMII_TXD (  ),
      .ENET1_GMII_COL ( net_gnd0 ),
      .ENET1_GMII_CRS ( net_gnd0 ),
      .ENET1_EXT_INTIN ( net_gnd0 ),
      .ENET1_GMII_RX_CLK ( net_gnd0 ),
      .ENET1_GMII_RX_DV ( net_gnd0 ),
      .ENET1_GMII_RX_ER ( net_gnd0 ),
      .ENET1_GMII_TX_CLK ( net_gnd0 ),
      .ENET1_MDIO_I ( net_gnd0 ),
      .ENET1_GMII_RXD ( net_gnd8 ),
      .GPIO_I ( net_gnd64 ),
      .GPIO_O (  ),
      .GPIO_T (  ),
      .I2C0_SDA_I ( net_gnd0 ),
      .I2C0_SDA_O (  ),
      .I2C0_SDA_T (  ),
      .I2C0_SCL_I ( net_gnd0 ),
      .I2C0_SCL_O (  ),
      .I2C0_SCL_T (  ),
      .I2C1_SDA_I ( net_gnd0 ),
      .I2C1_SDA_O (  ),
      .I2C1_SDA_T (  ),
      .I2C1_SCL_I ( net_gnd0 ),
      .I2C1_SCL_O (  ),
      .I2C1_SCL_T (  ),
      .PJTAG_TCK ( net_gnd0 ),
      .PJTAG_TMS ( net_gnd0 ),
      .PJTAG_TD_I ( net_gnd0 ),
      .PJTAG_TD_T (  ),
      .PJTAG_TD_O (  ),
      .SDIO0_CLK (  ),
      .SDIO0_CLK_FB ( net_gnd0 ),
      .SDIO0_CMD_O (  ),
      .SDIO0_CMD_I ( net_gnd0 ),
      .SDIO0_CMD_T (  ),
      .SDIO0_DATA_I ( net_gnd4[0:3] ),
      .SDIO0_DATA_O (  ),
      .SDIO0_DATA_T (  ),
      .SDIO0_LED (  ),
      .SDIO0_CDN ( net_gnd0 ),
      .SDIO0_WP ( net_gnd0 ),
      .SDIO0_BUSPOW (  ),
      .SDIO0_BUSVOLT (  ),
      .SDIO1_CLK (  ),
      .SDIO1_CLK_FB ( net_gnd0 ),
      .SDIO1_CMD_O (  ),
      .SDIO1_CMD_I ( net_gnd0 ),
      .SDIO1_CMD_T (  ),
      .SDIO1_DATA_I ( net_gnd4[0:3] ),
      .SDIO1_DATA_O (  ),
      .SDIO1_DATA_T (  ),
      .SDIO1_LED (  ),
      .SDIO1_CDN ( net_gnd0 ),
      .SDIO1_WP ( net_gnd0 ),
      .SDIO1_BUSPOW (  ),
      .SDIO1_BUSVOLT (  ),
      .SPI0_SCLK_I ( net_gnd0 ),
      .SPI0_SCLK_O (  ),
      .SPI0_SCLK_T (  ),
      .SPI0_MOSI_I ( net_gnd0 ),
      .SPI0_MOSI_O (  ),
      .SPI0_MOSI_T (  ),
      .SPI0_MISO_I ( net_gnd0 ),
      .SPI0_MISO_O (  ),
      .SPI0_MISO_T (  ),
      .SPI0_SS_I ( net_gnd0 ),
      .SPI0_SS_O (  ),
      .SPI0_SS1_O (  ),
      .SPI0_SS2_O (  ),
      .SPI0_SS_T (  ),
      .SPI1_SCLK_I ( net_gnd0 ),
      .SPI1_SCLK_O (  ),
      .SPI1_SCLK_T (  ),
      .SPI1_MOSI_I ( net_gnd0 ),
      .SPI1_MOSI_O (  ),
      .SPI1_MOSI_T (  ),
      .SPI1_MISO_I ( net_gnd0 ),
      .SPI1_MISO_O (  ),
      .SPI1_MISO_T (  ),
      .SPI1_SS_I ( net_gnd0 ),
      .SPI1_SS_O (  ),
      .SPI1_SS1_O (  ),
      .SPI1_SS2_O (  ),
      .SPI1_SS_T (  ),
      .UART0_DTRN (  ),
      .UART0_RTSN (  ),
      .UART0_TX (  ),
      .UART0_CTSN ( net_gnd0 ),
      .UART0_DCDN ( net_gnd0 ),
      .UART0_DSRN ( net_gnd0 ),
      .UART0_RIN ( net_gnd0 ),
      .UART0_RX ( net_gnd0 ),
      .UART1_DTRN (  ),
      .UART1_RTSN (  ),
      .UART1_TX (  ),
      .UART1_CTSN ( net_gnd0 ),
      .UART1_DCDN ( net_gnd0 ),
      .UART1_DSRN ( net_gnd0 ),
      .UART1_RIN ( net_gnd0 ),
      .UART1_RX ( net_gnd0 ),
      .TTC0_WAVE0_OUT (  ),
      .TTC0_WAVE1_OUT (  ),
      .TTC0_WAVE2_OUT (  ),
      .TTC0_CLK0_IN ( net_gnd0 ),
      .TTC0_CLK1_IN ( net_gnd0 ),
      .TTC0_CLK2_IN ( net_gnd0 ),
      .TTC1_WAVE0_OUT (  ),
      .TTC1_WAVE1_OUT (  ),
      .TTC1_WAVE2_OUT (  ),
      .TTC1_CLK0_IN ( net_gnd0 ),
      .TTC1_CLK1_IN ( net_gnd0 ),
      .TTC1_CLK2_IN ( net_gnd0 ),
      .WDT_CLK_IN ( net_gnd0 ),
      .WDT_RST_OUT (  ),
      .TRACE_CLK ( net_gnd0 ),
      .TRACE_CTL (  ),
      .TRACE_DATA (  ),
      .USB0_PORT_INDCTL (  ),
      .USB1_PORT_INDCTL (  ),
      .USB0_VBUS_PWRSELECT (  ),
      .USB1_VBUS_PWRSELECT (  ),
      .USB0_VBUS_PWRFAULT ( net_gnd0 ),
      .USB1_VBUS_PWRFAULT ( net_gnd0 ),
      .SRAM_INTIN ( net_gnd0 ),
      .M_AXI_GP0_ARESETN (  ),
      .M_AXI_GP0_ARVALID (  ),
      .M_AXI_GP0_AWVALID (  ),
      .M_AXI_GP0_BREADY (  ),
      .M_AXI_GP0_RREADY (  ),
      .M_AXI_GP0_WLAST (  ),
      .M_AXI_GP0_WVALID (  ),
      .M_AXI_GP0_ARID (  ),
      .M_AXI_GP0_AWID (  ),
      .M_AXI_GP0_WID (  ),
      .M_AXI_GP0_ARBURST (  ),
      .M_AXI_GP0_ARLOCK (  ),
      .M_AXI_GP0_ARSIZE (  ),
      .M_AXI_GP0_AWBURST (  ),
      .M_AXI_GP0_AWLOCK (  ),
      .M_AXI_GP0_AWSIZE (  ),
      .M_AXI_GP0_ARPROT (  ),
      .M_AXI_GP0_AWPROT (  ),
      .M_AXI_GP0_ARADDR (  ),
      .M_AXI_GP0_AWADDR (  ),
      .M_AXI_GP0_WDATA (  ),
      .M_AXI_GP0_ARCACHE (  ),
      .M_AXI_GP0_ARLEN (  ),
      .M_AXI_GP0_ARQOS (  ),
      .M_AXI_GP0_AWCACHE (  ),
      .M_AXI_GP0_AWLEN (  ),
      .M_AXI_GP0_AWQOS (  ),
      .M_AXI_GP0_WSTRB (  ),
      .M_AXI_GP0_ACLK ( net_gnd0 ),
      .M_AXI_GP0_ARREADY ( net_gnd0 ),
      .M_AXI_GP0_AWREADY ( net_gnd0 ),
      .M_AXI_GP0_BVALID ( net_gnd0 ),
      .M_AXI_GP0_RLAST ( net_gnd0 ),
      .M_AXI_GP0_RVALID ( net_gnd0 ),
      .M_AXI_GP0_WREADY ( net_gnd0 ),
      .M_AXI_GP0_BID ( net_gnd12 ),
      .M_AXI_GP0_RID ( net_gnd12 ),
      .M_AXI_GP0_BRESP ( net_gnd2 ),
      .M_AXI_GP0_RRESP ( net_gnd2 ),
      .M_AXI_GP0_RDATA ( net_gnd32[0:31] ),
      .M_AXI_GP1_ARESETN (  ),
      .M_AXI_GP1_ARVALID (  ),
      .M_AXI_GP1_AWVALID (  ),
      .M_AXI_GP1_BREADY (  ),
      .M_AXI_GP1_RREADY (  ),
      .M_AXI_GP1_WLAST (  ),
      .M_AXI_GP1_WVALID (  ),
      .M_AXI_GP1_ARID (  ),
      .M_AXI_GP1_AWID (  ),
      .M_AXI_GP1_WID (  ),
      .M_AXI_GP1_ARBURST (  ),
      .M_AXI_GP1_ARLOCK (  ),
      .M_AXI_GP1_ARSIZE (  ),
      .M_AXI_GP1_AWBURST (  ),
      .M_AXI_GP1_AWLOCK (  ),
      .M_AXI_GP1_AWSIZE (  ),
      .M_AXI_GP1_ARPROT (  ),
      .M_AXI_GP1_AWPROT (  ),
      .M_AXI_GP1_ARADDR (  ),
      .M_AXI_GP1_AWADDR (  ),
      .M_AXI_GP1_WDATA (  ),
      .M_AXI_GP1_ARCACHE (  ),
      .M_AXI_GP1_ARLEN (  ),
      .M_AXI_GP1_ARQOS (  ),
      .M_AXI_GP1_AWCACHE (  ),
      .M_AXI_GP1_AWLEN (  ),
      .M_AXI_GP1_AWQOS (  ),
      .M_AXI_GP1_WSTRB (  ),
      .M_AXI_GP1_ACLK ( net_gnd0 ),
      .M_AXI_GP1_ARREADY ( net_gnd0 ),
      .M_AXI_GP1_AWREADY ( net_gnd0 ),
      .M_AXI_GP1_BVALID ( net_gnd0 ),
      .M_AXI_GP1_RLAST ( net_gnd0 ),
      .M_AXI_GP1_RVALID ( net_gnd0 ),
      .M_AXI_GP1_WREADY ( net_gnd0 ),
      .M_AXI_GP1_BID ( net_gnd12 ),
      .M_AXI_GP1_RID ( net_gnd12 ),
      .M_AXI_GP1_BRESP ( net_gnd2 ),
      .M_AXI_GP1_RRESP ( net_gnd2 ),
      .M_AXI_GP1_RDATA ( net_gnd32[0:31] ),
      .S_AXI_GP0_ARESETN (  ),
      .S_AXI_GP0_ARREADY ( microblaze_0_axi_periph_M_ARREADY[0] ),
      .S_AXI_GP0_AWREADY ( microblaze_0_axi_periph_M_AWREADY[0] ),
      .S_AXI_GP0_BVALID ( microblaze_0_axi_periph_M_BVALID[0] ),
      .S_AXI_GP0_RLAST ( microblaze_0_axi_periph_M_RLAST[0] ),
      .S_AXI_GP0_RVALID ( microblaze_0_axi_periph_M_RVALID[0] ),
      .S_AXI_GP0_WREADY ( microblaze_0_axi_periph_M_WREADY[0] ),
      .S_AXI_GP0_BRESP ( microblaze_0_axi_periph_M_BRESP[1:0] ),
      .S_AXI_GP0_RRESP ( microblaze_0_axi_periph_M_RRESP[1:0] ),
      .S_AXI_GP0_RDATA ( microblaze_0_axi_periph_M_RDATA[31:0] ),
      .S_AXI_GP0_BID ( microblaze_0_axi_periph_M_BID[0:0] ),
      .S_AXI_GP0_RID ( microblaze_0_axi_periph_M_RID[0:0] ),
      .S_AXI_GP0_ACLK ( clock_generator_0_CLKOUT0[0] ),
      .S_AXI_GP0_ARVALID ( microblaze_0_axi_periph_M_ARVALID[0] ),
      .S_AXI_GP0_AWVALID ( microblaze_0_axi_periph_M_AWVALID[0] ),
      .S_AXI_GP0_BREADY ( microblaze_0_axi_periph_M_BREADY[0] ),
      .S_AXI_GP0_RREADY ( microblaze_0_axi_periph_M_RREADY[0] ),
      .S_AXI_GP0_WLAST ( microblaze_0_axi_periph_M_WLAST[0] ),
      .S_AXI_GP0_WVALID ( microblaze_0_axi_periph_M_WVALID[0] ),
      .S_AXI_GP0_ARBURST ( microblaze_0_axi_periph_M_ARBURST[1:0] ),
      .S_AXI_GP0_ARLOCK ( microblaze_0_axi_periph_M_ARLOCK[1:0] ),
      .S_AXI_GP0_ARSIZE ( microblaze_0_axi_periph_M_ARSIZE[2:0] ),
      .S_AXI_GP0_AWBURST ( microblaze_0_axi_periph_M_AWBURST[1:0] ),
      .S_AXI_GP0_AWLOCK ( microblaze_0_axi_periph_M_AWLOCK[1:0] ),
      .S_AXI_GP0_AWSIZE ( microblaze_0_axi_periph_M_AWSIZE[2:0] ),
      .S_AXI_GP0_ARPROT ( microblaze_0_axi_periph_M_ARPROT[2:0] ),
      .S_AXI_GP0_AWPROT ( microblaze_0_axi_periph_M_AWPROT[2:0] ),
      .S_AXI_GP0_ARADDR ( microblaze_0_axi_periph_M_ARADDR[31:0] ),
      .S_AXI_GP0_AWADDR ( microblaze_0_axi_periph_M_AWADDR[31:0] ),
      .S_AXI_GP0_WDATA ( microblaze_0_axi_periph_M_WDATA[31:0] ),
      .S_AXI_GP0_ARCACHE ( microblaze_0_axi_periph_M_ARCACHE[3:0] ),
      .S_AXI_GP0_ARLEN ( microblaze_0_axi_periph_M_ARLEN[3:0] ),
      .S_AXI_GP0_ARQOS ( microblaze_0_axi_periph_M_ARQOS[3:0] ),
      .S_AXI_GP0_AWCACHE ( microblaze_0_axi_periph_M_AWCACHE[3:0] ),
      .S_AXI_GP0_AWLEN ( microblaze_0_axi_periph_M_AWLEN[3:0] ),
      .S_AXI_GP0_AWQOS ( microblaze_0_axi_periph_M_AWQOS[3:0] ),
      .S_AXI_GP0_WSTRB ( microblaze_0_axi_periph_M_WSTRB[3:0] ),
      .S_AXI_GP0_ARID ( microblaze_0_axi_periph_M_ARID[0:0] ),
      .S_AXI_GP0_AWID ( microblaze_0_axi_periph_M_AWID[0:0] ),
      .S_AXI_GP0_WID ( microblaze_0_axi_periph_M_WID[0:0] ),
      .S_AXI_GP1_ARESETN (  ),
      .S_AXI_GP1_ARREADY (  ),
      .S_AXI_GP1_AWREADY (  ),
      .S_AXI_GP1_BVALID (  ),
      .S_AXI_GP1_RLAST (  ),
      .S_AXI_GP1_RVALID (  ),
      .S_AXI_GP1_WREADY (  ),
      .S_AXI_GP1_BRESP (  ),
      .S_AXI_GP1_RRESP (  ),
      .S_AXI_GP1_RDATA (  ),
      .S_AXI_GP1_BID (  ),
      .S_AXI_GP1_RID (  ),
      .S_AXI_GP1_ACLK ( net_gnd0 ),
      .S_AXI_GP1_ARVALID ( net_gnd0 ),
      .S_AXI_GP1_AWVALID ( net_gnd0 ),
      .S_AXI_GP1_BREADY ( net_gnd0 ),
      .S_AXI_GP1_RREADY ( net_gnd0 ),
      .S_AXI_GP1_WLAST ( net_gnd0 ),
      .S_AXI_GP1_WVALID ( net_gnd0 ),
      .S_AXI_GP1_ARBURST ( net_gnd2 ),
      .S_AXI_GP1_ARLOCK ( net_gnd2 ),
      .S_AXI_GP1_ARSIZE ( net_gnd3 ),
      .S_AXI_GP1_AWBURST ( net_gnd2 ),
      .S_AXI_GP1_AWLOCK ( net_gnd2 ),
      .S_AXI_GP1_AWSIZE ( net_gnd3 ),
      .S_AXI_GP1_ARPROT ( net_gnd3 ),
      .S_AXI_GP1_AWPROT ( net_gnd3 ),
      .S_AXI_GP1_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_GP1_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_GP1_WDATA ( net_gnd32[0:31] ),
      .S_AXI_GP1_ARCACHE ( net_gnd4[0:3] ),
      .S_AXI_GP1_ARLEN ( net_gnd4[0:3] ),
      .S_AXI_GP1_ARQOS ( net_gnd4[0:3] ),
      .S_AXI_GP1_AWCACHE ( net_gnd4[0:3] ),
      .S_AXI_GP1_AWLEN ( net_gnd4[0:3] ),
      .S_AXI_GP1_AWQOS ( net_gnd4[0:3] ),
      .S_AXI_GP1_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_GP1_ARID ( net_gnd6 ),
      .S_AXI_GP1_AWID ( net_gnd6 ),
      .S_AXI_GP1_WID ( net_gnd6 ),
      .S_AXI_ACP_ARESETN (  ),
      .S_AXI_ACP_AWREADY (  ),
      .S_AXI_ACP_ARREADY (  ),
      .S_AXI_ACP_BVALID (  ),
      .S_AXI_ACP_RLAST (  ),
      .S_AXI_ACP_RVALID (  ),
      .S_AXI_ACP_WREADY (  ),
      .S_AXI_ACP_BRESP (  ),
      .S_AXI_ACP_RRESP (  ),
      .S_AXI_ACP_BID (  ),
      .S_AXI_ACP_RID (  ),
      .S_AXI_ACP_RDATA (  ),
      .S_AXI_ACP_ACLK ( net_gnd0 ),
      .S_AXI_ACP_ARVALID ( net_gnd0 ),
      .S_AXI_ACP_AWVALID ( net_gnd0 ),
      .S_AXI_ACP_BREADY ( net_gnd0 ),
      .S_AXI_ACP_RREADY ( net_gnd0 ),
      .S_AXI_ACP_WLAST ( net_gnd0 ),
      .S_AXI_ACP_WVALID ( net_gnd0 ),
      .S_AXI_ACP_ARID ( net_gnd3 ),
      .S_AXI_ACP_ARPROT ( net_gnd3 ),
      .S_AXI_ACP_AWID ( net_gnd3 ),
      .S_AXI_ACP_AWPROT ( net_gnd3 ),
      .S_AXI_ACP_WID ( net_gnd3 ),
      .S_AXI_ACP_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_ACP_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_ACP_ARCACHE ( net_gnd4[0:3] ),
      .S_AXI_ACP_ARLEN ( net_gnd4[0:3] ),
      .S_AXI_ACP_ARQOS ( net_gnd4[0:3] ),
      .S_AXI_ACP_AWCACHE ( net_gnd4[0:3] ),
      .S_AXI_ACP_AWLEN ( net_gnd4[0:3] ),
      .S_AXI_ACP_AWQOS ( net_gnd4[0:3] ),
      .S_AXI_ACP_ARBURST ( net_gnd2 ),
      .S_AXI_ACP_ARLOCK ( net_gnd2 ),
      .S_AXI_ACP_ARSIZE ( net_gnd3 ),
      .S_AXI_ACP_AWBURST ( net_gnd2 ),
      .S_AXI_ACP_AWLOCK ( net_gnd2 ),
      .S_AXI_ACP_AWSIZE ( net_gnd3 ),
      .S_AXI_ACP_ARUSER ( net_gnd5 ),
      .S_AXI_ACP_AWUSER ( net_gnd5 ),
      .S_AXI_ACP_WDATA ( net_gnd64 ),
      .S_AXI_ACP_WSTRB ( net_gnd8 ),
      .S_AXI_HP0_ARESETN (  ),
      .S_AXI_HP0_ARREADY (  ),
      .S_AXI_HP0_AWREADY (  ),
      .S_AXI_HP0_BVALID (  ),
      .S_AXI_HP0_RLAST (  ),
      .S_AXI_HP0_RVALID (  ),
      .S_AXI_HP0_WREADY (  ),
      .S_AXI_HP0_BRESP (  ),
      .S_AXI_HP0_RRESP (  ),
      .S_AXI_HP0_BID (  ),
      .S_AXI_HP0_RID (  ),
      .S_AXI_HP0_RDATA (  ),
      .S_AXI_HP0_RCOUNT (  ),
      .S_AXI_HP0_WCOUNT (  ),
      .S_AXI_HP0_RACOUNT (  ),
      .S_AXI_HP0_WACOUNT (  ),
      .S_AXI_HP0_ACLK ( net_gnd0 ),
      .S_AXI_HP0_ARVALID ( net_gnd0 ),
      .S_AXI_HP0_AWVALID ( net_gnd0 ),
      .S_AXI_HP0_BREADY ( net_gnd0 ),
      .S_AXI_HP0_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP0_RREADY ( net_gnd0 ),
      .S_AXI_HP0_WLAST ( net_gnd0 ),
      .S_AXI_HP0_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP0_WVALID ( net_gnd0 ),
      .S_AXI_HP0_ARBURST ( net_gnd2 ),
      .S_AXI_HP0_ARLOCK ( net_gnd2 ),
      .S_AXI_HP0_ARSIZE ( net_gnd3 ),
      .S_AXI_HP0_AWBURST ( net_gnd2 ),
      .S_AXI_HP0_AWLOCK ( net_gnd2 ),
      .S_AXI_HP0_AWSIZE ( net_gnd3 ),
      .S_AXI_HP0_ARPROT ( net_gnd3 ),
      .S_AXI_HP0_AWPROT ( net_gnd3 ),
      .S_AXI_HP0_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_HP0_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_HP0_ARCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP0_ARLEN ( net_gnd4[0:3] ),
      .S_AXI_HP0_ARQOS ( net_gnd4[0:3] ),
      .S_AXI_HP0_AWCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP0_AWLEN ( net_gnd4[0:3] ),
      .S_AXI_HP0_AWQOS ( net_gnd4[0:3] ),
      .S_AXI_HP0_ARID ( net_gnd6 ),
      .S_AXI_HP0_AWID ( net_gnd6 ),
      .S_AXI_HP0_WID ( net_gnd6 ),
      .S_AXI_HP0_WDATA ( net_gnd64 ),
      .S_AXI_HP0_WSTRB ( net_gnd8 ),
      .S_AXI_HP1_ARESETN (  ),
      .S_AXI_HP1_ARREADY ( microblaze_0_axi_ipc_M_ARREADY[0] ),
      .S_AXI_HP1_AWREADY ( microblaze_0_axi_ipc_M_AWREADY[0] ),
      .S_AXI_HP1_BVALID ( microblaze_0_axi_ipc_M_BVALID[0] ),
      .S_AXI_HP1_RLAST ( microblaze_0_axi_ipc_M_RLAST[0] ),
      .S_AXI_HP1_RVALID ( microblaze_0_axi_ipc_M_RVALID[0] ),
      .S_AXI_HP1_WREADY ( microblaze_0_axi_ipc_M_WREADY[0] ),
      .S_AXI_HP1_BRESP ( microblaze_0_axi_ipc_M_BRESP ),
      .S_AXI_HP1_RRESP ( microblaze_0_axi_ipc_M_RRESP ),
      .S_AXI_HP1_BID ( microblaze_0_axi_ipc_M_BID[0:0] ),
      .S_AXI_HP1_RID ( microblaze_0_axi_ipc_M_RID[0:0] ),
      .S_AXI_HP1_RDATA ( microblaze_0_axi_ipc_M_RDATA ),
      .S_AXI_HP1_RCOUNT (  ),
      .S_AXI_HP1_WCOUNT (  ),
      .S_AXI_HP1_RACOUNT (  ),
      .S_AXI_HP1_WACOUNT (  ),
      .S_AXI_HP1_ACLK ( clock_generator_0_CLKOUT0[0] ),
      .S_AXI_HP1_ARVALID ( microblaze_0_axi_ipc_M_ARVALID[0] ),
      .S_AXI_HP1_AWVALID ( microblaze_0_axi_ipc_M_AWVALID[0] ),
      .S_AXI_HP1_BREADY ( microblaze_0_axi_ipc_M_BREADY[0] ),
      .S_AXI_HP1_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP1_RREADY ( microblaze_0_axi_ipc_M_RREADY[0] ),
      .S_AXI_HP1_WLAST ( microblaze_0_axi_ipc_M_WLAST[0] ),
      .S_AXI_HP1_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP1_WVALID ( microblaze_0_axi_ipc_M_WVALID[0] ),
      .S_AXI_HP1_ARBURST ( microblaze_0_axi_ipc_M_ARBURST ),
      .S_AXI_HP1_ARLOCK ( microblaze_0_axi_ipc_M_ARLOCK ),
      .S_AXI_HP1_ARSIZE ( microblaze_0_axi_ipc_M_ARSIZE ),
      .S_AXI_HP1_AWBURST ( microblaze_0_axi_ipc_M_AWBURST ),
      .S_AXI_HP1_AWLOCK ( microblaze_0_axi_ipc_M_AWLOCK ),
      .S_AXI_HP1_AWSIZE ( microblaze_0_axi_ipc_M_AWSIZE ),
      .S_AXI_HP1_ARPROT ( microblaze_0_axi_ipc_M_ARPROT ),
      .S_AXI_HP1_AWPROT ( microblaze_0_axi_ipc_M_AWPROT ),
      .S_AXI_HP1_ARADDR ( microblaze_0_axi_ipc_M_ARADDR ),
      .S_AXI_HP1_AWADDR ( microblaze_0_axi_ipc_M_AWADDR ),
      .S_AXI_HP1_ARCACHE ( microblaze_0_axi_ipc_M_ARCACHE ),
      .S_AXI_HP1_ARLEN ( microblaze_0_axi_ipc_M_ARLEN[3:0] ),
      .S_AXI_HP1_ARQOS ( microblaze_0_axi_ipc_M_ARQOS ),
      .S_AXI_HP1_AWCACHE ( microblaze_0_axi_ipc_M_AWCACHE ),
      .S_AXI_HP1_AWLEN ( microblaze_0_axi_ipc_M_AWLEN[3:0] ),
      .S_AXI_HP1_AWQOS ( microblaze_0_axi_ipc_M_AWQOS ),
      .S_AXI_HP1_ARID ( microblaze_0_axi_ipc_M_ARID[0:0] ),
      .S_AXI_HP1_AWID ( microblaze_0_axi_ipc_M_AWID[0:0] ),
      .S_AXI_HP1_WID ( microblaze_0_axi_ipc_M_WID[0:0] ),
      .S_AXI_HP1_WDATA ( microblaze_0_axi_ipc_M_WDATA ),
      .S_AXI_HP1_WSTRB ( microblaze_0_axi_ipc_M_WSTRB ),
      .S_AXI_HP2_ARESETN (  ),
      .S_AXI_HP2_ARREADY (  ),
      .S_AXI_HP2_AWREADY (  ),
      .S_AXI_HP2_BVALID (  ),
      .S_AXI_HP2_RLAST (  ),
      .S_AXI_HP2_RVALID (  ),
      .S_AXI_HP2_WREADY (  ),
      .S_AXI_HP2_BRESP (  ),
      .S_AXI_HP2_RRESP (  ),
      .S_AXI_HP2_BID (  ),
      .S_AXI_HP2_RID (  ),
      .S_AXI_HP2_RDATA (  ),
      .S_AXI_HP2_RCOUNT (  ),
      .S_AXI_HP2_WCOUNT (  ),
      .S_AXI_HP2_RACOUNT (  ),
      .S_AXI_HP2_WACOUNT (  ),
      .S_AXI_HP2_ACLK ( net_gnd0 ),
      .S_AXI_HP2_ARVALID ( net_gnd0 ),
      .S_AXI_HP2_AWVALID ( net_gnd0 ),
      .S_AXI_HP2_BREADY ( net_gnd0 ),
      .S_AXI_HP2_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP2_RREADY ( net_gnd0 ),
      .S_AXI_HP2_WLAST ( net_gnd0 ),
      .S_AXI_HP2_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP2_WVALID ( net_gnd0 ),
      .S_AXI_HP2_ARBURST ( net_gnd2 ),
      .S_AXI_HP2_ARLOCK ( net_gnd2 ),
      .S_AXI_HP2_ARSIZE ( net_gnd3 ),
      .S_AXI_HP2_AWBURST ( net_gnd2 ),
      .S_AXI_HP2_AWLOCK ( net_gnd2 ),
      .S_AXI_HP2_AWSIZE ( net_gnd3 ),
      .S_AXI_HP2_ARPROT ( net_gnd3 ),
      .S_AXI_HP2_AWPROT ( net_gnd3 ),
      .S_AXI_HP2_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_HP2_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_HP2_ARCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP2_ARLEN ( net_gnd4[0:3] ),
      .S_AXI_HP2_ARQOS ( net_gnd4[0:3] ),
      .S_AXI_HP2_AWCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP2_AWLEN ( net_gnd4[0:3] ),
      .S_AXI_HP2_AWQOS ( net_gnd4[0:3] ),
      .S_AXI_HP2_ARID ( net_gnd6 ),
      .S_AXI_HP2_AWID ( net_gnd6 ),
      .S_AXI_HP2_WID ( net_gnd6 ),
      .S_AXI_HP2_WDATA ( net_gnd64 ),
      .S_AXI_HP2_WSTRB ( net_gnd8 ),
      .S_AXI_HP3_ARESETN (  ),
      .S_AXI_HP3_ARREADY (  ),
      .S_AXI_HP3_AWREADY (  ),
      .S_AXI_HP3_BVALID (  ),
      .S_AXI_HP3_RLAST (  ),
      .S_AXI_HP3_RVALID (  ),
      .S_AXI_HP3_WREADY (  ),
      .S_AXI_HP3_BRESP (  ),
      .S_AXI_HP3_RRESP (  ),
      .S_AXI_HP3_BID (  ),
      .S_AXI_HP3_RID (  ),
      .S_AXI_HP3_RDATA (  ),
      .S_AXI_HP3_RCOUNT (  ),
      .S_AXI_HP3_WCOUNT (  ),
      .S_AXI_HP3_RACOUNT (  ),
      .S_AXI_HP3_WACOUNT (  ),
      .S_AXI_HP3_ACLK ( net_gnd0 ),
      .S_AXI_HP3_ARVALID ( net_gnd0 ),
      .S_AXI_HP3_AWVALID ( net_gnd0 ),
      .S_AXI_HP3_BREADY ( net_gnd0 ),
      .S_AXI_HP3_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP3_RREADY ( net_gnd0 ),
      .S_AXI_HP3_WLAST ( net_gnd0 ),
      .S_AXI_HP3_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP3_WVALID ( net_gnd0 ),
      .S_AXI_HP3_ARBURST ( net_gnd2 ),
      .S_AXI_HP3_ARLOCK ( net_gnd2 ),
      .S_AXI_HP3_ARSIZE ( net_gnd3 ),
      .S_AXI_HP3_AWBURST ( net_gnd2 ),
      .S_AXI_HP3_AWLOCK ( net_gnd2 ),
      .S_AXI_HP3_AWSIZE ( net_gnd3 ),
      .S_AXI_HP3_ARPROT ( net_gnd3 ),
      .S_AXI_HP3_AWPROT ( net_gnd3 ),
      .S_AXI_HP3_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_HP3_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_HP3_ARCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP3_ARLEN ( net_gnd4[0:3] ),
      .S_AXI_HP3_ARQOS ( net_gnd4[0:3] ),
      .S_AXI_HP3_AWCACHE ( net_gnd4[0:3] ),
      .S_AXI_HP3_AWLEN ( net_gnd4[0:3] ),
      .S_AXI_HP3_AWQOS ( net_gnd4[0:3] ),
      .S_AXI_HP3_ARID ( net_gnd6 ),
      .S_AXI_HP3_AWID ( net_gnd6 ),
      .S_AXI_HP3_WID ( net_gnd6 ),
      .S_AXI_HP3_WDATA ( net_gnd64 ),
      .S_AXI_HP3_WSTRB ( net_gnd8 ),
      .DMA0_DATYPE (  ),
      .DMA0_DAVALID (  ),
      .DMA0_DRREADY (  ),
      .DMA0_RSTN (  ),
      .DMA0_ACLK ( net_gnd0 ),
      .DMA0_DAREADY ( net_gnd0 ),
      .DMA0_DRLAST ( net_gnd0 ),
      .DMA0_DRVALID ( net_gnd0 ),
      .DMA0_DRTYPE ( net_gnd2 ),
      .DMA1_DATYPE (  ),
      .DMA1_DAVALID (  ),
      .DMA1_DRREADY (  ),
      .DMA1_RSTN (  ),
      .DMA1_ACLK ( net_gnd0 ),
      .DMA1_DAREADY ( net_gnd0 ),
      .DMA1_DRLAST ( net_gnd0 ),
      .DMA1_DRVALID ( net_gnd0 ),
      .DMA1_DRTYPE ( net_gnd2 ),
      .DMA2_DATYPE (  ),
      .DMA2_DAVALID (  ),
      .DMA2_DRREADY (  ),
      .DMA2_RSTN (  ),
      .DMA2_ACLK ( net_gnd0 ),
      .DMA2_DAREADY ( net_gnd0 ),
      .DMA2_DRLAST ( net_gnd0 ),
      .DMA2_DRVALID ( net_gnd0 ),
      .DMA3_DRVALID ( net_gnd0 ),
      .DMA3_DATYPE (  ),
      .DMA3_DAVALID (  ),
      .DMA3_DRREADY (  ),
      .DMA3_RSTN (  ),
      .DMA3_ACLK ( net_gnd0 ),
      .DMA3_DAREADY ( net_gnd0 ),
      .DMA3_DRLAST ( net_gnd0 ),
      .DMA2_DRTYPE ( net_gnd2 ),
      .DMA3_DRTYPE ( net_gnd2 ),
      .FTMD_TRACEIN_DATA ( net_gnd32[0:31] ),
      .FTMD_TRACEIN_VALID ( net_gnd0 ),
      .FTMD_TRACEIN_CLK ( net_gnd0 ),
      .FTMD_TRACEIN_ATID ( net_gnd4[0:3] ),
      .FTMT_F2P_TRIG ( net_gnd4[0:3] ),
      .FTMT_F2P_TRIGACK (  ),
      .FTMT_F2P_DEBUG ( net_gnd32[0:31] ),
      .FTMT_P2F_TRIGACK ( net_gnd4[0:3] ),
      .FTMT_P2F_TRIG (  ),
      .FTMT_P2F_DEBUG (  ),
      .FCLK_CLK3 (  ),
      .FCLK_CLK2 (  ),
      .FCLK_CLK1 (  ),
      .FCLK_CLK0 ( processing_system7_0_FCLK_CLK0 ),
      .FCLK_CLKTRIG3_N ( net_gnd0 ),
      .FCLK_CLKTRIG2_N ( net_gnd0 ),
      .FCLK_CLKTRIG1_N ( net_gnd0 ),
      .FCLK_CLKTRIG0_N ( net_gnd0 ),
      .FCLK_RESET3_N (  ),
      .FCLK_RESET2_N (  ),
      .FCLK_RESET1_N (  ),
      .FCLK_RESET0_N (  ),
      .FPGA_IDLE_N ( net_gnd0 ),
      .DDR_ARB ( net_gnd4[0:3] ),
      .IRQ_F2P ( net_gnd1[0:0] ),
      .Core0_nFIQ ( net_gnd0 ),
      .Core0_nIRQ ( net_gnd0 ),
      .Core1_nFIQ ( net_gnd0 ),
      .Core1_nIRQ ( net_gnd0 ),
      .EVENT_EVENTO (  ),
      .EVENT_STANDBYWFE (  ),
      .EVENT_STANDBYWFI (  ),
      .EVENT_EVENTI ( net_gnd0 ),
      .MIO ( processing_system7_0_MIO ),
      .DDR_Clk ( processing_system7_0_DDR_Clk ),
      .DDR_Clk_n ( processing_system7_0_DDR_Clk_n ),
      .DDR_CKE ( processing_system7_0_DDR_CKE ),
      .DDR_CS_n ( processing_system7_0_DDR_CS_n ),
      .DDR_RAS_n ( processing_system7_0_DDR_RAS_n ),
      .DDR_CAS_n ( processing_system7_0_DDR_CAS_n ),
      .DDR_WEB ( processing_system7_0_DDR_WEB ),
      .DDR_BankAddr ( processing_system7_0_DDR_BankAddr ),
      .DDR_Addr ( processing_system7_0_DDR_Addr ),
      .DDR_ODT ( processing_system7_0_DDR_ODT ),
      .DDR_DRSTB ( processing_system7_0_DDR_DRSTB ),
      .DDR_DQ ( processing_system7_0_DDR_DQ ),
      .DDR_DM ( processing_system7_0_DDR_DM ),
      .DDR_DQS ( processing_system7_0_DDR_DQS ),
      .DDR_DQS_n ( processing_system7_0_DDR_DQS_n ),
      .DDR_VRN ( processing_system7_0_DDR_VRN ),
      .DDR_VRP ( processing_system7_0_DDR_VRP ),
      .PS_SRSTB ( processing_system7_0_PS_SRSTB ),
      .PS_CLK ( processing_system7_0_PS_CLK ),
      .PS_PORB ( processing_system7_0_PS_PORB ),
      .IRQ_P2F_DMAC_ABORT (  ),
      .IRQ_P2F_DMAC0 (  ),
      .IRQ_P2F_DMAC1 (  ),
      .IRQ_P2F_DMAC2 (  ),
      .IRQ_P2F_DMAC3 (  ),
      .IRQ_P2F_DMAC4 (  ),
      .IRQ_P2F_DMAC5 (  ),
      .IRQ_P2F_DMAC6 (  ),
      .IRQ_P2F_DMAC7 (  ),
      .IRQ_P2F_SMC (  ),
      .IRQ_P2F_QSPI (  ),
      .IRQ_P2F_CTI (  ),
      .IRQ_P2F_GPIO (  ),
      .IRQ_P2F_USB0 (  ),
      .IRQ_P2F_ENET0 (  ),
      .IRQ_P2F_ENET_WAKE0 (  ),
      .IRQ_P2F_SDIO0 (  ),
      .IRQ_P2F_I2C0 (  ),
      .IRQ_P2F_SPI0 (  ),
      .IRQ_P2F_UART0 (  ),
      .IRQ_P2F_CAN0 (  ),
      .IRQ_P2F_USB1 (  ),
      .IRQ_P2F_ENET1 (  ),
      .IRQ_P2F_ENET_WAKE1 (  ),
      .IRQ_P2F_SDIO1 (  ),
      .IRQ_P2F_I2C1 (  ),
      .IRQ_P2F_SPI1 (  ),
      .IRQ_P2F_UART1 (  ),
      .IRQ_P2F_CAN1 (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_microblaze_0_reset_wrapper
    microblaze_0_reset (
      .Slowest_sync_clk ( clock_generator_0_CLKOUT0[0] ),
      .Ext_Reset_In ( RESET ),
      .Aux_Reset_In ( net_gnd0 ),
      .MB_Debug_Sys_Rst ( debug_module_0_Debug_SYS_Rst ),
      .Core_Reset_Req_0 ( net_gnd0 ),
      .Chip_Reset_Req_0 ( net_gnd0 ),
      .System_Reset_Req_0 ( net_gnd0 ),
      .Core_Reset_Req_1 ( net_gnd0 ),
      .Chip_Reset_Req_1 ( net_gnd0 ),
      .System_Reset_Req_1 ( net_gnd0 ),
      .Dcm_locked ( clock_generator_0_LOCKED ),
      .RstcPPCresetcore_0 (  ),
      .RstcPPCresetchip_0 (  ),
      .RstcPPCresetsys_0 (  ),
      .RstcPPCresetcore_1 (  ),
      .RstcPPCresetchip_1 (  ),
      .RstcPPCresetsys_1 (  ),
      .MB_Reset ( microblaze_0_MB_Reset ),
      .Bus_Struct_Reset ( microblaze_0_reset_Bus_Struct_Reset[0:0] ),
      .Peripheral_Reset (  ),
      .Interconnect_aresetn ( microblaze_0_axi_mem_INTERCONNECT_ARESETN[0:0] ),
      .Peripheral_aresetn (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_microblaze_0_axi_periph_wrapper
    microblaze_0_axi_periph (
      .INTERCONNECT_ACLK ( clock_generator_0_CLKOUT0[0] ),
      .INTERCONNECT_ARESETN ( microblaze_0_axi_mem_INTERCONNECT_ARESETN[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N ( microblaze_0_axi_periph_M_ARESETN ),
      .IRQ (  ),
      .S_AXI_ACLK ( clock_generator_0_CLKOUT0[0:0] ),
      .S_AXI_AWID ( microblaze_0_axi_periph_S_AWID[0:0] ),
      .S_AXI_AWADDR ( microblaze_0_axi_periph_S_AWADDR ),
      .S_AXI_AWLEN ( microblaze_0_axi_periph_S_AWLEN ),
      .S_AXI_AWSIZE ( microblaze_0_axi_periph_S_AWSIZE ),
      .S_AXI_AWBURST ( microblaze_0_axi_periph_S_AWBURST ),
      .S_AXI_AWLOCK ( microblaze_0_axi_periph_S_AWLOCK ),
      .S_AXI_AWCACHE ( microblaze_0_axi_periph_S_AWCACHE ),
      .S_AXI_AWPROT ( microblaze_0_axi_periph_S_AWPROT ),
      .S_AXI_AWQOS ( microblaze_0_axi_periph_S_AWQOS ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( microblaze_0_axi_periph_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( microblaze_0_axi_periph_S_AWREADY[0:0] ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( microblaze_0_axi_periph_S_WDATA ),
      .S_AXI_WSTRB ( microblaze_0_axi_periph_S_WSTRB ),
      .S_AXI_WLAST ( microblaze_0_axi_periph_S_WLAST[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( microblaze_0_axi_periph_S_WVALID[0:0] ),
      .S_AXI_WREADY ( microblaze_0_axi_periph_S_WREADY[0:0] ),
      .S_AXI_BID ( microblaze_0_axi_periph_S_BID[0:0] ),
      .S_AXI_BRESP ( microblaze_0_axi_periph_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( microblaze_0_axi_periph_S_BVALID[0:0] ),
      .S_AXI_BREADY ( microblaze_0_axi_periph_S_BREADY[0:0] ),
      .S_AXI_ARID ( microblaze_0_axi_periph_S_ARID[0:0] ),
      .S_AXI_ARADDR ( microblaze_0_axi_periph_S_ARADDR ),
      .S_AXI_ARLEN ( microblaze_0_axi_periph_S_ARLEN ),
      .S_AXI_ARSIZE ( microblaze_0_axi_periph_S_ARSIZE ),
      .S_AXI_ARBURST ( microblaze_0_axi_periph_S_ARBURST ),
      .S_AXI_ARLOCK ( microblaze_0_axi_periph_S_ARLOCK ),
      .S_AXI_ARCACHE ( microblaze_0_axi_periph_S_ARCACHE ),
      .S_AXI_ARPROT ( microblaze_0_axi_periph_S_ARPROT ),
      .S_AXI_ARQOS ( microblaze_0_axi_periph_S_ARQOS ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( microblaze_0_axi_periph_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( microblaze_0_axi_periph_S_ARREADY[0:0] ),
      .S_AXI_RID ( microblaze_0_axi_periph_S_RID[0:0] ),
      .S_AXI_RDATA ( microblaze_0_axi_periph_S_RDATA ),
      .S_AXI_RRESP ( microblaze_0_axi_periph_S_RRESP ),
      .S_AXI_RLAST ( microblaze_0_axi_periph_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( microblaze_0_axi_periph_S_RVALID[0:0] ),
      .S_AXI_RREADY ( microblaze_0_axi_periph_S_RREADY[0:0] ),
      .M_AXI_ACLK ( pgassign1 ),
      .M_AXI_AWID ( microblaze_0_axi_periph_M_AWID ),
      .M_AXI_AWADDR ( microblaze_0_axi_periph_M_AWADDR ),
      .M_AXI_AWLEN ( microblaze_0_axi_periph_M_AWLEN ),
      .M_AXI_AWSIZE ( microblaze_0_axi_periph_M_AWSIZE ),
      .M_AXI_AWBURST ( microblaze_0_axi_periph_M_AWBURST ),
      .M_AXI_AWLOCK ( microblaze_0_axi_periph_M_AWLOCK ),
      .M_AXI_AWCACHE ( microblaze_0_axi_periph_M_AWCACHE ),
      .M_AXI_AWPROT ( microblaze_0_axi_periph_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS ( microblaze_0_axi_periph_M_AWQOS ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( microblaze_0_axi_periph_M_AWVALID ),
      .M_AXI_AWREADY ( microblaze_0_axi_periph_M_AWREADY ),
      .M_AXI_WID ( microblaze_0_axi_periph_M_WID ),
      .M_AXI_WDATA ( microblaze_0_axi_periph_M_WDATA ),
      .M_AXI_WSTRB ( microblaze_0_axi_periph_M_WSTRB ),
      .M_AXI_WLAST ( microblaze_0_axi_periph_M_WLAST ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( microblaze_0_axi_periph_M_WVALID ),
      .M_AXI_WREADY ( microblaze_0_axi_periph_M_WREADY ),
      .M_AXI_BID ( microblaze_0_axi_periph_M_BID ),
      .M_AXI_BRESP ( microblaze_0_axi_periph_M_BRESP ),
      .M_AXI_BUSER ( net_gnd2 ),
      .M_AXI_BVALID ( microblaze_0_axi_periph_M_BVALID ),
      .M_AXI_BREADY ( microblaze_0_axi_periph_M_BREADY ),
      .M_AXI_ARID ( microblaze_0_axi_periph_M_ARID ),
      .M_AXI_ARADDR ( microblaze_0_axi_periph_M_ARADDR ),
      .M_AXI_ARLEN ( microblaze_0_axi_periph_M_ARLEN ),
      .M_AXI_ARSIZE ( microblaze_0_axi_periph_M_ARSIZE ),
      .M_AXI_ARBURST ( microblaze_0_axi_periph_M_ARBURST ),
      .M_AXI_ARLOCK ( microblaze_0_axi_periph_M_ARLOCK ),
      .M_AXI_ARCACHE ( microblaze_0_axi_periph_M_ARCACHE ),
      .M_AXI_ARPROT ( microblaze_0_axi_periph_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS ( microblaze_0_axi_periph_M_ARQOS ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( microblaze_0_axi_periph_M_ARVALID ),
      .M_AXI_ARREADY ( microblaze_0_axi_periph_M_ARREADY ),
      .M_AXI_RID ( microblaze_0_axi_periph_M_RID ),
      .M_AXI_RDATA ( microblaze_0_axi_periph_M_RDATA ),
      .M_AXI_RRESP ( microblaze_0_axi_periph_M_RRESP ),
      .M_AXI_RLAST ( microblaze_0_axi_periph_M_RLAST ),
      .M_AXI_RUSER ( net_gnd2 ),
      .M_AXI_RVALID ( microblaze_0_axi_periph_M_RVALID ),
      .M_AXI_RREADY ( microblaze_0_axi_periph_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_microblaze_0_axi_ipc_wrapper
    microblaze_0_axi_ipc (
      .INTERCONNECT_ACLK ( clock_generator_0_CLKOUT0[0] ),
      .INTERCONNECT_ARESETN ( microblaze_0_axi_mem_INTERCONNECT_ARESETN[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N (  ),
      .IRQ (  ),
      .S_AXI_ACLK ( clock_generator_0_CLKOUT0[0:0] ),
      .S_AXI_AWID ( microblaze_0_axi_ipc_S_AWID[0:0] ),
      .S_AXI_AWADDR ( microblaze_0_axi_ipc_S_AWADDR ),
      .S_AXI_AWLEN ( microblaze_0_axi_ipc_S_AWLEN ),
      .S_AXI_AWSIZE ( microblaze_0_axi_ipc_S_AWSIZE ),
      .S_AXI_AWBURST ( microblaze_0_axi_ipc_S_AWBURST ),
      .S_AXI_AWLOCK ( microblaze_0_axi_ipc_S_AWLOCK ),
      .S_AXI_AWCACHE ( microblaze_0_axi_ipc_S_AWCACHE ),
      .S_AXI_AWPROT ( microblaze_0_axi_ipc_S_AWPROT ),
      .S_AXI_AWQOS ( microblaze_0_axi_ipc_S_AWQOS ),
      .S_AXI_AWUSER ( microblaze_0_axi_ipc_S_AWUSER ),
      .S_AXI_AWVALID ( microblaze_0_axi_ipc_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( microblaze_0_axi_ipc_S_AWREADY[0:0] ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( microblaze_0_axi_ipc_S_WDATA ),
      .S_AXI_WSTRB ( microblaze_0_axi_ipc_S_WSTRB ),
      .S_AXI_WLAST ( microblaze_0_axi_ipc_S_WLAST[0:0] ),
      .S_AXI_WUSER ( microblaze_0_axi_ipc_S_WUSER[0:0] ),
      .S_AXI_WVALID ( microblaze_0_axi_ipc_S_WVALID[0:0] ),
      .S_AXI_WREADY ( microblaze_0_axi_ipc_S_WREADY[0:0] ),
      .S_AXI_BID ( microblaze_0_axi_ipc_S_BID[0:0] ),
      .S_AXI_BRESP ( microblaze_0_axi_ipc_S_BRESP ),
      .S_AXI_BUSER ( microblaze_0_axi_ipc_S_BUSER[0:0] ),
      .S_AXI_BVALID ( microblaze_0_axi_ipc_S_BVALID[0:0] ),
      .S_AXI_BREADY ( microblaze_0_axi_ipc_S_BREADY[0:0] ),
      .S_AXI_ARID ( microblaze_0_axi_ipc_S_ARID[0:0] ),
      .S_AXI_ARADDR ( microblaze_0_axi_ipc_S_ARADDR ),
      .S_AXI_ARLEN ( microblaze_0_axi_ipc_S_ARLEN ),
      .S_AXI_ARSIZE ( microblaze_0_axi_ipc_S_ARSIZE ),
      .S_AXI_ARBURST ( microblaze_0_axi_ipc_S_ARBURST ),
      .S_AXI_ARLOCK ( microblaze_0_axi_ipc_S_ARLOCK ),
      .S_AXI_ARCACHE ( microblaze_0_axi_ipc_S_ARCACHE ),
      .S_AXI_ARPROT ( microblaze_0_axi_ipc_S_ARPROT ),
      .S_AXI_ARQOS ( microblaze_0_axi_ipc_S_ARQOS ),
      .S_AXI_ARUSER ( microblaze_0_axi_ipc_S_ARUSER ),
      .S_AXI_ARVALID ( microblaze_0_axi_ipc_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( microblaze_0_axi_ipc_S_ARREADY[0:0] ),
      .S_AXI_RID ( microblaze_0_axi_ipc_S_RID[0:0] ),
      .S_AXI_RDATA ( microblaze_0_axi_ipc_S_RDATA ),
      .S_AXI_RRESP ( microblaze_0_axi_ipc_S_RRESP ),
      .S_AXI_RLAST ( microblaze_0_axi_ipc_S_RLAST[0:0] ),
      .S_AXI_RUSER ( microblaze_0_axi_ipc_S_RUSER[0:0] ),
      .S_AXI_RVALID ( microblaze_0_axi_ipc_S_RVALID[0:0] ),
      .S_AXI_RREADY ( microblaze_0_axi_ipc_S_RREADY[0:0] ),
      .M_AXI_ACLK ( clock_generator_0_CLKOUT0[0:0] ),
      .M_AXI_AWID ( microblaze_0_axi_ipc_M_AWID[0:0] ),
      .M_AXI_AWADDR ( microblaze_0_axi_ipc_M_AWADDR ),
      .M_AXI_AWLEN ( microblaze_0_axi_ipc_M_AWLEN ),
      .M_AXI_AWSIZE ( microblaze_0_axi_ipc_M_AWSIZE ),
      .M_AXI_AWBURST ( microblaze_0_axi_ipc_M_AWBURST ),
      .M_AXI_AWLOCK ( microblaze_0_axi_ipc_M_AWLOCK ),
      .M_AXI_AWCACHE ( microblaze_0_axi_ipc_M_AWCACHE ),
      .M_AXI_AWPROT ( microblaze_0_axi_ipc_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS ( microblaze_0_axi_ipc_M_AWQOS ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( microblaze_0_axi_ipc_M_AWVALID[0:0] ),
      .M_AXI_AWREADY ( microblaze_0_axi_ipc_M_AWREADY[0:0] ),
      .M_AXI_WID ( microblaze_0_axi_ipc_M_WID[0:0] ),
      .M_AXI_WDATA ( microblaze_0_axi_ipc_M_WDATA ),
      .M_AXI_WSTRB ( microblaze_0_axi_ipc_M_WSTRB ),
      .M_AXI_WLAST ( microblaze_0_axi_ipc_M_WLAST[0:0] ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( microblaze_0_axi_ipc_M_WVALID[0:0] ),
      .M_AXI_WREADY ( microblaze_0_axi_ipc_M_WREADY[0:0] ),
      .M_AXI_BID ( microblaze_0_axi_ipc_M_BID[0:0] ),
      .M_AXI_BRESP ( microblaze_0_axi_ipc_M_BRESP ),
      .M_AXI_BUSER ( net_gnd1[0:0] ),
      .M_AXI_BVALID ( microblaze_0_axi_ipc_M_BVALID[0:0] ),
      .M_AXI_BREADY ( microblaze_0_axi_ipc_M_BREADY[0:0] ),
      .M_AXI_ARID ( microblaze_0_axi_ipc_M_ARID[0:0] ),
      .M_AXI_ARADDR ( microblaze_0_axi_ipc_M_ARADDR ),
      .M_AXI_ARLEN ( microblaze_0_axi_ipc_M_ARLEN ),
      .M_AXI_ARSIZE ( microblaze_0_axi_ipc_M_ARSIZE ),
      .M_AXI_ARBURST ( microblaze_0_axi_ipc_M_ARBURST ),
      .M_AXI_ARLOCK ( microblaze_0_axi_ipc_M_ARLOCK ),
      .M_AXI_ARCACHE ( microblaze_0_axi_ipc_M_ARCACHE ),
      .M_AXI_ARPROT ( microblaze_0_axi_ipc_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS ( microblaze_0_axi_ipc_M_ARQOS ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( microblaze_0_axi_ipc_M_ARVALID[0:0] ),
      .M_AXI_ARREADY ( microblaze_0_axi_ipc_M_ARREADY[0:0] ),
      .M_AXI_RID ( microblaze_0_axi_ipc_M_RID[0:0] ),
      .M_AXI_RDATA ( microblaze_0_axi_ipc_M_RDATA ),
      .M_AXI_RRESP ( microblaze_0_axi_ipc_M_RRESP ),
      .M_AXI_RLAST ( microblaze_0_axi_ipc_M_RLAST[0:0] ),
      .M_AXI_RUSER ( net_gnd1[0:0] ),
      .M_AXI_RVALID ( microblaze_0_axi_ipc_M_RVALID[0:0] ),
      .M_AXI_RREADY ( microblaze_0_axi_ipc_M_RREADY[0:0] ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_microblaze_0_wrapper
    microblaze_0 (
      .CLK ( clock_generator_0_CLKOUT0[0] ),
      .RESET ( lmb_v10_1_LMB_Rst ),
      .MB_RESET ( microblaze_0_MB_Reset ),
      .INTERRUPT ( net_gnd0 ),
      .INTERRUPT_ADDRESS ( net_gnd32 ),
      .INTERRUPT_ACK (  ),
      .EXT_BRK ( Ext_BRK ),
      .EXT_NM_BRK ( Ext_NM_BRK ),
      .DBG_STOP ( net_gnd0 ),
      .MB_Halted (  ),
      .MB_Error (  ),
      .WAKEUP ( net_gnd2[1:0] ),
      .SLEEP (  ),
      .DBG_WAKEUP (  ),
      .LOCKSTEP_MASTER_OUT (  ),
      .LOCKSTEP_SLAVE_IN ( net_gnd4096 ),
      .LOCKSTEP_OUT (  ),
      .INSTR ( lmb_v10_0_LMB_ReadDBus ),
      .IREADY ( lmb_v10_0_LMB_Ready ),
      .IWAIT ( lmb_v10_0_LMB_Wait ),
      .ICE ( lmb_v10_0_LMB_CE ),
      .IUE ( lmb_v10_0_LMB_UE ),
      .INSTR_ADDR ( lmb_v10_0_M_ABus ),
      .IFETCH ( lmb_v10_0_M_ReadStrobe ),
      .I_AS ( lmb_v10_0_M_AddrStrobe ),
      .IPLB_M_ABort (  ),
      .IPLB_M_ABus (  ),
      .IPLB_M_UABus (  ),
      .IPLB_M_BE (  ),
      .IPLB_M_busLock (  ),
      .IPLB_M_lockErr (  ),
      .IPLB_M_MSize (  ),
      .IPLB_M_priority (  ),
      .IPLB_M_rdBurst (  ),
      .IPLB_M_request (  ),
      .IPLB_M_RNW (  ),
      .IPLB_M_size (  ),
      .IPLB_M_TAttribute (  ),
      .IPLB_M_type (  ),
      .IPLB_M_wrBurst (  ),
      .IPLB_M_wrDBus (  ),
      .IPLB_MBusy ( net_gnd0 ),
      .IPLB_MRdErr ( net_gnd0 ),
      .IPLB_MWrErr ( net_gnd0 ),
      .IPLB_MIRQ ( net_gnd0 ),
      .IPLB_MWrBTerm ( net_gnd0 ),
      .IPLB_MWrDAck ( net_gnd0 ),
      .IPLB_MAddrAck ( net_gnd0 ),
      .IPLB_MRdBTerm ( net_gnd0 ),
      .IPLB_MRdDAck ( net_gnd0 ),
      .IPLB_MRdDBus ( net_gnd32 ),
      .IPLB_MRdWdAddr ( net_gnd4 ),
      .IPLB_MRearbitrate ( net_gnd0 ),
      .IPLB_MSSize ( net_gnd2[1:0] ),
      .IPLB_MTimeout ( net_gnd0 ),
      .DATA_READ ( lmb_v10_1_LMB_ReadDBus ),
      .DREADY ( lmb_v10_1_LMB_Ready ),
      .DWAIT ( lmb_v10_1_LMB_Wait ),
      .DCE ( lmb_v10_1_LMB_CE ),
      .DUE ( lmb_v10_1_LMB_UE ),
      .DATA_WRITE ( lmb_v10_1_M_DBus ),
      .DATA_ADDR ( lmb_v10_1_M_ABus ),
      .D_AS ( lmb_v10_1_M_AddrStrobe ),
      .READ_STROBE ( lmb_v10_1_M_ReadStrobe ),
      .WRITE_STROBE ( lmb_v10_1_M_WriteStrobe ),
      .BYTE_ENABLE ( lmb_v10_1_M_BE ),
      .DPLB_M_ABort (  ),
      .DPLB_M_ABus (  ),
      .DPLB_M_UABus (  ),
      .DPLB_M_BE (  ),
      .DPLB_M_busLock (  ),
      .DPLB_M_lockErr (  ),
      .DPLB_M_MSize (  ),
      .DPLB_M_priority (  ),
      .DPLB_M_rdBurst (  ),
      .DPLB_M_request (  ),
      .DPLB_M_RNW (  ),
      .DPLB_M_size (  ),
      .DPLB_M_TAttribute (  ),
      .DPLB_M_type (  ),
      .DPLB_M_wrBurst (  ),
      .DPLB_M_wrDBus (  ),
      .DPLB_MBusy ( net_gnd0 ),
      .DPLB_MRdErr ( net_gnd0 ),
      .DPLB_MWrErr ( net_gnd0 ),
      .DPLB_MIRQ ( net_gnd0 ),
      .DPLB_MWrBTerm ( net_gnd0 ),
      .DPLB_MWrDAck ( net_gnd0 ),
      .DPLB_MAddrAck ( net_gnd0 ),
      .DPLB_MRdBTerm ( net_gnd0 ),
      .DPLB_MRdDAck ( net_gnd0 ),
      .DPLB_MRdDBus ( net_gnd32 ),
      .DPLB_MRdWdAddr ( net_gnd4 ),
      .DPLB_MRearbitrate ( net_gnd0 ),
      .DPLB_MSSize ( net_gnd2[1:0] ),
      .DPLB_MTimeout ( net_gnd0 ),
      .M_AXI_IP_AWID (  ),
      .M_AXI_IP_AWADDR (  ),
      .M_AXI_IP_AWLEN (  ),
      .M_AXI_IP_AWSIZE (  ),
      .M_AXI_IP_AWBURST (  ),
      .M_AXI_IP_AWLOCK (  ),
      .M_AXI_IP_AWCACHE (  ),
      .M_AXI_IP_AWPROT (  ),
      .M_AXI_IP_AWQOS (  ),
      .M_AXI_IP_AWVALID (  ),
      .M_AXI_IP_AWREADY ( net_gnd0 ),
      .M_AXI_IP_WDATA (  ),
      .M_AXI_IP_WSTRB (  ),
      .M_AXI_IP_WLAST (  ),
      .M_AXI_IP_WVALID (  ),
      .M_AXI_IP_WREADY ( net_gnd0 ),
      .M_AXI_IP_BID ( net_gnd1[0:0] ),
      .M_AXI_IP_BRESP ( net_gnd2 ),
      .M_AXI_IP_BVALID ( net_gnd0 ),
      .M_AXI_IP_BREADY (  ),
      .M_AXI_IP_ARID (  ),
      .M_AXI_IP_ARADDR (  ),
      .M_AXI_IP_ARLEN (  ),
      .M_AXI_IP_ARSIZE (  ),
      .M_AXI_IP_ARBURST (  ),
      .M_AXI_IP_ARLOCK (  ),
      .M_AXI_IP_ARCACHE (  ),
      .M_AXI_IP_ARPROT (  ),
      .M_AXI_IP_ARQOS (  ),
      .M_AXI_IP_ARVALID (  ),
      .M_AXI_IP_ARREADY ( net_gnd0 ),
      .M_AXI_IP_RID ( net_gnd1[0:0] ),
      .M_AXI_IP_RDATA ( net_gnd32[0:31] ),
      .M_AXI_IP_RRESP ( net_gnd2 ),
      .M_AXI_IP_RLAST ( net_gnd0 ),
      .M_AXI_IP_RVALID ( net_gnd0 ),
      .M_AXI_IP_RREADY (  ),
      .M_AXI_DP_AWID ( microblaze_0_axi_periph_S_AWID[0:0] ),
      .M_AXI_DP_AWADDR ( microblaze_0_axi_periph_S_AWADDR ),
      .M_AXI_DP_AWLEN ( microblaze_0_axi_periph_S_AWLEN ),
      .M_AXI_DP_AWSIZE ( microblaze_0_axi_periph_S_AWSIZE ),
      .M_AXI_DP_AWBURST ( microblaze_0_axi_periph_S_AWBURST ),
      .M_AXI_DP_AWLOCK ( microblaze_0_axi_periph_S_AWLOCK[0] ),
      .M_AXI_DP_AWCACHE ( microblaze_0_axi_periph_S_AWCACHE ),
      .M_AXI_DP_AWPROT ( microblaze_0_axi_periph_S_AWPROT ),
      .M_AXI_DP_AWQOS ( microblaze_0_axi_periph_S_AWQOS ),
      .M_AXI_DP_AWVALID ( microblaze_0_axi_periph_S_AWVALID[0] ),
      .M_AXI_DP_AWREADY ( microblaze_0_axi_periph_S_AWREADY[0] ),
      .M_AXI_DP_WDATA ( microblaze_0_axi_periph_S_WDATA ),
      .M_AXI_DP_WSTRB ( microblaze_0_axi_periph_S_WSTRB ),
      .M_AXI_DP_WLAST ( microblaze_0_axi_periph_S_WLAST[0] ),
      .M_AXI_DP_WVALID ( microblaze_0_axi_periph_S_WVALID[0] ),
      .M_AXI_DP_WREADY ( microblaze_0_axi_periph_S_WREADY[0] ),
      .M_AXI_DP_BID ( microblaze_0_axi_periph_S_BID[0:0] ),
      .M_AXI_DP_BRESP ( microblaze_0_axi_periph_S_BRESP ),
      .M_AXI_DP_BVALID ( microblaze_0_axi_periph_S_BVALID[0] ),
      .M_AXI_DP_BREADY ( microblaze_0_axi_periph_S_BREADY[0] ),
      .M_AXI_DP_ARID ( microblaze_0_axi_periph_S_ARID[0:0] ),
      .M_AXI_DP_ARADDR ( microblaze_0_axi_periph_S_ARADDR ),
      .M_AXI_DP_ARLEN ( microblaze_0_axi_periph_S_ARLEN ),
      .M_AXI_DP_ARSIZE ( microblaze_0_axi_periph_S_ARSIZE ),
      .M_AXI_DP_ARBURST ( microblaze_0_axi_periph_S_ARBURST ),
      .M_AXI_DP_ARLOCK ( microblaze_0_axi_periph_S_ARLOCK[0] ),
      .M_AXI_DP_ARCACHE ( microblaze_0_axi_periph_S_ARCACHE ),
      .M_AXI_DP_ARPROT ( microblaze_0_axi_periph_S_ARPROT ),
      .M_AXI_DP_ARQOS ( microblaze_0_axi_periph_S_ARQOS ),
      .M_AXI_DP_ARVALID ( microblaze_0_axi_periph_S_ARVALID[0] ),
      .M_AXI_DP_ARREADY ( microblaze_0_axi_periph_S_ARREADY[0] ),
      .M_AXI_DP_RID ( microblaze_0_axi_periph_S_RID[0:0] ),
      .M_AXI_DP_RDATA ( microblaze_0_axi_periph_S_RDATA ),
      .M_AXI_DP_RRESP ( microblaze_0_axi_periph_S_RRESP ),
      .M_AXI_DP_RLAST ( microblaze_0_axi_periph_S_RLAST[0] ),
      .M_AXI_DP_RVALID ( microblaze_0_axi_periph_S_RVALID[0] ),
      .M_AXI_DP_RREADY ( microblaze_0_axi_periph_S_RREADY[0] ),
      .M_AXI_IC_AWID (  ),
      .M_AXI_IC_AWADDR (  ),
      .M_AXI_IC_AWLEN (  ),
      .M_AXI_IC_AWSIZE (  ),
      .M_AXI_IC_AWBURST (  ),
      .M_AXI_IC_AWLOCK (  ),
      .M_AXI_IC_AWCACHE (  ),
      .M_AXI_IC_AWPROT (  ),
      .M_AXI_IC_AWQOS (  ),
      .M_AXI_IC_AWVALID (  ),
      .M_AXI_IC_AWREADY ( net_gnd0 ),
      .M_AXI_IC_AWUSER (  ),
      .M_AXI_IC_AWDOMAIN (  ),
      .M_AXI_IC_AWSNOOP (  ),
      .M_AXI_IC_AWBAR (  ),
      .M_AXI_IC_WDATA (  ),
      .M_AXI_IC_WSTRB (  ),
      .M_AXI_IC_WLAST (  ),
      .M_AXI_IC_WVALID (  ),
      .M_AXI_IC_WREADY ( net_gnd0 ),
      .M_AXI_IC_WUSER (  ),
      .M_AXI_IC_BID ( net_gnd1[0:0] ),
      .M_AXI_IC_BRESP ( net_gnd2 ),
      .M_AXI_IC_BVALID ( net_gnd0 ),
      .M_AXI_IC_BREADY (  ),
      .M_AXI_IC_BUSER ( net_gnd1[0:0] ),
      .M_AXI_IC_WACK (  ),
      .M_AXI_IC_ARID (  ),
      .M_AXI_IC_ARADDR (  ),
      .M_AXI_IC_ARLEN (  ),
      .M_AXI_IC_ARSIZE (  ),
      .M_AXI_IC_ARBURST (  ),
      .M_AXI_IC_ARLOCK (  ),
      .M_AXI_IC_ARCACHE (  ),
      .M_AXI_IC_ARPROT (  ),
      .M_AXI_IC_ARQOS (  ),
      .M_AXI_IC_ARVALID (  ),
      .M_AXI_IC_ARREADY ( net_gnd0 ),
      .M_AXI_IC_ARUSER (  ),
      .M_AXI_IC_ARDOMAIN (  ),
      .M_AXI_IC_ARSNOOP (  ),
      .M_AXI_IC_ARBAR (  ),
      .M_AXI_IC_RID ( net_gnd1[0:0] ),
      .M_AXI_IC_RDATA ( net_gnd32[0:31] ),
      .M_AXI_IC_RRESP ( net_gnd2 ),
      .M_AXI_IC_RLAST ( net_gnd0 ),
      .M_AXI_IC_RVALID ( net_gnd0 ),
      .M_AXI_IC_RREADY (  ),
      .M_AXI_IC_RUSER ( net_gnd1[0:0] ),
      .M_AXI_IC_RACK (  ),
      .M_AXI_IC_ACVALID ( net_gnd0 ),
      .M_AXI_IC_ACADDR ( net_gnd32[0:31] ),
      .M_AXI_IC_ACSNOOP ( net_gnd4[0:3] ),
      .M_AXI_IC_ACPROT ( net_gnd3 ),
      .M_AXI_IC_ACREADY (  ),
      .M_AXI_IC_CRREADY ( net_gnd0 ),
      .M_AXI_IC_CRVALID (  ),
      .M_AXI_IC_CRRESP (  ),
      .M_AXI_IC_CDVALID (  ),
      .M_AXI_IC_CDREADY ( net_gnd0 ),
      .M_AXI_IC_CDDATA (  ),
      .M_AXI_IC_CDLAST (  ),
      .M_AXI_DC_AWID ( microblaze_0_axi_ipc_S_AWID[0:0] ),
      .M_AXI_DC_AWADDR ( microblaze_0_axi_ipc_S_AWADDR ),
      .M_AXI_DC_AWLEN ( microblaze_0_axi_ipc_S_AWLEN ),
      .M_AXI_DC_AWSIZE ( microblaze_0_axi_ipc_S_AWSIZE ),
      .M_AXI_DC_AWBURST ( microblaze_0_axi_ipc_S_AWBURST ),
      .M_AXI_DC_AWLOCK ( microblaze_0_axi_ipc_S_AWLOCK[0] ),
      .M_AXI_DC_AWCACHE ( microblaze_0_axi_ipc_S_AWCACHE ),
      .M_AXI_DC_AWPROT ( microblaze_0_axi_ipc_S_AWPROT ),
      .M_AXI_DC_AWQOS ( microblaze_0_axi_ipc_S_AWQOS ),
      .M_AXI_DC_AWVALID ( microblaze_0_axi_ipc_S_AWVALID[0] ),
      .M_AXI_DC_AWREADY ( microblaze_0_axi_ipc_S_AWREADY[0] ),
      .M_AXI_DC_AWUSER ( microblaze_0_axi_ipc_S_AWUSER ),
      .M_AXI_DC_AWDOMAIN (  ),
      .M_AXI_DC_AWSNOOP (  ),
      .M_AXI_DC_AWBAR (  ),
      .M_AXI_DC_WDATA ( microblaze_0_axi_ipc_S_WDATA[31:0] ),
      .M_AXI_DC_WSTRB ( microblaze_0_axi_ipc_S_WSTRB[3:0] ),
      .M_AXI_DC_WLAST ( microblaze_0_axi_ipc_S_WLAST[0] ),
      .M_AXI_DC_WVALID ( microblaze_0_axi_ipc_S_WVALID[0] ),
      .M_AXI_DC_WREADY ( microblaze_0_axi_ipc_S_WREADY[0] ),
      .M_AXI_DC_WUSER ( microblaze_0_axi_ipc_S_WUSER[0:0] ),
      .M_AXI_DC_BID ( microblaze_0_axi_ipc_S_BID[0:0] ),
      .M_AXI_DC_BRESP ( microblaze_0_axi_ipc_S_BRESP ),
      .M_AXI_DC_BVALID ( microblaze_0_axi_ipc_S_BVALID[0] ),
      .M_AXI_DC_BREADY ( microblaze_0_axi_ipc_S_BREADY[0] ),
      .M_AXI_DC_BUSER ( microblaze_0_axi_ipc_S_BUSER[0:0] ),
      .M_AXI_DC_WACK (  ),
      .M_AXI_DC_ARID ( microblaze_0_axi_ipc_S_ARID[0:0] ),
      .M_AXI_DC_ARADDR ( microblaze_0_axi_ipc_S_ARADDR ),
      .M_AXI_DC_ARLEN ( microblaze_0_axi_ipc_S_ARLEN ),
      .M_AXI_DC_ARSIZE ( microblaze_0_axi_ipc_S_ARSIZE ),
      .M_AXI_DC_ARBURST ( microblaze_0_axi_ipc_S_ARBURST ),
      .M_AXI_DC_ARLOCK ( microblaze_0_axi_ipc_S_ARLOCK[0] ),
      .M_AXI_DC_ARCACHE ( microblaze_0_axi_ipc_S_ARCACHE ),
      .M_AXI_DC_ARPROT ( microblaze_0_axi_ipc_S_ARPROT ),
      .M_AXI_DC_ARQOS ( microblaze_0_axi_ipc_S_ARQOS ),
      .M_AXI_DC_ARVALID ( microblaze_0_axi_ipc_S_ARVALID[0] ),
      .M_AXI_DC_ARREADY ( microblaze_0_axi_ipc_S_ARREADY[0] ),
      .M_AXI_DC_ARUSER ( microblaze_0_axi_ipc_S_ARUSER ),
      .M_AXI_DC_ARDOMAIN (  ),
      .M_AXI_DC_ARSNOOP (  ),
      .M_AXI_DC_ARBAR (  ),
      .M_AXI_DC_RID ( microblaze_0_axi_ipc_S_RID[0:0] ),
      .M_AXI_DC_RDATA ( microblaze_0_axi_ipc_S_RDATA[31:0] ),
      .M_AXI_DC_RRESP ( microblaze_0_axi_ipc_S_RRESP ),
      .M_AXI_DC_RLAST ( microblaze_0_axi_ipc_S_RLAST[0] ),
      .M_AXI_DC_RVALID ( microblaze_0_axi_ipc_S_RVALID[0] ),
      .M_AXI_DC_RREADY ( microblaze_0_axi_ipc_S_RREADY[0] ),
      .M_AXI_DC_RUSER ( microblaze_0_axi_ipc_S_RUSER[0:0] ),
      .M_AXI_DC_RACK (  ),
      .M_AXI_DC_ACVALID ( net_gnd0 ),
      .M_AXI_DC_ACADDR ( net_gnd32[0:31] ),
      .M_AXI_DC_ACSNOOP ( net_gnd4[0:3] ),
      .M_AXI_DC_ACPROT ( net_gnd3 ),
      .M_AXI_DC_ACREADY (  ),
      .M_AXI_DC_CRREADY ( net_gnd0 ),
      .M_AXI_DC_CRVALID (  ),
      .M_AXI_DC_CRRESP (  ),
      .M_AXI_DC_CDVALID (  ),
      .M_AXI_DC_CDREADY ( net_gnd0 ),
      .M_AXI_DC_CDDATA (  ),
      .M_AXI_DC_CDLAST (  ),
      .DBG_CLK ( debug_module_0_MBDEBUG_0_Dbg_Clk ),
      .DBG_TDI ( debug_module_0_MBDEBUG_0_Dbg_TDI ),
      .DBG_TDO ( debug_module_0_MBDEBUG_0_Dbg_TDO ),
      .DBG_REG_EN ( debug_module_0_MBDEBUG_0_Dbg_Reg_En ),
      .DBG_SHIFT ( debug_module_0_MBDEBUG_0_Dbg_Shift ),
      .DBG_CAPTURE ( debug_module_0_MBDEBUG_0_Dbg_Capture ),
      .DBG_UPDATE ( debug_module_0_MBDEBUG_0_Dbg_Update ),
      .DEBUG_RST ( debug_module_0_MBDEBUG_0_Debug_Rst ),
      .Trace_Instruction (  ),
      .Trace_Valid_Instr (  ),
      .Trace_PC (  ),
      .Trace_Reg_Write (  ),
      .Trace_Reg_Addr (  ),
      .Trace_MSR_Reg (  ),
      .Trace_PID_Reg (  ),
      .Trace_New_Reg_Value (  ),
      .Trace_Exception_Taken (  ),
      .Trace_Exception_Kind (  ),
      .Trace_Jump_Taken (  ),
      .Trace_Delay_Slot (  ),
      .Trace_Data_Address (  ),
      .Trace_Data_Access (  ),
      .Trace_Data_Read (  ),
      .Trace_Data_Write (  ),
      .Trace_Data_Write_Value (  ),
      .Trace_Data_Byte_Enable (  ),
      .Trace_DCache_Req (  ),
      .Trace_DCache_Hit (  ),
      .Trace_DCache_Rdy (  ),
      .Trace_DCache_Read (  ),
      .Trace_ICache_Req (  ),
      .Trace_ICache_Hit (  ),
      .Trace_ICache_Rdy (  ),
      .Trace_OF_PipeRun (  ),
      .Trace_EX_PipeRun (  ),
      .Trace_MEM_PipeRun (  ),
      .Trace_MB_Halted (  ),
      .Trace_Jump_Hit (  ),
      .FSL0_S_CLK (  ),
      .FSL0_S_READ ( fsl_v20_0_i2s_mb0_FSL_S_Read ),
      .FSL0_S_DATA ( fsl_v20_0_i2s_mb0_FSL_S_Data ),
      .FSL0_S_CONTROL ( fsl_v20_0_i2s_mb0_FSL_S_Control ),
      .FSL0_S_EXISTS ( fsl_v20_0_i2s_mb0_FSL_S_Exists ),
      .FSL0_M_CLK (  ),
      .FSL0_M_WRITE (  ),
      .FSL0_M_DATA (  ),
      .FSL0_M_CONTROL (  ),
      .FSL0_M_FULL ( net_gnd0 ),
      .FSL1_S_CLK (  ),
      .FSL1_S_READ ( fsl_v20_1_i2s_mb0_FSL_S_Read ),
      .FSL1_S_DATA ( fsl_v20_1_i2s_mb0_FSL_S_Data ),
      .FSL1_S_CONTROL ( fsl_v20_1_i2s_mb0_FSL_S_Control ),
      .FSL1_S_EXISTS ( fsl_v20_1_i2s_mb0_FSL_S_Exists ),
      .FSL1_M_CLK (  ),
      .FSL1_M_WRITE (  ),
      .FSL1_M_DATA (  ),
      .FSL1_M_CONTROL (  ),
      .FSL1_M_FULL ( net_gnd0 ),
      .FSL2_S_CLK (  ),
      .FSL2_S_READ (  ),
      .FSL2_S_DATA ( net_gnd32 ),
      .FSL2_S_CONTROL ( net_gnd0 ),
      .FSL2_S_EXISTS ( net_gnd0 ),
      .FSL2_M_CLK (  ),
      .FSL2_M_WRITE (  ),
      .FSL2_M_DATA (  ),
      .FSL2_M_CONTROL (  ),
      .FSL2_M_FULL ( net_gnd0 ),
      .FSL3_S_CLK (  ),
      .FSL3_S_READ (  ),
      .FSL3_S_DATA ( net_gnd32 ),
      .FSL3_S_CONTROL ( net_gnd0 ),
      .FSL3_S_EXISTS ( net_gnd0 ),
      .FSL3_M_CLK (  ),
      .FSL3_M_WRITE (  ),
      .FSL3_M_DATA (  ),
      .FSL3_M_CONTROL (  ),
      .FSL3_M_FULL ( net_gnd0 ),
      .FSL4_S_CLK (  ),
      .FSL4_S_READ (  ),
      .FSL4_S_DATA ( net_gnd32 ),
      .FSL4_S_CONTROL ( net_gnd0 ),
      .FSL4_S_EXISTS ( net_gnd0 ),
      .FSL4_M_CLK (  ),
      .FSL4_M_WRITE (  ),
      .FSL4_M_DATA (  ),
      .FSL4_M_CONTROL (  ),
      .FSL4_M_FULL ( net_gnd0 ),
      .FSL5_S_CLK (  ),
      .FSL5_S_READ (  ),
      .FSL5_S_DATA ( net_gnd32 ),
      .FSL5_S_CONTROL ( net_gnd0 ),
      .FSL5_S_EXISTS ( net_gnd0 ),
      .FSL5_M_CLK (  ),
      .FSL5_M_WRITE (  ),
      .FSL5_M_DATA (  ),
      .FSL5_M_CONTROL (  ),
      .FSL5_M_FULL ( net_gnd0 ),
      .FSL6_S_CLK (  ),
      .FSL6_S_READ (  ),
      .FSL6_S_DATA ( net_gnd32 ),
      .FSL6_S_CONTROL ( net_gnd0 ),
      .FSL6_S_EXISTS ( net_gnd0 ),
      .FSL6_M_CLK (  ),
      .FSL6_M_WRITE (  ),
      .FSL6_M_DATA (  ),
      .FSL6_M_CONTROL (  ),
      .FSL6_M_FULL ( net_gnd0 ),
      .FSL7_S_CLK (  ),
      .FSL7_S_READ (  ),
      .FSL7_S_DATA ( net_gnd32 ),
      .FSL7_S_CONTROL ( net_gnd0 ),
      .FSL7_S_EXISTS ( net_gnd0 ),
      .FSL7_M_CLK (  ),
      .FSL7_M_WRITE (  ),
      .FSL7_M_DATA (  ),
      .FSL7_M_CONTROL (  ),
      .FSL7_M_FULL ( net_gnd0 ),
      .FSL8_S_CLK (  ),
      .FSL8_S_READ (  ),
      .FSL8_S_DATA ( net_gnd32 ),
      .FSL8_S_CONTROL ( net_gnd0 ),
      .FSL8_S_EXISTS ( net_gnd0 ),
      .FSL8_M_CLK (  ),
      .FSL8_M_WRITE (  ),
      .FSL8_M_DATA (  ),
      .FSL8_M_CONTROL (  ),
      .FSL8_M_FULL ( net_gnd0 ),
      .FSL9_S_CLK (  ),
      .FSL9_S_READ (  ),
      .FSL9_S_DATA ( net_gnd32 ),
      .FSL9_S_CONTROL ( net_gnd0 ),
      .FSL9_S_EXISTS ( net_gnd0 ),
      .FSL9_M_CLK (  ),
      .FSL9_M_WRITE (  ),
      .FSL9_M_DATA (  ),
      .FSL9_M_CONTROL (  ),
      .FSL9_M_FULL ( net_gnd0 ),
      .FSL10_S_CLK (  ),
      .FSL10_S_READ (  ),
      .FSL10_S_DATA ( net_gnd32 ),
      .FSL10_S_CONTROL ( net_gnd0 ),
      .FSL10_S_EXISTS ( net_gnd0 ),
      .FSL10_M_CLK (  ),
      .FSL10_M_WRITE (  ),
      .FSL10_M_DATA (  ),
      .FSL10_M_CONTROL (  ),
      .FSL10_M_FULL ( net_gnd0 ),
      .FSL11_S_CLK (  ),
      .FSL11_S_READ (  ),
      .FSL11_S_DATA ( net_gnd32 ),
      .FSL11_S_CONTROL ( net_gnd0 ),
      .FSL11_S_EXISTS ( net_gnd0 ),
      .FSL11_M_CLK (  ),
      .FSL11_M_WRITE (  ),
      .FSL11_M_DATA (  ),
      .FSL11_M_CONTROL (  ),
      .FSL11_M_FULL ( net_gnd0 ),
      .FSL12_S_CLK (  ),
      .FSL12_S_READ (  ),
      .FSL12_S_DATA ( net_gnd32 ),
      .FSL12_S_CONTROL ( net_gnd0 ),
      .FSL12_S_EXISTS ( net_gnd0 ),
      .FSL12_M_CLK (  ),
      .FSL12_M_WRITE (  ),
      .FSL12_M_DATA (  ),
      .FSL12_M_CONTROL (  ),
      .FSL12_M_FULL ( net_gnd0 ),
      .FSL13_S_CLK (  ),
      .FSL13_S_READ (  ),
      .FSL13_S_DATA ( net_gnd32 ),
      .FSL13_S_CONTROL ( net_gnd0 ),
      .FSL13_S_EXISTS ( net_gnd0 ),
      .FSL13_M_CLK (  ),
      .FSL13_M_WRITE (  ),
      .FSL13_M_DATA (  ),
      .FSL13_M_CONTROL (  ),
      .FSL13_M_FULL ( net_gnd0 ),
      .FSL14_S_CLK (  ),
      .FSL14_S_READ (  ),
      .FSL14_S_DATA ( net_gnd32 ),
      .FSL14_S_CONTROL ( net_gnd0 ),
      .FSL14_S_EXISTS ( net_gnd0 ),
      .FSL14_M_CLK (  ),
      .FSL14_M_WRITE (  ),
      .FSL14_M_DATA (  ),
      .FSL14_M_CONTROL (  ),
      .FSL14_M_FULL ( net_gnd0 ),
      .FSL15_S_CLK (  ),
      .FSL15_S_READ (  ),
      .FSL15_S_DATA ( net_gnd32 ),
      .FSL15_S_CONTROL ( net_gnd0 ),
      .FSL15_S_EXISTS ( net_gnd0 ),
      .FSL15_M_CLK (  ),
      .FSL15_M_WRITE (  ),
      .FSL15_M_DATA (  ),
      .FSL15_M_CONTROL (  ),
      .FSL15_M_FULL ( net_gnd0 ),
      .M0_AXIS_TLAST (  ),
      .M0_AXIS_TDATA (  ),
      .M0_AXIS_TVALID (  ),
      .M0_AXIS_TREADY ( net_gnd0 ),
      .S0_AXIS_TLAST ( net_gnd0 ),
      .S0_AXIS_TDATA ( net_gnd32[0:31] ),
      .S0_AXIS_TVALID ( net_gnd0 ),
      .S0_AXIS_TREADY (  ),
      .M1_AXIS_TLAST (  ),
      .M1_AXIS_TDATA (  ),
      .M1_AXIS_TVALID (  ),
      .M1_AXIS_TREADY ( net_gnd0 ),
      .S1_AXIS_TLAST ( net_gnd0 ),
      .S1_AXIS_TDATA ( net_gnd32[0:31] ),
      .S1_AXIS_TVALID ( net_gnd0 ),
      .S1_AXIS_TREADY (  ),
      .M2_AXIS_TLAST (  ),
      .M2_AXIS_TDATA (  ),
      .M2_AXIS_TVALID (  ),
      .M2_AXIS_TREADY ( net_gnd0 ),
      .S2_AXIS_TLAST ( net_gnd0 ),
      .S2_AXIS_TDATA ( net_gnd32[0:31] ),
      .S2_AXIS_TVALID ( net_gnd0 ),
      .S2_AXIS_TREADY (  ),
      .M3_AXIS_TLAST (  ),
      .M3_AXIS_TDATA (  ),
      .M3_AXIS_TVALID (  ),
      .M3_AXIS_TREADY ( net_gnd0 ),
      .S3_AXIS_TLAST ( net_gnd0 ),
      .S3_AXIS_TDATA ( net_gnd32[0:31] ),
      .S3_AXIS_TVALID ( net_gnd0 ),
      .S3_AXIS_TREADY (  ),
      .M4_AXIS_TLAST (  ),
      .M4_AXIS_TDATA (  ),
      .M4_AXIS_TVALID (  ),
      .M4_AXIS_TREADY ( net_gnd0 ),
      .S4_AXIS_TLAST ( net_gnd0 ),
      .S4_AXIS_TDATA ( net_gnd32[0:31] ),
      .S4_AXIS_TVALID ( net_gnd0 ),
      .S4_AXIS_TREADY (  ),
      .M5_AXIS_TLAST (  ),
      .M5_AXIS_TDATA (  ),
      .M5_AXIS_TVALID (  ),
      .M5_AXIS_TREADY ( net_gnd0 ),
      .S5_AXIS_TLAST ( net_gnd0 ),
      .S5_AXIS_TDATA ( net_gnd32[0:31] ),
      .S5_AXIS_TVALID ( net_gnd0 ),
      .S5_AXIS_TREADY (  ),
      .M6_AXIS_TLAST (  ),
      .M6_AXIS_TDATA (  ),
      .M6_AXIS_TVALID (  ),
      .M6_AXIS_TREADY ( net_gnd0 ),
      .S6_AXIS_TLAST ( net_gnd0 ),
      .S6_AXIS_TDATA ( net_gnd32[0:31] ),
      .S6_AXIS_TVALID ( net_gnd0 ),
      .S6_AXIS_TREADY (  ),
      .M7_AXIS_TLAST (  ),
      .M7_AXIS_TDATA (  ),
      .M7_AXIS_TVALID (  ),
      .M7_AXIS_TREADY ( net_gnd0 ),
      .S7_AXIS_TLAST ( net_gnd0 ),
      .S7_AXIS_TDATA ( net_gnd32[0:31] ),
      .S7_AXIS_TVALID ( net_gnd0 ),
      .S7_AXIS_TREADY (  ),
      .M8_AXIS_TLAST (  ),
      .M8_AXIS_TDATA (  ),
      .M8_AXIS_TVALID (  ),
      .M8_AXIS_TREADY ( net_gnd0 ),
      .S8_AXIS_TLAST ( net_gnd0 ),
      .S8_AXIS_TDATA ( net_gnd32[0:31] ),
      .S8_AXIS_TVALID ( net_gnd0 ),
      .S8_AXIS_TREADY (  ),
      .M9_AXIS_TLAST (  ),
      .M9_AXIS_TDATA (  ),
      .M9_AXIS_TVALID (  ),
      .M9_AXIS_TREADY ( net_gnd0 ),
      .S9_AXIS_TLAST ( net_gnd0 ),
      .S9_AXIS_TDATA ( net_gnd32[0:31] ),
      .S9_AXIS_TVALID ( net_gnd0 ),
      .S9_AXIS_TREADY (  ),
      .M10_AXIS_TLAST (  ),
      .M10_AXIS_TDATA (  ),
      .M10_AXIS_TVALID (  ),
      .M10_AXIS_TREADY ( net_gnd0 ),
      .S10_AXIS_TLAST ( net_gnd0 ),
      .S10_AXIS_TDATA ( net_gnd32[0:31] ),
      .S10_AXIS_TVALID ( net_gnd0 ),
      .S10_AXIS_TREADY (  ),
      .M11_AXIS_TLAST (  ),
      .M11_AXIS_TDATA (  ),
      .M11_AXIS_TVALID (  ),
      .M11_AXIS_TREADY ( net_gnd0 ),
      .S11_AXIS_TLAST ( net_gnd0 ),
      .S11_AXIS_TDATA ( net_gnd32[0:31] ),
      .S11_AXIS_TVALID ( net_gnd0 ),
      .S11_AXIS_TREADY (  ),
      .M12_AXIS_TLAST (  ),
      .M12_AXIS_TDATA (  ),
      .M12_AXIS_TVALID (  ),
      .M12_AXIS_TREADY ( net_gnd0 ),
      .S12_AXIS_TLAST ( net_gnd0 ),
      .S12_AXIS_TDATA ( net_gnd32[0:31] ),
      .S12_AXIS_TVALID ( net_gnd0 ),
      .S12_AXIS_TREADY (  ),
      .M13_AXIS_TLAST (  ),
      .M13_AXIS_TDATA (  ),
      .M13_AXIS_TVALID (  ),
      .M13_AXIS_TREADY ( net_gnd0 ),
      .S13_AXIS_TLAST ( net_gnd0 ),
      .S13_AXIS_TDATA ( net_gnd32[0:31] ),
      .S13_AXIS_TVALID ( net_gnd0 ),
      .S13_AXIS_TREADY (  ),
      .M14_AXIS_TLAST (  ),
      .M14_AXIS_TDATA (  ),
      .M14_AXIS_TVALID (  ),
      .M14_AXIS_TREADY ( net_gnd0 ),
      .S14_AXIS_TLAST ( net_gnd0 ),
      .S14_AXIS_TDATA ( net_gnd32[0:31] ),
      .S14_AXIS_TVALID ( net_gnd0 ),
      .S14_AXIS_TREADY (  ),
      .M15_AXIS_TLAST (  ),
      .M15_AXIS_TDATA (  ),
      .M15_AXIS_TVALID (  ),
      .M15_AXIS_TREADY ( net_gnd0 ),
      .S15_AXIS_TLAST ( net_gnd0 ),
      .S15_AXIS_TDATA ( net_gnd32[0:31] ),
      .S15_AXIS_TVALID ( net_gnd0 ),
      .S15_AXIS_TREADY (  ),
      .ICACHE_FSL_IN_CLK (  ),
      .ICACHE_FSL_IN_READ (  ),
      .ICACHE_FSL_IN_DATA ( net_gnd32 ),
      .ICACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .ICACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .ICACHE_FSL_OUT_CLK (  ),
      .ICACHE_FSL_OUT_WRITE (  ),
      .ICACHE_FSL_OUT_DATA (  ),
      .ICACHE_FSL_OUT_CONTROL (  ),
      .ICACHE_FSL_OUT_FULL ( net_gnd0 ),
      .DCACHE_FSL_IN_CLK (  ),
      .DCACHE_FSL_IN_READ (  ),
      .DCACHE_FSL_IN_DATA ( net_gnd32 ),
      .DCACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .DCACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .DCACHE_FSL_OUT_CLK (  ),
      .DCACHE_FSL_OUT_WRITE (  ),
      .DCACHE_FSL_OUT_DATA (  ),
      .DCACHE_FSL_OUT_CONTROL (  ),
      .DCACHE_FSL_OUT_FULL ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_debug_module_0_wrapper
    debug_module_0 (
      .Interrupt (  ),
      .Debug_SYS_Rst ( debug_module_0_Debug_SYS_Rst ),
      .Ext_BRK ( Ext_BRK ),
      .Ext_NM_BRK ( Ext_NM_BRK ),
      .S_AXI_ACLK ( clock_generator_0_CLKOUT0[0] ),
      .S_AXI_ARESETN ( microblaze_0_axi_periph_M_ARESETN[1] ),
      .S_AXI_AWADDR ( microblaze_0_axi_periph_M_AWADDR[63:32] ),
      .S_AXI_AWVALID ( microblaze_0_axi_periph_M_AWVALID[1] ),
      .S_AXI_AWREADY ( microblaze_0_axi_periph_M_AWREADY[1] ),
      .S_AXI_WDATA ( microblaze_0_axi_periph_M_WDATA[63:32] ),
      .S_AXI_WSTRB ( microblaze_0_axi_periph_M_WSTRB[7:4] ),
      .S_AXI_WVALID ( microblaze_0_axi_periph_M_WVALID[1] ),
      .S_AXI_WREADY ( microblaze_0_axi_periph_M_WREADY[1] ),
      .S_AXI_BRESP ( microblaze_0_axi_periph_M_BRESP[3:2] ),
      .S_AXI_BVALID ( microblaze_0_axi_periph_M_BVALID[1] ),
      .S_AXI_BREADY ( microblaze_0_axi_periph_M_BREADY[1] ),
      .S_AXI_ARADDR ( microblaze_0_axi_periph_M_ARADDR[63:32] ),
      .S_AXI_ARVALID ( microblaze_0_axi_periph_M_ARVALID[1] ),
      .S_AXI_ARREADY ( microblaze_0_axi_periph_M_ARREADY[1] ),
      .S_AXI_RDATA ( microblaze_0_axi_periph_M_RDATA[63:32] ),
      .S_AXI_RRESP ( microblaze_0_axi_periph_M_RRESP[3:2] ),
      .S_AXI_RVALID ( microblaze_0_axi_periph_M_RVALID[1] ),
      .S_AXI_RREADY ( microblaze_0_axi_periph_M_RREADY[1] ),
      .SPLB_Clk ( net_gnd0 ),
      .SPLB_Rst ( net_gnd0 ),
      .PLB_ABus ( net_gnd32 ),
      .PLB_UABus ( net_gnd32 ),
      .PLB_PAValid ( net_gnd0 ),
      .PLB_SAValid ( net_gnd0 ),
      .PLB_rdPrim ( net_gnd0 ),
      .PLB_wrPrim ( net_gnd0 ),
      .PLB_masterID ( net_gnd3[2:0] ),
      .PLB_abort ( net_gnd0 ),
      .PLB_busLock ( net_gnd0 ),
      .PLB_RNW ( net_gnd0 ),
      .PLB_BE ( net_gnd4 ),
      .PLB_MSize ( net_gnd2[1:0] ),
      .PLB_size ( net_gnd4 ),
      .PLB_type ( net_gnd3[2:0] ),
      .PLB_lockErr ( net_gnd0 ),
      .PLB_wrDBus ( net_gnd32 ),
      .PLB_wrBurst ( net_gnd0 ),
      .PLB_rdBurst ( net_gnd0 ),
      .PLB_wrPendReq ( net_gnd0 ),
      .PLB_rdPendReq ( net_gnd0 ),
      .PLB_wrPendPri ( net_gnd2[1:0] ),
      .PLB_rdPendPri ( net_gnd2[1:0] ),
      .PLB_reqPri ( net_gnd2[1:0] ),
      .PLB_TAttribute ( net_gnd16 ),
      .Sl_addrAck (  ),
      .Sl_SSize (  ),
      .Sl_wait (  ),
      .Sl_rearbitrate (  ),
      .Sl_wrDAck (  ),
      .Sl_wrComp (  ),
      .Sl_wrBTerm (  ),
      .Sl_rdDBus (  ),
      .Sl_rdWdAddr (  ),
      .Sl_rdDAck (  ),
      .Sl_rdComp (  ),
      .Sl_rdBTerm (  ),
      .Sl_MBusy (  ),
      .Sl_MWrErr (  ),
      .Sl_MRdErr (  ),
      .Sl_MIRQ (  ),
      .Dbg_Clk_0 ( debug_module_0_MBDEBUG_0_Dbg_Clk ),
      .Dbg_TDI_0 ( debug_module_0_MBDEBUG_0_Dbg_TDI ),
      .Dbg_TDO_0 ( debug_module_0_MBDEBUG_0_Dbg_TDO ),
      .Dbg_Reg_En_0 ( debug_module_0_MBDEBUG_0_Dbg_Reg_En ),
      .Dbg_Capture_0 ( debug_module_0_MBDEBUG_0_Dbg_Capture ),
      .Dbg_Shift_0 ( debug_module_0_MBDEBUG_0_Dbg_Shift ),
      .Dbg_Update_0 ( debug_module_0_MBDEBUG_0_Dbg_Update ),
      .Dbg_Rst_0 ( debug_module_0_MBDEBUG_0_Debug_Rst ),
      .Dbg_Clk_1 (  ),
      .Dbg_TDI_1 (  ),
      .Dbg_TDO_1 ( net_gnd0 ),
      .Dbg_Reg_En_1 (  ),
      .Dbg_Capture_1 (  ),
      .Dbg_Shift_1 (  ),
      .Dbg_Update_1 (  ),
      .Dbg_Rst_1 (  ),
      .Dbg_Clk_2 (  ),
      .Dbg_TDI_2 (  ),
      .Dbg_TDO_2 ( net_gnd0 ),
      .Dbg_Reg_En_2 (  ),
      .Dbg_Capture_2 (  ),
      .Dbg_Shift_2 (  ),
      .Dbg_Update_2 (  ),
      .Dbg_Rst_2 (  ),
      .Dbg_Clk_3 (  ),
      .Dbg_TDI_3 (  ),
      .Dbg_TDO_3 ( net_gnd0 ),
      .Dbg_Reg_En_3 (  ),
      .Dbg_Capture_3 (  ),
      .Dbg_Shift_3 (  ),
      .Dbg_Update_3 (  ),
      .Dbg_Rst_3 (  ),
      .Dbg_Clk_4 (  ),
      .Dbg_TDI_4 (  ),
      .Dbg_TDO_4 ( net_gnd0 ),
      .Dbg_Reg_En_4 (  ),
      .Dbg_Capture_4 (  ),
      .Dbg_Shift_4 (  ),
      .Dbg_Update_4 (  ),
      .Dbg_Rst_4 (  ),
      .Dbg_Clk_5 (  ),
      .Dbg_TDI_5 (  ),
      .Dbg_TDO_5 ( net_gnd0 ),
      .Dbg_Reg_En_5 (  ),
      .Dbg_Capture_5 (  ),
      .Dbg_Shift_5 (  ),
      .Dbg_Update_5 (  ),
      .Dbg_Rst_5 (  ),
      .Dbg_Clk_6 (  ),
      .Dbg_TDI_6 (  ),
      .Dbg_TDO_6 ( net_gnd0 ),
      .Dbg_Reg_En_6 (  ),
      .Dbg_Capture_6 (  ),
      .Dbg_Shift_6 (  ),
      .Dbg_Update_6 (  ),
      .Dbg_Rst_6 (  ),
      .Dbg_Clk_7 (  ),
      .Dbg_TDI_7 (  ),
      .Dbg_TDO_7 ( net_gnd0 ),
      .Dbg_Reg_En_7 (  ),
      .Dbg_Capture_7 (  ),
      .Dbg_Shift_7 (  ),
      .Dbg_Update_7 (  ),
      .Dbg_Rst_7 (  ),
      .Dbg_Clk_8 (  ),
      .Dbg_TDI_8 (  ),
      .Dbg_TDO_8 ( net_gnd0 ),
      .Dbg_Reg_En_8 (  ),
      .Dbg_Capture_8 (  ),
      .Dbg_Shift_8 (  ),
      .Dbg_Update_8 (  ),
      .Dbg_Rst_8 (  ),
      .Dbg_Clk_9 (  ),
      .Dbg_TDI_9 (  ),
      .Dbg_TDO_9 ( net_gnd0 ),
      .Dbg_Reg_En_9 (  ),
      .Dbg_Capture_9 (  ),
      .Dbg_Shift_9 (  ),
      .Dbg_Update_9 (  ),
      .Dbg_Rst_9 (  ),
      .Dbg_Clk_10 (  ),
      .Dbg_TDI_10 (  ),
      .Dbg_TDO_10 ( net_gnd0 ),
      .Dbg_Reg_En_10 (  ),
      .Dbg_Capture_10 (  ),
      .Dbg_Shift_10 (  ),
      .Dbg_Update_10 (  ),
      .Dbg_Rst_10 (  ),
      .Dbg_Clk_11 (  ),
      .Dbg_TDI_11 (  ),
      .Dbg_TDO_11 ( net_gnd0 ),
      .Dbg_Reg_En_11 (  ),
      .Dbg_Capture_11 (  ),
      .Dbg_Shift_11 (  ),
      .Dbg_Update_11 (  ),
      .Dbg_Rst_11 (  ),
      .Dbg_Clk_12 (  ),
      .Dbg_TDI_12 (  ),
      .Dbg_TDO_12 ( net_gnd0 ),
      .Dbg_Reg_En_12 (  ),
      .Dbg_Capture_12 (  ),
      .Dbg_Shift_12 (  ),
      .Dbg_Update_12 (  ),
      .Dbg_Rst_12 (  ),
      .Dbg_Clk_13 (  ),
      .Dbg_TDI_13 (  ),
      .Dbg_TDO_13 ( net_gnd0 ),
      .Dbg_Reg_En_13 (  ),
      .Dbg_Capture_13 (  ),
      .Dbg_Shift_13 (  ),
      .Dbg_Update_13 (  ),
      .Dbg_Rst_13 (  ),
      .Dbg_Clk_14 (  ),
      .Dbg_TDI_14 (  ),
      .Dbg_TDO_14 ( net_gnd0 ),
      .Dbg_Reg_En_14 (  ),
      .Dbg_Capture_14 (  ),
      .Dbg_Shift_14 (  ),
      .Dbg_Update_14 (  ),
      .Dbg_Rst_14 (  ),
      .Dbg_Clk_15 (  ),
      .Dbg_TDI_15 (  ),
      .Dbg_TDO_15 ( net_gnd0 ),
      .Dbg_Reg_En_15 (  ),
      .Dbg_Capture_15 (  ),
      .Dbg_Shift_15 (  ),
      .Dbg_Update_15 (  ),
      .Dbg_Rst_15 (  ),
      .Dbg_Clk_16 (  ),
      .Dbg_TDI_16 (  ),
      .Dbg_TDO_16 ( net_gnd0 ),
      .Dbg_Reg_En_16 (  ),
      .Dbg_Capture_16 (  ),
      .Dbg_Shift_16 (  ),
      .Dbg_Update_16 (  ),
      .Dbg_Rst_16 (  ),
      .Dbg_Clk_17 (  ),
      .Dbg_TDI_17 (  ),
      .Dbg_TDO_17 ( net_gnd0 ),
      .Dbg_Reg_En_17 (  ),
      .Dbg_Capture_17 (  ),
      .Dbg_Shift_17 (  ),
      .Dbg_Update_17 (  ),
      .Dbg_Rst_17 (  ),
      .Dbg_Clk_18 (  ),
      .Dbg_TDI_18 (  ),
      .Dbg_TDO_18 ( net_gnd0 ),
      .Dbg_Reg_En_18 (  ),
      .Dbg_Capture_18 (  ),
      .Dbg_Shift_18 (  ),
      .Dbg_Update_18 (  ),
      .Dbg_Rst_18 (  ),
      .Dbg_Clk_19 (  ),
      .Dbg_TDI_19 (  ),
      .Dbg_TDO_19 ( net_gnd0 ),
      .Dbg_Reg_En_19 (  ),
      .Dbg_Capture_19 (  ),
      .Dbg_Shift_19 (  ),
      .Dbg_Update_19 (  ),
      .Dbg_Rst_19 (  ),
      .Dbg_Clk_20 (  ),
      .Dbg_TDI_20 (  ),
      .Dbg_TDO_20 ( net_gnd0 ),
      .Dbg_Reg_En_20 (  ),
      .Dbg_Capture_20 (  ),
      .Dbg_Shift_20 (  ),
      .Dbg_Update_20 (  ),
      .Dbg_Rst_20 (  ),
      .Dbg_Clk_21 (  ),
      .Dbg_TDI_21 (  ),
      .Dbg_TDO_21 ( net_gnd0 ),
      .Dbg_Reg_En_21 (  ),
      .Dbg_Capture_21 (  ),
      .Dbg_Shift_21 (  ),
      .Dbg_Update_21 (  ),
      .Dbg_Rst_21 (  ),
      .Dbg_Clk_22 (  ),
      .Dbg_TDI_22 (  ),
      .Dbg_TDO_22 ( net_gnd0 ),
      .Dbg_Reg_En_22 (  ),
      .Dbg_Capture_22 (  ),
      .Dbg_Shift_22 (  ),
      .Dbg_Update_22 (  ),
      .Dbg_Rst_22 (  ),
      .Dbg_Clk_23 (  ),
      .Dbg_TDI_23 (  ),
      .Dbg_TDO_23 ( net_gnd0 ),
      .Dbg_Reg_En_23 (  ),
      .Dbg_Capture_23 (  ),
      .Dbg_Shift_23 (  ),
      .Dbg_Update_23 (  ),
      .Dbg_Rst_23 (  ),
      .Dbg_Clk_24 (  ),
      .Dbg_TDI_24 (  ),
      .Dbg_TDO_24 ( net_gnd0 ),
      .Dbg_Reg_En_24 (  ),
      .Dbg_Capture_24 (  ),
      .Dbg_Shift_24 (  ),
      .Dbg_Update_24 (  ),
      .Dbg_Rst_24 (  ),
      .Dbg_Clk_25 (  ),
      .Dbg_TDI_25 (  ),
      .Dbg_TDO_25 ( net_gnd0 ),
      .Dbg_Reg_En_25 (  ),
      .Dbg_Capture_25 (  ),
      .Dbg_Shift_25 (  ),
      .Dbg_Update_25 (  ),
      .Dbg_Rst_25 (  ),
      .Dbg_Clk_26 (  ),
      .Dbg_TDI_26 (  ),
      .Dbg_TDO_26 ( net_gnd0 ),
      .Dbg_Reg_En_26 (  ),
      .Dbg_Capture_26 (  ),
      .Dbg_Shift_26 (  ),
      .Dbg_Update_26 (  ),
      .Dbg_Rst_26 (  ),
      .Dbg_Clk_27 (  ),
      .Dbg_TDI_27 (  ),
      .Dbg_TDO_27 ( net_gnd0 ),
      .Dbg_Reg_En_27 (  ),
      .Dbg_Capture_27 (  ),
      .Dbg_Shift_27 (  ),
      .Dbg_Update_27 (  ),
      .Dbg_Rst_27 (  ),
      .Dbg_Clk_28 (  ),
      .Dbg_TDI_28 (  ),
      .Dbg_TDO_28 ( net_gnd0 ),
      .Dbg_Reg_En_28 (  ),
      .Dbg_Capture_28 (  ),
      .Dbg_Shift_28 (  ),
      .Dbg_Update_28 (  ),
      .Dbg_Rst_28 (  ),
      .Dbg_Clk_29 (  ),
      .Dbg_TDI_29 (  ),
      .Dbg_TDO_29 ( net_gnd0 ),
      .Dbg_Reg_En_29 (  ),
      .Dbg_Capture_29 (  ),
      .Dbg_Shift_29 (  ),
      .Dbg_Update_29 (  ),
      .Dbg_Rst_29 (  ),
      .Dbg_Clk_30 (  ),
      .Dbg_TDI_30 (  ),
      .Dbg_TDO_30 ( net_gnd0 ),
      .Dbg_Reg_En_30 (  ),
      .Dbg_Capture_30 (  ),
      .Dbg_Shift_30 (  ),
      .Dbg_Update_30 (  ),
      .Dbg_Rst_30 (  ),
      .Dbg_Clk_31 (  ),
      .Dbg_TDI_31 (  ),
      .Dbg_TDO_31 ( net_gnd0 ),
      .Dbg_Reg_En_31 (  ),
      .Dbg_Capture_31 (  ),
      .Dbg_Shift_31 (  ),
      .Dbg_Update_31 (  ),
      .Dbg_Rst_31 (  ),
      .bscan_tdi (  ),
      .bscan_reset (  ),
      .bscan_shift (  ),
      .bscan_update (  ),
      .bscan_capture (  ),
      .bscan_sel1 (  ),
      .bscan_drck1 (  ),
      .bscan_tdo1 ( net_gnd0 ),
      .bscan_ext_tdi ( net_gnd0 ),
      .bscan_ext_reset ( net_gnd0 ),
      .bscan_ext_shift ( net_gnd0 ),
      .bscan_ext_update ( net_gnd0 ),
      .bscan_ext_capture ( net_gnd0 ),
      .bscan_ext_sel ( net_gnd0 ),
      .bscan_ext_drck ( net_gnd0 ),
      .bscan_ext_tdo (  ),
      .Ext_JTAG_DRCK (  ),
      .Ext_JTAG_RESET (  ),
      .Ext_JTAG_SEL (  ),
      .Ext_JTAG_CAPTURE (  ),
      .Ext_JTAG_SHIFT (  ),
      .Ext_JTAG_UPDATE (  ),
      .Ext_JTAG_TDI (  ),
      .Ext_JTAG_TDO ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_clock_generator_0_wrapper
    clock_generator_0 (
      .CLKIN ( processing_system7_0_FCLK_CLK0 ),
      .CLKOUT0 ( clock_generator_0_CLKOUT0[0] ),
      .CLKOUT1 (  ),
      .CLKOUT2 (  ),
      .CLKOUT3 (  ),
      .CLKOUT4 (  ),
      .CLKOUT5 (  ),
      .CLKOUT6 (  ),
      .CLKOUT7 (  ),
      .CLKOUT8 (  ),
      .CLKOUT9 (  ),
      .CLKOUT10 (  ),
      .CLKOUT11 (  ),
      .CLKOUT12 (  ),
      .CLKOUT13 (  ),
      .CLKOUT14 (  ),
      .CLKOUT15 (  ),
      .CLKFBIN ( net_gnd0 ),
      .CLKFBOUT (  ),
      .PSCLK ( net_gnd0 ),
      .PSEN ( net_gnd0 ),
      .PSINCDEC ( net_gnd0 ),
      .PSDONE (  ),
      .RST ( RESET ),
      .LOCKED ( clock_generator_0_LOCKED )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_bram_block_0_wrapper
    bram_block_0 (
      .BRAM_Rst_A ( bram_cntlr_instruction_porta_BRAM_Rst ),
      .BRAM_Clk_A ( bram_cntlr_instruction_porta_BRAM_Clk ),
      .BRAM_EN_A ( bram_cntlr_instruction_porta_BRAM_EN ),
      .BRAM_WEN_A ( bram_cntlr_instruction_porta_BRAM_WEN ),
      .BRAM_Addr_A ( bram_cntlr_instruction_porta_BRAM_Addr ),
      .BRAM_Din_A ( bram_cntlr_instruction_porta_BRAM_Din ),
      .BRAM_Dout_A ( bram_cntlr_instruction_porta_BRAM_Dout ),
      .BRAM_Rst_B ( bram_cntlr_data_portb_BRAM_Rst ),
      .BRAM_Clk_B ( bram_cntlr_data_portb_BRAM_Clk ),
      .BRAM_EN_B ( bram_cntlr_data_portb_BRAM_EN ),
      .BRAM_WEN_B ( bram_cntlr_data_portb_BRAM_WEN ),
      .BRAM_Addr_B ( bram_cntlr_data_portb_BRAM_Addr ),
      .BRAM_Din_B ( bram_cntlr_data_portb_BRAM_Din ),
      .BRAM_Dout_B ( bram_cntlr_data_portb_BRAM_Dout )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_bram_cntlr_instruction_wrapper
    bram_cntlr_instruction (
      .LMB_Clk ( clock_generator_0_CLKOUT0[0] ),
      .LMB_Rst ( lmb_v10_0_LMB_Rst ),
      .LMB_ABus ( lmb_v10_0_LMB_ABus ),
      .LMB_WriteDBus ( lmb_v10_0_LMB_WriteDBus ),
      .LMB_AddrStrobe ( lmb_v10_0_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( lmb_v10_0_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( lmb_v10_0_LMB_WriteStrobe ),
      .LMB_BE ( lmb_v10_0_LMB_BE ),
      .Sl_DBus ( lmb_v10_0_Sl_DBus ),
      .Sl_Ready ( lmb_v10_0_Sl_Ready[0] ),
      .Sl_Wait ( lmb_v10_0_Sl_Wait[0] ),
      .Sl_UE ( lmb_v10_0_Sl_UE[0] ),
      .Sl_CE ( lmb_v10_0_Sl_CE[0] ),
      .LMB1_ABus ( net_gnd32 ),
      .LMB1_WriteDBus ( net_gnd32 ),
      .LMB1_AddrStrobe ( net_gnd0 ),
      .LMB1_ReadStrobe ( net_gnd0 ),
      .LMB1_WriteStrobe ( net_gnd0 ),
      .LMB1_BE ( net_gnd4 ),
      .Sl1_DBus (  ),
      .Sl1_Ready (  ),
      .Sl1_Wait (  ),
      .Sl1_UE (  ),
      .Sl1_CE (  ),
      .LMB2_ABus ( net_gnd32 ),
      .LMB2_WriteDBus ( net_gnd32 ),
      .LMB2_AddrStrobe ( net_gnd0 ),
      .LMB2_ReadStrobe ( net_gnd0 ),
      .LMB2_WriteStrobe ( net_gnd0 ),
      .LMB2_BE ( net_gnd4 ),
      .Sl2_DBus (  ),
      .Sl2_Ready (  ),
      .Sl2_Wait (  ),
      .Sl2_UE (  ),
      .Sl2_CE (  ),
      .LMB3_ABus ( net_gnd32 ),
      .LMB3_WriteDBus ( net_gnd32 ),
      .LMB3_AddrStrobe ( net_gnd0 ),
      .LMB3_ReadStrobe ( net_gnd0 ),
      .LMB3_WriteStrobe ( net_gnd0 ),
      .LMB3_BE ( net_gnd4 ),
      .Sl3_DBus (  ),
      .Sl3_Ready (  ),
      .Sl3_Wait (  ),
      .Sl3_UE (  ),
      .Sl3_CE (  ),
      .BRAM_Rst_A ( bram_cntlr_instruction_porta_BRAM_Rst ),
      .BRAM_Clk_A ( bram_cntlr_instruction_porta_BRAM_Clk ),
      .BRAM_EN_A ( bram_cntlr_instruction_porta_BRAM_EN ),
      .BRAM_WEN_A ( bram_cntlr_instruction_porta_BRAM_WEN ),
      .BRAM_Addr_A ( bram_cntlr_instruction_porta_BRAM_Addr ),
      .BRAM_Din_A ( bram_cntlr_instruction_porta_BRAM_Din ),
      .BRAM_Dout_A ( bram_cntlr_instruction_porta_BRAM_Dout ),
      .Interrupt (  ),
      .UE (  ),
      .CE (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3[2:0] ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_bram_cntlr_data_wrapper
    bram_cntlr_data (
      .LMB_Clk ( clock_generator_0_CLKOUT0[0] ),
      .LMB_Rst ( lmb_v10_1_LMB_Rst ),
      .LMB_ABus ( lmb_v10_1_LMB_ABus ),
      .LMB_WriteDBus ( lmb_v10_1_LMB_WriteDBus ),
      .LMB_AddrStrobe ( lmb_v10_1_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( lmb_v10_1_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( lmb_v10_1_LMB_WriteStrobe ),
      .LMB_BE ( lmb_v10_1_LMB_BE ),
      .Sl_DBus ( lmb_v10_1_Sl_DBus ),
      .Sl_Ready ( lmb_v10_1_Sl_Ready[0] ),
      .Sl_Wait ( lmb_v10_1_Sl_Wait[0] ),
      .Sl_UE ( lmb_v10_1_Sl_UE[0] ),
      .Sl_CE ( lmb_v10_1_Sl_CE[0] ),
      .LMB1_ABus ( net_gnd32 ),
      .LMB1_WriteDBus ( net_gnd32 ),
      .LMB1_AddrStrobe ( net_gnd0 ),
      .LMB1_ReadStrobe ( net_gnd0 ),
      .LMB1_WriteStrobe ( net_gnd0 ),
      .LMB1_BE ( net_gnd4 ),
      .Sl1_DBus (  ),
      .Sl1_Ready (  ),
      .Sl1_Wait (  ),
      .Sl1_UE (  ),
      .Sl1_CE (  ),
      .LMB2_ABus ( net_gnd32 ),
      .LMB2_WriteDBus ( net_gnd32 ),
      .LMB2_AddrStrobe ( net_gnd0 ),
      .LMB2_ReadStrobe ( net_gnd0 ),
      .LMB2_WriteStrobe ( net_gnd0 ),
      .LMB2_BE ( net_gnd4 ),
      .Sl2_DBus (  ),
      .Sl2_Ready (  ),
      .Sl2_Wait (  ),
      .Sl2_UE (  ),
      .Sl2_CE (  ),
      .LMB3_ABus ( net_gnd32 ),
      .LMB3_WriteDBus ( net_gnd32 ),
      .LMB3_AddrStrobe ( net_gnd0 ),
      .LMB3_ReadStrobe ( net_gnd0 ),
      .LMB3_WriteStrobe ( net_gnd0 ),
      .LMB3_BE ( net_gnd4 ),
      .Sl3_DBus (  ),
      .Sl3_Ready (  ),
      .Sl3_Wait (  ),
      .Sl3_UE (  ),
      .Sl3_CE (  ),
      .BRAM_Rst_A ( bram_cntlr_data_portb_BRAM_Rst ),
      .BRAM_Clk_A ( bram_cntlr_data_portb_BRAM_Clk ),
      .BRAM_EN_A ( bram_cntlr_data_portb_BRAM_EN ),
      .BRAM_WEN_A ( bram_cntlr_data_portb_BRAM_WEN ),
      .BRAM_Addr_A ( bram_cntlr_data_portb_BRAM_Addr ),
      .BRAM_Din_A ( bram_cntlr_data_portb_BRAM_Din ),
      .BRAM_Dout_A ( bram_cntlr_data_portb_BRAM_Dout ),
      .Interrupt (  ),
      .UE (  ),
      .CE (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3[2:0] ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_lmb_v10_0_wrapper
    lmb_v10_0 (
      .LMB_Clk ( clock_generator_0_CLKOUT0[0] ),
      .SYS_Rst ( microblaze_0_reset_Bus_Struct_Reset[0] ),
      .LMB_Rst ( lmb_v10_0_LMB_Rst ),
      .M_ABus ( lmb_v10_0_M_ABus ),
      .M_ReadStrobe ( lmb_v10_0_M_ReadStrobe ),
      .M_WriteStrobe ( net_gnd0 ),
      .M_AddrStrobe ( lmb_v10_0_M_AddrStrobe ),
      .M_DBus ( net_gnd32 ),
      .M_BE ( net_gnd4 ),
      .Sl_DBus ( lmb_v10_0_Sl_DBus ),
      .Sl_Ready ( lmb_v10_0_Sl_Ready[0:0] ),
      .Sl_Wait ( lmb_v10_0_Sl_Wait[0:0] ),
      .Sl_UE ( lmb_v10_0_Sl_UE[0:0] ),
      .Sl_CE ( lmb_v10_0_Sl_CE[0:0] ),
      .LMB_ABus ( lmb_v10_0_LMB_ABus ),
      .LMB_ReadStrobe ( lmb_v10_0_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( lmb_v10_0_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( lmb_v10_0_LMB_AddrStrobe ),
      .LMB_ReadDBus ( lmb_v10_0_LMB_ReadDBus ),
      .LMB_WriteDBus ( lmb_v10_0_LMB_WriteDBus ),
      .LMB_Ready ( lmb_v10_0_LMB_Ready ),
      .LMB_Wait ( lmb_v10_0_LMB_Wait ),
      .LMB_UE ( lmb_v10_0_LMB_UE ),
      .LMB_CE ( lmb_v10_0_LMB_CE ),
      .LMB_BE ( lmb_v10_0_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_lmb_v10_1_wrapper
    lmb_v10_1 (
      .LMB_Clk ( clock_generator_0_CLKOUT0[0] ),
      .SYS_Rst ( microblaze_0_reset_Bus_Struct_Reset[0] ),
      .LMB_Rst ( lmb_v10_1_LMB_Rst ),
      .M_ABus ( lmb_v10_1_M_ABus ),
      .M_ReadStrobe ( lmb_v10_1_M_ReadStrobe ),
      .M_WriteStrobe ( lmb_v10_1_M_WriteStrobe ),
      .M_AddrStrobe ( lmb_v10_1_M_AddrStrobe ),
      .M_DBus ( lmb_v10_1_M_DBus ),
      .M_BE ( lmb_v10_1_M_BE ),
      .Sl_DBus ( lmb_v10_1_Sl_DBus ),
      .Sl_Ready ( lmb_v10_1_Sl_Ready[0:0] ),
      .Sl_Wait ( lmb_v10_1_Sl_Wait[0:0] ),
      .Sl_UE ( lmb_v10_1_Sl_UE[0:0] ),
      .Sl_CE ( lmb_v10_1_Sl_CE[0:0] ),
      .LMB_ABus ( lmb_v10_1_LMB_ABus ),
      .LMB_ReadStrobe ( lmb_v10_1_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( lmb_v10_1_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( lmb_v10_1_LMB_AddrStrobe ),
      .LMB_ReadDBus ( lmb_v10_1_LMB_ReadDBus ),
      .LMB_WriteDBus ( lmb_v10_1_LMB_WriteDBus ),
      .LMB_Ready ( lmb_v10_1_LMB_Ready ),
      .LMB_Wait ( lmb_v10_1_LMB_Wait ),
      .LMB_UE ( lmb_v10_1_LMB_UE ),
      .LMB_CE ( lmb_v10_1_LMB_CE ),
      .LMB_BE ( lmb_v10_1_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_fsl_i2s_0_wrapper
    fsl_i2s_0 (
      .FSL_Clk ( net_gnd0 ),
      .FSL_Rst ( net_gnd0 ),
      .FSL_S_Clk ( net_gnd0 ),
      .FSL_S_Read (  ),
      .FSL_S_Data ( net_gnd32 ),
      .FSL_S_Control ( net_gnd0 ),
      .FSL_S_Exists ( net_gnd0 ),
      .FSL_M_Clk ( net_gnd0 ),
      .FSL_M_Write ( fsl_v20_0_i2s_mb0_FSL_M_Write ),
      .FSL_M_Data ( fsl_v20_0_i2s_mb0_FSL_M_Data ),
      .FSL_M_Control ( fsl_v20_0_i2s_mb0_FSL_M_Control ),
      .FSL_M_Full ( fsl_v20_0_i2s_mb0_FSL_M_Full ),
      .i2s_bck ( net_fsl_i2s_0_i2s_bck_pin ),
      .i2s_lrck ( net_fsl_i2s_0_i2s_lrck_pin ),
      .i2s_dati ( net_fsl_i2s_0_i2s_dati_pin )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_fsl_v20_0_i2s_mb0_wrapper
    fsl_v20_0_i2s_mb0 (
      .FSL_Clk ( net_gnd0 ),
      .SYS_Rst ( microblaze_0_reset_Bus_Struct_Reset[0] ),
      .FSL_Rst (  ),
      .FSL_M_Clk ( net_fsl_i2s_0_i2s_bck_pin ),
      .FSL_M_Data ( fsl_v20_0_i2s_mb0_FSL_M_Data ),
      .FSL_M_Control ( fsl_v20_0_i2s_mb0_FSL_M_Control ),
      .FSL_M_Write ( fsl_v20_0_i2s_mb0_FSL_M_Write ),
      .FSL_M_Full ( fsl_v20_0_i2s_mb0_FSL_M_Full ),
      .FSL_S_Clk ( clock_generator_0_CLKOUT0[0] ),
      .FSL_S_Data ( fsl_v20_0_i2s_mb0_FSL_S_Data ),
      .FSL_S_Control ( fsl_v20_0_i2s_mb0_FSL_S_Control ),
      .FSL_S_Read ( fsl_v20_0_i2s_mb0_FSL_S_Read ),
      .FSL_S_Exists ( fsl_v20_0_i2s_mb0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_fsl_v20_1_i2s_mb0_wrapper
    fsl_v20_1_i2s_mb0 (
      .FSL_Clk ( net_gnd0 ),
      .SYS_Rst ( microblaze_0_reset_Bus_Struct_Reset[0] ),
      .FSL_Rst (  ),
      .FSL_M_Clk ( net_fsl_i2s_1_i2s_bck_pin ),
      .FSL_M_Data ( fsl_v20_1_i2s_mb0_FSL_M_Data ),
      .FSL_M_Control ( fsl_v20_1_i2s_mb0_FSL_M_Control ),
      .FSL_M_Write ( fsl_v20_1_i2s_mb0_FSL_M_Write ),
      .FSL_M_Full ( fsl_v20_1_i2s_mb0_FSL_M_Full ),
      .FSL_S_Clk ( clock_generator_0_CLKOUT0[0] ),
      .FSL_S_Data ( fsl_v20_1_i2s_mb0_FSL_S_Data ),
      .FSL_S_Control ( fsl_v20_1_i2s_mb0_FSL_S_Control ),
      .FSL_S_Read ( fsl_v20_1_i2s_mb0_FSL_S_Read ),
      .FSL_S_Exists ( fsl_v20_1_i2s_mb0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  SensorMP_fsl_i2s_1_wrapper
    fsl_i2s_1 (
      .FSL_Clk ( net_gnd0 ),
      .FSL_Rst ( net_gnd0 ),
      .FSL_S_Clk ( net_gnd0 ),
      .FSL_S_Read (  ),
      .FSL_S_Data ( net_gnd32 ),
      .FSL_S_Control ( net_gnd0 ),
      .FSL_S_Exists ( net_gnd0 ),
      .FSL_M_Clk ( net_gnd0 ),
      .FSL_M_Write ( fsl_v20_1_i2s_mb0_FSL_M_Write ),
      .FSL_M_Data ( fsl_v20_1_i2s_mb0_FSL_M_Data ),
      .FSL_M_Control ( fsl_v20_1_i2s_mb0_FSL_M_Control ),
      .FSL_M_Full ( fsl_v20_1_i2s_mb0_FSL_M_Full ),
      .i2s_bck ( net_fsl_i2s_1_i2s_bck_pin ),
      .i2s_lrck ( net_fsl_i2s_1_i2s_lrck_pin ),
      .i2s_dati ( net_fsl_i2s_1_i2s_dati_pin )
    );

endmodule

module SensorMP_processing_system7_0_wrapper
  (
    CAN0_PHY_TX,
    CAN0_PHY_RX,
    CAN1_PHY_TX,
    CAN1_PHY_RX,
    ENET0_GMII_TX_EN,
    ENET0_GMII_TX_ER,
    ENET0_MDIO_MDC,
    ENET0_MDIO_O,
    ENET0_MDIO_T,
    ENET0_PTP_DELAY_REQ_RX,
    ENET0_PTP_DELAY_REQ_TX,
    ENET0_PTP_PDELAY_REQ_RX,
    ENET0_PTP_PDELAY_REQ_TX,
    ENET0_PTP_PDELAY_RESP_RX,
    ENET0_PTP_PDELAY_RESP_TX,
    ENET0_PTP_SYNC_FRAME_RX,
    ENET0_PTP_SYNC_FRAME_TX,
    ENET0_SOF_RX,
    ENET0_SOF_TX,
    ENET0_GMII_TXD,
    ENET0_GMII_COL,
    ENET0_GMII_CRS,
    ENET0_EXT_INTIN,
    ENET0_GMII_RX_CLK,
    ENET0_GMII_RX_DV,
    ENET0_GMII_RX_ER,
    ENET0_GMII_TX_CLK,
    ENET0_MDIO_I,
    ENET0_GMII_RXD,
    ENET1_GMII_TX_EN,
    ENET1_GMII_TX_ER,
    ENET1_MDIO_MDC,
    ENET1_MDIO_O,
    ENET1_MDIO_T,
    ENET1_PTP_DELAY_REQ_RX,
    ENET1_PTP_DELAY_REQ_TX,
    ENET1_PTP_PDELAY_REQ_RX,
    ENET1_PTP_PDELAY_REQ_TX,
    ENET1_PTP_PDELAY_RESP_RX,
    ENET1_PTP_PDELAY_RESP_TX,
    ENET1_PTP_SYNC_FRAME_RX,
    ENET1_PTP_SYNC_FRAME_TX,
    ENET1_SOF_RX,
    ENET1_SOF_TX,
    ENET1_GMII_TXD,
    ENET1_GMII_COL,
    ENET1_GMII_CRS,
    ENET1_EXT_INTIN,
    ENET1_GMII_RX_CLK,
    ENET1_GMII_RX_DV,
    ENET1_GMII_RX_ER,
    ENET1_GMII_TX_CLK,
    ENET1_MDIO_I,
    ENET1_GMII_RXD,
    GPIO_I,
    GPIO_O,
    GPIO_T,
    I2C0_SDA_I,
    I2C0_SDA_O,
    I2C0_SDA_T,
    I2C0_SCL_I,
    I2C0_SCL_O,
    I2C0_SCL_T,
    I2C1_SDA_I,
    I2C1_SDA_O,
    I2C1_SDA_T,
    I2C1_SCL_I,
    I2C1_SCL_O,
    I2C1_SCL_T,
    PJTAG_TCK,
    PJTAG_TMS,
    PJTAG_TD_I,
    PJTAG_TD_T,
    PJTAG_TD_O,
    SDIO0_CLK,
    SDIO0_CLK_FB,
    SDIO0_CMD_O,
    SDIO0_CMD_I,
    SDIO0_CMD_T,
    SDIO0_DATA_I,
    SDIO0_DATA_O,
    SDIO0_DATA_T,
    SDIO0_LED,
    SDIO0_CDN,
    SDIO0_WP,
    SDIO0_BUSPOW,
    SDIO0_BUSVOLT,
    SDIO1_CLK,
    SDIO1_CLK_FB,
    SDIO1_CMD_O,
    SDIO1_CMD_I,
    SDIO1_CMD_T,
    SDIO1_DATA_I,
    SDIO1_DATA_O,
    SDIO1_DATA_T,
    SDIO1_LED,
    SDIO1_CDN,
    SDIO1_WP,
    SDIO1_BUSPOW,
    SDIO1_BUSVOLT,
    SPI0_SCLK_I,
    SPI0_SCLK_O,
    SPI0_SCLK_T,
    SPI0_MOSI_I,
    SPI0_MOSI_O,
    SPI0_MOSI_T,
    SPI0_MISO_I,
    SPI0_MISO_O,
    SPI0_MISO_T,
    SPI0_SS_I,
    SPI0_SS_O,
    SPI0_SS1_O,
    SPI0_SS2_O,
    SPI0_SS_T,
    SPI1_SCLK_I,
    SPI1_SCLK_O,
    SPI1_SCLK_T,
    SPI1_MOSI_I,
    SPI1_MOSI_O,
    SPI1_MOSI_T,
    SPI1_MISO_I,
    SPI1_MISO_O,
    SPI1_MISO_T,
    SPI1_SS_I,
    SPI1_SS_O,
    SPI1_SS1_O,
    SPI1_SS2_O,
    SPI1_SS_T,
    UART0_DTRN,
    UART0_RTSN,
    UART0_TX,
    UART0_CTSN,
    UART0_DCDN,
    UART0_DSRN,
    UART0_RIN,
    UART0_RX,
    UART1_DTRN,
    UART1_RTSN,
    UART1_TX,
    UART1_CTSN,
    UART1_DCDN,
    UART1_DSRN,
    UART1_RIN,
    UART1_RX,
    TTC0_WAVE0_OUT,
    TTC0_WAVE1_OUT,
    TTC0_WAVE2_OUT,
    TTC0_CLK0_IN,
    TTC0_CLK1_IN,
    TTC0_CLK2_IN,
    TTC1_WAVE0_OUT,
    TTC1_WAVE1_OUT,
    TTC1_WAVE2_OUT,
    TTC1_CLK0_IN,
    TTC1_CLK1_IN,
    TTC1_CLK2_IN,
    WDT_CLK_IN,
    WDT_RST_OUT,
    TRACE_CLK,
    TRACE_CTL,
    TRACE_DATA,
    USB0_PORT_INDCTL,
    USB1_PORT_INDCTL,
    USB0_VBUS_PWRSELECT,
    USB1_VBUS_PWRSELECT,
    USB0_VBUS_PWRFAULT,
    USB1_VBUS_PWRFAULT,
    SRAM_INTIN,
    M_AXI_GP0_ARESETN,
    M_AXI_GP0_ARVALID,
    M_AXI_GP0_AWVALID,
    M_AXI_GP0_BREADY,
    M_AXI_GP0_RREADY,
    M_AXI_GP0_WLAST,
    M_AXI_GP0_WVALID,
    M_AXI_GP0_ARID,
    M_AXI_GP0_AWID,
    M_AXI_GP0_WID,
    M_AXI_GP0_ARBURST,
    M_AXI_GP0_ARLOCK,
    M_AXI_GP0_ARSIZE,
    M_AXI_GP0_AWBURST,
    M_AXI_GP0_AWLOCK,
    M_AXI_GP0_AWSIZE,
    M_AXI_GP0_ARPROT,
    M_AXI_GP0_AWPROT,
    M_AXI_GP0_ARADDR,
    M_AXI_GP0_AWADDR,
    M_AXI_GP0_WDATA,
    M_AXI_GP0_ARCACHE,
    M_AXI_GP0_ARLEN,
    M_AXI_GP0_ARQOS,
    M_AXI_GP0_AWCACHE,
    M_AXI_GP0_AWLEN,
    M_AXI_GP0_AWQOS,
    M_AXI_GP0_WSTRB,
    M_AXI_GP0_ACLK,
    M_AXI_GP0_ARREADY,
    M_AXI_GP0_AWREADY,
    M_AXI_GP0_BVALID,
    M_AXI_GP0_RLAST,
    M_AXI_GP0_RVALID,
    M_AXI_GP0_WREADY,
    M_AXI_GP0_BID,
    M_AXI_GP0_RID,
    M_AXI_GP0_BRESP,
    M_AXI_GP0_RRESP,
    M_AXI_GP0_RDATA,
    M_AXI_GP1_ARESETN,
    M_AXI_GP1_ARVALID,
    M_AXI_GP1_AWVALID,
    M_AXI_GP1_BREADY,
    M_AXI_GP1_RREADY,
    M_AXI_GP1_WLAST,
    M_AXI_GP1_WVALID,
    M_AXI_GP1_ARID,
    M_AXI_GP1_AWID,
    M_AXI_GP1_WID,
    M_AXI_GP1_ARBURST,
    M_AXI_GP1_ARLOCK,
    M_AXI_GP1_ARSIZE,
    M_AXI_GP1_AWBURST,
    M_AXI_GP1_AWLOCK,
    M_AXI_GP1_AWSIZE,
    M_AXI_GP1_ARPROT,
    M_AXI_GP1_AWPROT,
    M_AXI_GP1_ARADDR,
    M_AXI_GP1_AWADDR,
    M_AXI_GP1_WDATA,
    M_AXI_GP1_ARCACHE,
    M_AXI_GP1_ARLEN,
    M_AXI_GP1_ARQOS,
    M_AXI_GP1_AWCACHE,
    M_AXI_GP1_AWLEN,
    M_AXI_GP1_AWQOS,
    M_AXI_GP1_WSTRB,
    M_AXI_GP1_ACLK,
    M_AXI_GP1_ARREADY,
    M_AXI_GP1_AWREADY,
    M_AXI_GP1_BVALID,
    M_AXI_GP1_RLAST,
    M_AXI_GP1_RVALID,
    M_AXI_GP1_WREADY,
    M_AXI_GP1_BID,
    M_AXI_GP1_RID,
    M_AXI_GP1_BRESP,
    M_AXI_GP1_RRESP,
    M_AXI_GP1_RDATA,
    S_AXI_GP0_ARESETN,
    S_AXI_GP0_ARREADY,
    S_AXI_GP0_AWREADY,
    S_AXI_GP0_BVALID,
    S_AXI_GP0_RLAST,
    S_AXI_GP0_RVALID,
    S_AXI_GP0_WREADY,
    S_AXI_GP0_BRESP,
    S_AXI_GP0_RRESP,
    S_AXI_GP0_RDATA,
    S_AXI_GP0_BID,
    S_AXI_GP0_RID,
    S_AXI_GP0_ACLK,
    S_AXI_GP0_ARVALID,
    S_AXI_GP0_AWVALID,
    S_AXI_GP0_BREADY,
    S_AXI_GP0_RREADY,
    S_AXI_GP0_WLAST,
    S_AXI_GP0_WVALID,
    S_AXI_GP0_ARBURST,
    S_AXI_GP0_ARLOCK,
    S_AXI_GP0_ARSIZE,
    S_AXI_GP0_AWBURST,
    S_AXI_GP0_AWLOCK,
    S_AXI_GP0_AWSIZE,
    S_AXI_GP0_ARPROT,
    S_AXI_GP0_AWPROT,
    S_AXI_GP0_ARADDR,
    S_AXI_GP0_AWADDR,
    S_AXI_GP0_WDATA,
    S_AXI_GP0_ARCACHE,
    S_AXI_GP0_ARLEN,
    S_AXI_GP0_ARQOS,
    S_AXI_GP0_AWCACHE,
    S_AXI_GP0_AWLEN,
    S_AXI_GP0_AWQOS,
    S_AXI_GP0_WSTRB,
    S_AXI_GP0_ARID,
    S_AXI_GP0_AWID,
    S_AXI_GP0_WID,
    S_AXI_GP1_ARESETN,
    S_AXI_GP1_ARREADY,
    S_AXI_GP1_AWREADY,
    S_AXI_GP1_BVALID,
    S_AXI_GP1_RLAST,
    S_AXI_GP1_RVALID,
    S_AXI_GP1_WREADY,
    S_AXI_GP1_BRESP,
    S_AXI_GP1_RRESP,
    S_AXI_GP1_RDATA,
    S_AXI_GP1_BID,
    S_AXI_GP1_RID,
    S_AXI_GP1_ACLK,
    S_AXI_GP1_ARVALID,
    S_AXI_GP1_AWVALID,
    S_AXI_GP1_BREADY,
    S_AXI_GP1_RREADY,
    S_AXI_GP1_WLAST,
    S_AXI_GP1_WVALID,
    S_AXI_GP1_ARBURST,
    S_AXI_GP1_ARLOCK,
    S_AXI_GP1_ARSIZE,
    S_AXI_GP1_AWBURST,
    S_AXI_GP1_AWLOCK,
    S_AXI_GP1_AWSIZE,
    S_AXI_GP1_ARPROT,
    S_AXI_GP1_AWPROT,
    S_AXI_GP1_ARADDR,
    S_AXI_GP1_AWADDR,
    S_AXI_GP1_WDATA,
    S_AXI_GP1_ARCACHE,
    S_AXI_GP1_ARLEN,
    S_AXI_GP1_ARQOS,
    S_AXI_GP1_AWCACHE,
    S_AXI_GP1_AWLEN,
    S_AXI_GP1_AWQOS,
    S_AXI_GP1_WSTRB,
    S_AXI_GP1_ARID,
    S_AXI_GP1_AWID,
    S_AXI_GP1_WID,
    S_AXI_ACP_ARESETN,
    S_AXI_ACP_AWREADY,
    S_AXI_ACP_ARREADY,
    S_AXI_ACP_BVALID,
    S_AXI_ACP_RLAST,
    S_AXI_ACP_RVALID,
    S_AXI_ACP_WREADY,
    S_AXI_ACP_BRESP,
    S_AXI_ACP_RRESP,
    S_AXI_ACP_BID,
    S_AXI_ACP_RID,
    S_AXI_ACP_RDATA,
    S_AXI_ACP_ACLK,
    S_AXI_ACP_ARVALID,
    S_AXI_ACP_AWVALID,
    S_AXI_ACP_BREADY,
    S_AXI_ACP_RREADY,
    S_AXI_ACP_WLAST,
    S_AXI_ACP_WVALID,
    S_AXI_ACP_ARID,
    S_AXI_ACP_ARPROT,
    S_AXI_ACP_AWID,
    S_AXI_ACP_AWPROT,
    S_AXI_ACP_WID,
    S_AXI_ACP_ARADDR,
    S_AXI_ACP_AWADDR,
    S_AXI_ACP_ARCACHE,
    S_AXI_ACP_ARLEN,
    S_AXI_ACP_ARQOS,
    S_AXI_ACP_AWCACHE,
    S_AXI_ACP_AWLEN,
    S_AXI_ACP_AWQOS,
    S_AXI_ACP_ARBURST,
    S_AXI_ACP_ARLOCK,
    S_AXI_ACP_ARSIZE,
    S_AXI_ACP_AWBURST,
    S_AXI_ACP_AWLOCK,
    S_AXI_ACP_AWSIZE,
    S_AXI_ACP_ARUSER,
    S_AXI_ACP_AWUSER,
    S_AXI_ACP_WDATA,
    S_AXI_ACP_WSTRB,
    S_AXI_HP0_ARESETN,
    S_AXI_HP0_ARREADY,
    S_AXI_HP0_AWREADY,
    S_AXI_HP0_BVALID,
    S_AXI_HP0_RLAST,
    S_AXI_HP0_RVALID,
    S_AXI_HP0_WREADY,
    S_AXI_HP0_BRESP,
    S_AXI_HP0_RRESP,
    S_AXI_HP0_BID,
    S_AXI_HP0_RID,
    S_AXI_HP0_RDATA,
    S_AXI_HP0_RCOUNT,
    S_AXI_HP0_WCOUNT,
    S_AXI_HP0_RACOUNT,
    S_AXI_HP0_WACOUNT,
    S_AXI_HP0_ACLK,
    S_AXI_HP0_ARVALID,
    S_AXI_HP0_AWVALID,
    S_AXI_HP0_BREADY,
    S_AXI_HP0_RDISSUECAP1_EN,
    S_AXI_HP0_RREADY,
    S_AXI_HP0_WLAST,
    S_AXI_HP0_WRISSUECAP1_EN,
    S_AXI_HP0_WVALID,
    S_AXI_HP0_ARBURST,
    S_AXI_HP0_ARLOCK,
    S_AXI_HP0_ARSIZE,
    S_AXI_HP0_AWBURST,
    S_AXI_HP0_AWLOCK,
    S_AXI_HP0_AWSIZE,
    S_AXI_HP0_ARPROT,
    S_AXI_HP0_AWPROT,
    S_AXI_HP0_ARADDR,
    S_AXI_HP0_AWADDR,
    S_AXI_HP0_ARCACHE,
    S_AXI_HP0_ARLEN,
    S_AXI_HP0_ARQOS,
    S_AXI_HP0_AWCACHE,
    S_AXI_HP0_AWLEN,
    S_AXI_HP0_AWQOS,
    S_AXI_HP0_ARID,
    S_AXI_HP0_AWID,
    S_AXI_HP0_WID,
    S_AXI_HP0_WDATA,
    S_AXI_HP0_WSTRB,
    S_AXI_HP1_ARESETN,
    S_AXI_HP1_ARREADY,
    S_AXI_HP1_AWREADY,
    S_AXI_HP1_BVALID,
    S_AXI_HP1_RLAST,
    S_AXI_HP1_RVALID,
    S_AXI_HP1_WREADY,
    S_AXI_HP1_BRESP,
    S_AXI_HP1_RRESP,
    S_AXI_HP1_BID,
    S_AXI_HP1_RID,
    S_AXI_HP1_RDATA,
    S_AXI_HP1_RCOUNT,
    S_AXI_HP1_WCOUNT,
    S_AXI_HP1_RACOUNT,
    S_AXI_HP1_WACOUNT,
    S_AXI_HP1_ACLK,
    S_AXI_HP1_ARVALID,
    S_AXI_HP1_AWVALID,
    S_AXI_HP1_BREADY,
    S_AXI_HP1_RDISSUECAP1_EN,
    S_AXI_HP1_RREADY,
    S_AXI_HP1_WLAST,
    S_AXI_HP1_WRISSUECAP1_EN,
    S_AXI_HP1_WVALID,
    S_AXI_HP1_ARBURST,
    S_AXI_HP1_ARLOCK,
    S_AXI_HP1_ARSIZE,
    S_AXI_HP1_AWBURST,
    S_AXI_HP1_AWLOCK,
    S_AXI_HP1_AWSIZE,
    S_AXI_HP1_ARPROT,
    S_AXI_HP1_AWPROT,
    S_AXI_HP1_ARADDR,
    S_AXI_HP1_AWADDR,
    S_AXI_HP1_ARCACHE,
    S_AXI_HP1_ARLEN,
    S_AXI_HP1_ARQOS,
    S_AXI_HP1_AWCACHE,
    S_AXI_HP1_AWLEN,
    S_AXI_HP1_AWQOS,
    S_AXI_HP1_ARID,
    S_AXI_HP1_AWID,
    S_AXI_HP1_WID,
    S_AXI_HP1_WDATA,
    S_AXI_HP1_WSTRB,
    S_AXI_HP2_ARESETN,
    S_AXI_HP2_ARREADY,
    S_AXI_HP2_AWREADY,
    S_AXI_HP2_BVALID,
    S_AXI_HP2_RLAST,
    S_AXI_HP2_RVALID,
    S_AXI_HP2_WREADY,
    S_AXI_HP2_BRESP,
    S_AXI_HP2_RRESP,
    S_AXI_HP2_BID,
    S_AXI_HP2_RID,
    S_AXI_HP2_RDATA,
    S_AXI_HP2_RCOUNT,
    S_AXI_HP2_WCOUNT,
    S_AXI_HP2_RACOUNT,
    S_AXI_HP2_WACOUNT,
    S_AXI_HP2_ACLK,
    S_AXI_HP2_ARVALID,
    S_AXI_HP2_AWVALID,
    S_AXI_HP2_BREADY,
    S_AXI_HP2_RDISSUECAP1_EN,
    S_AXI_HP2_RREADY,
    S_AXI_HP2_WLAST,
    S_AXI_HP2_WRISSUECAP1_EN,
    S_AXI_HP2_WVALID,
    S_AXI_HP2_ARBURST,
    S_AXI_HP2_ARLOCK,
    S_AXI_HP2_ARSIZE,
    S_AXI_HP2_AWBURST,
    S_AXI_HP2_AWLOCK,
    S_AXI_HP2_AWSIZE,
    S_AXI_HP2_ARPROT,
    S_AXI_HP2_AWPROT,
    S_AXI_HP2_ARADDR,
    S_AXI_HP2_AWADDR,
    S_AXI_HP2_ARCACHE,
    S_AXI_HP2_ARLEN,
    S_AXI_HP2_ARQOS,
    S_AXI_HP2_AWCACHE,
    S_AXI_HP2_AWLEN,
    S_AXI_HP2_AWQOS,
    S_AXI_HP2_ARID,
    S_AXI_HP2_AWID,
    S_AXI_HP2_WID,
    S_AXI_HP2_WDATA,
    S_AXI_HP2_WSTRB,
    S_AXI_HP3_ARESETN,
    S_AXI_HP3_ARREADY,
    S_AXI_HP3_AWREADY,
    S_AXI_HP3_BVALID,
    S_AXI_HP3_RLAST,
    S_AXI_HP3_RVALID,
    S_AXI_HP3_WREADY,
    S_AXI_HP3_BRESP,
    S_AXI_HP3_RRESP,
    S_AXI_HP3_BID,
    S_AXI_HP3_RID,
    S_AXI_HP3_RDATA,
    S_AXI_HP3_RCOUNT,
    S_AXI_HP3_WCOUNT,
    S_AXI_HP3_RACOUNT,
    S_AXI_HP3_WACOUNT,
    S_AXI_HP3_ACLK,
    S_AXI_HP3_ARVALID,
    S_AXI_HP3_AWVALID,
    S_AXI_HP3_BREADY,
    S_AXI_HP3_RDISSUECAP1_EN,
    S_AXI_HP3_RREADY,
    S_AXI_HP3_WLAST,
    S_AXI_HP3_WRISSUECAP1_EN,
    S_AXI_HP3_WVALID,
    S_AXI_HP3_ARBURST,
    S_AXI_HP3_ARLOCK,
    S_AXI_HP3_ARSIZE,
    S_AXI_HP3_AWBURST,
    S_AXI_HP3_AWLOCK,
    S_AXI_HP3_AWSIZE,
    S_AXI_HP3_ARPROT,
    S_AXI_HP3_AWPROT,
    S_AXI_HP3_ARADDR,
    S_AXI_HP3_AWADDR,
    S_AXI_HP3_ARCACHE,
    S_AXI_HP3_ARLEN,
    S_AXI_HP3_ARQOS,
    S_AXI_HP3_AWCACHE,
    S_AXI_HP3_AWLEN,
    S_AXI_HP3_AWQOS,
    S_AXI_HP3_ARID,
    S_AXI_HP3_AWID,
    S_AXI_HP3_WID,
    S_AXI_HP3_WDATA,
    S_AXI_HP3_WSTRB,
    DMA0_DATYPE,
    DMA0_DAVALID,
    DMA0_DRREADY,
    DMA0_RSTN,
    DMA0_ACLK,
    DMA0_DAREADY,
    DMA0_DRLAST,
    DMA0_DRVALID,
    DMA0_DRTYPE,
    DMA1_DATYPE,
    DMA1_DAVALID,
    DMA1_DRREADY,
    DMA1_RSTN,
    DMA1_ACLK,
    DMA1_DAREADY,
    DMA1_DRLAST,
    DMA1_DRVALID,
    DMA1_DRTYPE,
    DMA2_DATYPE,
    DMA2_DAVALID,
    DMA2_DRREADY,
    DMA2_RSTN,
    DMA2_ACLK,
    DMA2_DAREADY,
    DMA2_DRLAST,
    DMA2_DRVALID,
    DMA3_DRVALID,
    DMA3_DATYPE,
    DMA3_DAVALID,
    DMA3_DRREADY,
    DMA3_RSTN,
    DMA3_ACLK,
    DMA3_DAREADY,
    DMA3_DRLAST,
    DMA2_DRTYPE,
    DMA3_DRTYPE,
    FTMD_TRACEIN_DATA,
    FTMD_TRACEIN_VALID,
    FTMD_TRACEIN_CLK,
    FTMD_TRACEIN_ATID,
    FTMT_F2P_TRIG,
    FTMT_F2P_TRIGACK,
    FTMT_F2P_DEBUG,
    FTMT_P2F_TRIGACK,
    FTMT_P2F_TRIG,
    FTMT_P2F_DEBUG,
    FCLK_CLK3,
    FCLK_CLK2,
    FCLK_CLK1,
    FCLK_CLK0,
    FCLK_CLKTRIG3_N,
    FCLK_CLKTRIG2_N,
    FCLK_CLKTRIG1_N,
    FCLK_CLKTRIG0_N,
    FCLK_RESET3_N,
    FCLK_RESET2_N,
    FCLK_RESET1_N,
    FCLK_RESET0_N,
    FPGA_IDLE_N,
    DDR_ARB,
    IRQ_F2P,
    Core0_nFIQ,
    Core0_nIRQ,
    Core1_nFIQ,
    Core1_nIRQ,
    EVENT_EVENTO,
    EVENT_STANDBYWFE,
    EVENT_STANDBYWFI,
    EVENT_EVENTI,
    MIO,
    DDR_Clk,
    DDR_Clk_n,
    DDR_CKE,
    DDR_CS_n,
    DDR_RAS_n,
    DDR_CAS_n,
    DDR_WEB,
    DDR_BankAddr,
    DDR_Addr,
    DDR_ODT,
    DDR_DRSTB,
    DDR_DQ,
    DDR_DM,
    DDR_DQS,
    DDR_DQS_n,
    DDR_VRN,
    DDR_VRP,
    PS_SRSTB,
    PS_CLK,
    PS_PORB,
    IRQ_P2F_DMAC_ABORT,
    IRQ_P2F_DMAC0,
    IRQ_P2F_DMAC1,
    IRQ_P2F_DMAC2,
    IRQ_P2F_DMAC3,
    IRQ_P2F_DMAC4,
    IRQ_P2F_DMAC5,
    IRQ_P2F_DMAC6,
    IRQ_P2F_DMAC7,
    IRQ_P2F_SMC,
    IRQ_P2F_QSPI,
    IRQ_P2F_CTI,
    IRQ_P2F_GPIO,
    IRQ_P2F_USB0,
    IRQ_P2F_ENET0,
    IRQ_P2F_ENET_WAKE0,
    IRQ_P2F_SDIO0,
    IRQ_P2F_I2C0,
    IRQ_P2F_SPI0,
    IRQ_P2F_UART0,
    IRQ_P2F_CAN0,
    IRQ_P2F_USB1,
    IRQ_P2F_ENET1,
    IRQ_P2F_ENET_WAKE1,
    IRQ_P2F_SDIO1,
    IRQ_P2F_I2C1,
    IRQ_P2F_SPI1,
    IRQ_P2F_UART1,
    IRQ_P2F_CAN1
  );
  output CAN0_PHY_TX;
  input CAN0_PHY_RX;
  output CAN1_PHY_TX;
  input CAN1_PHY_RX;
  output ENET0_GMII_TX_EN;
  output ENET0_GMII_TX_ER;
  output ENET0_MDIO_MDC;
  output ENET0_MDIO_O;
  output ENET0_MDIO_T;
  output ENET0_PTP_DELAY_REQ_RX;
  output ENET0_PTP_DELAY_REQ_TX;
  output ENET0_PTP_PDELAY_REQ_RX;
  output ENET0_PTP_PDELAY_REQ_TX;
  output ENET0_PTP_PDELAY_RESP_RX;
  output ENET0_PTP_PDELAY_RESP_TX;
  output ENET0_PTP_SYNC_FRAME_RX;
  output ENET0_PTP_SYNC_FRAME_TX;
  output ENET0_SOF_RX;
  output ENET0_SOF_TX;
  output [7:0] ENET0_GMII_TXD;
  input ENET0_GMII_COL;
  input ENET0_GMII_CRS;
  input ENET0_EXT_INTIN;
  input ENET0_GMII_RX_CLK;
  input ENET0_GMII_RX_DV;
  input ENET0_GMII_RX_ER;
  input ENET0_GMII_TX_CLK;
  input ENET0_MDIO_I;
  input [7:0] ENET0_GMII_RXD;
  output ENET1_GMII_TX_EN;
  output ENET1_GMII_TX_ER;
  output ENET1_MDIO_MDC;
  output ENET1_MDIO_O;
  output ENET1_MDIO_T;
  output ENET1_PTP_DELAY_REQ_RX;
  output ENET1_PTP_DELAY_REQ_TX;
  output ENET1_PTP_PDELAY_REQ_RX;
  output ENET1_PTP_PDELAY_REQ_TX;
  output ENET1_PTP_PDELAY_RESP_RX;
  output ENET1_PTP_PDELAY_RESP_TX;
  output ENET1_PTP_SYNC_FRAME_RX;
  output ENET1_PTP_SYNC_FRAME_TX;
  output ENET1_SOF_RX;
  output ENET1_SOF_TX;
  output [7:0] ENET1_GMII_TXD;
  input ENET1_GMII_COL;
  input ENET1_GMII_CRS;
  input ENET1_EXT_INTIN;
  input ENET1_GMII_RX_CLK;
  input ENET1_GMII_RX_DV;
  input ENET1_GMII_RX_ER;
  input ENET1_GMII_TX_CLK;
  input ENET1_MDIO_I;
  input [7:0] ENET1_GMII_RXD;
  input [63:0] GPIO_I;
  output [63:0] GPIO_O;
  output [63:0] GPIO_T;
  input I2C0_SDA_I;
  output I2C0_SDA_O;
  output I2C0_SDA_T;
  input I2C0_SCL_I;
  output I2C0_SCL_O;
  output I2C0_SCL_T;
  input I2C1_SDA_I;
  output I2C1_SDA_O;
  output I2C1_SDA_T;
  input I2C1_SCL_I;
  output I2C1_SCL_O;
  output I2C1_SCL_T;
  input PJTAG_TCK;
  input PJTAG_TMS;
  input PJTAG_TD_I;
  output PJTAG_TD_T;
  output PJTAG_TD_O;
  output SDIO0_CLK;
  input SDIO0_CLK_FB;
  output SDIO0_CMD_O;
  input SDIO0_CMD_I;
  output SDIO0_CMD_T;
  input [3:0] SDIO0_DATA_I;
  output [3:0] SDIO0_DATA_O;
  output [3:0] SDIO0_DATA_T;
  output SDIO0_LED;
  input SDIO0_CDN;
  input SDIO0_WP;
  output SDIO0_BUSPOW;
  output [2:0] SDIO0_BUSVOLT;
  output SDIO1_CLK;
  input SDIO1_CLK_FB;
  output SDIO1_CMD_O;
  input SDIO1_CMD_I;
  output SDIO1_CMD_T;
  input [3:0] SDIO1_DATA_I;
  output [3:0] SDIO1_DATA_O;
  output [3:0] SDIO1_DATA_T;
  output SDIO1_LED;
  input SDIO1_CDN;
  input SDIO1_WP;
  output SDIO1_BUSPOW;
  output [2:0] SDIO1_BUSVOLT;
  input SPI0_SCLK_I;
  output SPI0_SCLK_O;
  output SPI0_SCLK_T;
  input SPI0_MOSI_I;
  output SPI0_MOSI_O;
  output SPI0_MOSI_T;
  input SPI0_MISO_I;
  output SPI0_MISO_O;
  output SPI0_MISO_T;
  input SPI0_SS_I;
  output SPI0_SS_O;
  output SPI0_SS1_O;
  output SPI0_SS2_O;
  output SPI0_SS_T;
  input SPI1_SCLK_I;
  output SPI1_SCLK_O;
  output SPI1_SCLK_T;
  input SPI1_MOSI_I;
  output SPI1_MOSI_O;
  output SPI1_MOSI_T;
  input SPI1_MISO_I;
  output SPI1_MISO_O;
  output SPI1_MISO_T;
  input SPI1_SS_I;
  output SPI1_SS_O;
  output SPI1_SS1_O;
  output SPI1_SS2_O;
  output SPI1_SS_T;
  output UART0_DTRN;
  output UART0_RTSN;
  output UART0_TX;
  input UART0_CTSN;
  input UART0_DCDN;
  input UART0_DSRN;
  input UART0_RIN;
  input UART0_RX;
  output UART1_DTRN;
  output UART1_RTSN;
  output UART1_TX;
  input UART1_CTSN;
  input UART1_DCDN;
  input UART1_DSRN;
  input UART1_RIN;
  input UART1_RX;
  output TTC0_WAVE0_OUT;
  output TTC0_WAVE1_OUT;
  output TTC0_WAVE2_OUT;
  input TTC0_CLK0_IN;
  input TTC0_CLK1_IN;
  input TTC0_CLK2_IN;
  output TTC1_WAVE0_OUT;
  output TTC1_WAVE1_OUT;
  output TTC1_WAVE2_OUT;
  input TTC1_CLK0_IN;
  input TTC1_CLK1_IN;
  input TTC1_CLK2_IN;
  input WDT_CLK_IN;
  output WDT_RST_OUT;
  input TRACE_CLK;
  output TRACE_CTL;
  output [31:0] TRACE_DATA;
  output [1:0] USB0_PORT_INDCTL;
  output [1:0] USB1_PORT_INDCTL;
  output USB0_VBUS_PWRSELECT;
  output USB1_VBUS_PWRSELECT;
  input USB0_VBUS_PWRFAULT;
  input USB1_VBUS_PWRFAULT;
  input SRAM_INTIN;
  output M_AXI_GP0_ARESETN;
  output M_AXI_GP0_ARVALID;
  output M_AXI_GP0_AWVALID;
  output M_AXI_GP0_BREADY;
  output M_AXI_GP0_RREADY;
  output M_AXI_GP0_WLAST;
  output M_AXI_GP0_WVALID;
  output [11:0] M_AXI_GP0_ARID;
  output [11:0] M_AXI_GP0_AWID;
  output [11:0] M_AXI_GP0_WID;
  output [1:0] M_AXI_GP0_ARBURST;
  output [1:0] M_AXI_GP0_ARLOCK;
  output [2:0] M_AXI_GP0_ARSIZE;
  output [1:0] M_AXI_GP0_AWBURST;
  output [1:0] M_AXI_GP0_AWLOCK;
  output [2:0] M_AXI_GP0_AWSIZE;
  output [2:0] M_AXI_GP0_ARPROT;
  output [2:0] M_AXI_GP0_AWPROT;
  output [31:0] M_AXI_GP0_ARADDR;
  output [31:0] M_AXI_GP0_AWADDR;
  output [31:0] M_AXI_GP0_WDATA;
  output [3:0] M_AXI_GP0_ARCACHE;
  output [3:0] M_AXI_GP0_ARLEN;
  output [3:0] M_AXI_GP0_ARQOS;
  output [3:0] M_AXI_GP0_AWCACHE;
  output [3:0] M_AXI_GP0_AWLEN;
  output [3:0] M_AXI_GP0_AWQOS;
  output [3:0] M_AXI_GP0_WSTRB;
  input M_AXI_GP0_ACLK;
  input M_AXI_GP0_ARREADY;
  input M_AXI_GP0_AWREADY;
  input M_AXI_GP0_BVALID;
  input M_AXI_GP0_RLAST;
  input M_AXI_GP0_RVALID;
  input M_AXI_GP0_WREADY;
  input [11:0] M_AXI_GP0_BID;
  input [11:0] M_AXI_GP0_RID;
  input [1:0] M_AXI_GP0_BRESP;
  input [1:0] M_AXI_GP0_RRESP;
  input [31:0] M_AXI_GP0_RDATA;
  output M_AXI_GP1_ARESETN;
  output M_AXI_GP1_ARVALID;
  output M_AXI_GP1_AWVALID;
  output M_AXI_GP1_BREADY;
  output M_AXI_GP1_RREADY;
  output M_AXI_GP1_WLAST;
  output M_AXI_GP1_WVALID;
  output [11:0] M_AXI_GP1_ARID;
  output [11:0] M_AXI_GP1_AWID;
  output [11:0] M_AXI_GP1_WID;
  output [1:0] M_AXI_GP1_ARBURST;
  output [1:0] M_AXI_GP1_ARLOCK;
  output [2:0] M_AXI_GP1_ARSIZE;
  output [1:0] M_AXI_GP1_AWBURST;
  output [1:0] M_AXI_GP1_AWLOCK;
  output [2:0] M_AXI_GP1_AWSIZE;
  output [2:0] M_AXI_GP1_ARPROT;
  output [2:0] M_AXI_GP1_AWPROT;
  output [31:0] M_AXI_GP1_ARADDR;
  output [31:0] M_AXI_GP1_AWADDR;
  output [31:0] M_AXI_GP1_WDATA;
  output [3:0] M_AXI_GP1_ARCACHE;
  output [3:0] M_AXI_GP1_ARLEN;
  output [3:0] M_AXI_GP1_ARQOS;
  output [3:0] M_AXI_GP1_AWCACHE;
  output [3:0] M_AXI_GP1_AWLEN;
  output [3:0] M_AXI_GP1_AWQOS;
  output [3:0] M_AXI_GP1_WSTRB;
  input M_AXI_GP1_ACLK;
  input M_AXI_GP1_ARREADY;
  input M_AXI_GP1_AWREADY;
  input M_AXI_GP1_BVALID;
  input M_AXI_GP1_RLAST;
  input M_AXI_GP1_RVALID;
  input M_AXI_GP1_WREADY;
  input [11:0] M_AXI_GP1_BID;
  input [11:0] M_AXI_GP1_RID;
  input [1:0] M_AXI_GP1_BRESP;
  input [1:0] M_AXI_GP1_RRESP;
  input [31:0] M_AXI_GP1_RDATA;
  output S_AXI_GP0_ARESETN;
  output S_AXI_GP0_ARREADY;
  output S_AXI_GP0_AWREADY;
  output S_AXI_GP0_BVALID;
  output S_AXI_GP0_RLAST;
  output S_AXI_GP0_RVALID;
  output S_AXI_GP0_WREADY;
  output [1:0] S_AXI_GP0_BRESP;
  output [1:0] S_AXI_GP0_RRESP;
  output [31:0] S_AXI_GP0_RDATA;
  output [0:0] S_AXI_GP0_BID;
  output [0:0] S_AXI_GP0_RID;
  input S_AXI_GP0_ACLK;
  input S_AXI_GP0_ARVALID;
  input S_AXI_GP0_AWVALID;
  input S_AXI_GP0_BREADY;
  input S_AXI_GP0_RREADY;
  input S_AXI_GP0_WLAST;
  input S_AXI_GP0_WVALID;
  input [1:0] S_AXI_GP0_ARBURST;
  input [1:0] S_AXI_GP0_ARLOCK;
  input [2:0] S_AXI_GP0_ARSIZE;
  input [1:0] S_AXI_GP0_AWBURST;
  input [1:0] S_AXI_GP0_AWLOCK;
  input [2:0] S_AXI_GP0_AWSIZE;
  input [2:0] S_AXI_GP0_ARPROT;
  input [2:0] S_AXI_GP0_AWPROT;
  input [31:0] S_AXI_GP0_ARADDR;
  input [31:0] S_AXI_GP0_AWADDR;
  input [31:0] S_AXI_GP0_WDATA;
  input [3:0] S_AXI_GP0_ARCACHE;
  input [3:0] S_AXI_GP0_ARLEN;
  input [3:0] S_AXI_GP0_ARQOS;
  input [3:0] S_AXI_GP0_AWCACHE;
  input [3:0] S_AXI_GP0_AWLEN;
  input [3:0] S_AXI_GP0_AWQOS;
  input [3:0] S_AXI_GP0_WSTRB;
  input [0:0] S_AXI_GP0_ARID;
  input [0:0] S_AXI_GP0_AWID;
  input [0:0] S_AXI_GP0_WID;
  output S_AXI_GP1_ARESETN;
  output S_AXI_GP1_ARREADY;
  output S_AXI_GP1_AWREADY;
  output S_AXI_GP1_BVALID;
  output S_AXI_GP1_RLAST;
  output S_AXI_GP1_RVALID;
  output S_AXI_GP1_WREADY;
  output [1:0] S_AXI_GP1_BRESP;
  output [1:0] S_AXI_GP1_RRESP;
  output [31:0] S_AXI_GP1_RDATA;
  output [5:0] S_AXI_GP1_BID;
  output [5:0] S_AXI_GP1_RID;
  input S_AXI_GP1_ACLK;
  input S_AXI_GP1_ARVALID;
  input S_AXI_GP1_AWVALID;
  input S_AXI_GP1_BREADY;
  input S_AXI_GP1_RREADY;
  input S_AXI_GP1_WLAST;
  input S_AXI_GP1_WVALID;
  input [1:0] S_AXI_GP1_ARBURST;
  input [1:0] S_AXI_GP1_ARLOCK;
  input [2:0] S_AXI_GP1_ARSIZE;
  input [1:0] S_AXI_GP1_AWBURST;
  input [1:0] S_AXI_GP1_AWLOCK;
  input [2:0] S_AXI_GP1_AWSIZE;
  input [2:0] S_AXI_GP1_ARPROT;
  input [2:0] S_AXI_GP1_AWPROT;
  input [31:0] S_AXI_GP1_ARADDR;
  input [31:0] S_AXI_GP1_AWADDR;
  input [31:0] S_AXI_GP1_WDATA;
  input [3:0] S_AXI_GP1_ARCACHE;
  input [3:0] S_AXI_GP1_ARLEN;
  input [3:0] S_AXI_GP1_ARQOS;
  input [3:0] S_AXI_GP1_AWCACHE;
  input [3:0] S_AXI_GP1_AWLEN;
  input [3:0] S_AXI_GP1_AWQOS;
  input [3:0] S_AXI_GP1_WSTRB;
  input [5:0] S_AXI_GP1_ARID;
  input [5:0] S_AXI_GP1_AWID;
  input [5:0] S_AXI_GP1_WID;
  output S_AXI_ACP_ARESETN;
  output S_AXI_ACP_AWREADY;
  output S_AXI_ACP_ARREADY;
  output S_AXI_ACP_BVALID;
  output S_AXI_ACP_RLAST;
  output S_AXI_ACP_RVALID;
  output S_AXI_ACP_WREADY;
  output [1:0] S_AXI_ACP_BRESP;
  output [1:0] S_AXI_ACP_RRESP;
  output [2:0] S_AXI_ACP_BID;
  output [2:0] S_AXI_ACP_RID;
  output [63:0] S_AXI_ACP_RDATA;
  input S_AXI_ACP_ACLK;
  input S_AXI_ACP_ARVALID;
  input S_AXI_ACP_AWVALID;
  input S_AXI_ACP_BREADY;
  input S_AXI_ACP_RREADY;
  input S_AXI_ACP_WLAST;
  input S_AXI_ACP_WVALID;
  input [2:0] S_AXI_ACP_ARID;
  input [2:0] S_AXI_ACP_ARPROT;
  input [2:0] S_AXI_ACP_AWID;
  input [2:0] S_AXI_ACP_AWPROT;
  input [2:0] S_AXI_ACP_WID;
  input [31:0] S_AXI_ACP_ARADDR;
  input [31:0] S_AXI_ACP_AWADDR;
  input [3:0] S_AXI_ACP_ARCACHE;
  input [3:0] S_AXI_ACP_ARLEN;
  input [3:0] S_AXI_ACP_ARQOS;
  input [3:0] S_AXI_ACP_AWCACHE;
  input [3:0] S_AXI_ACP_AWLEN;
  input [3:0] S_AXI_ACP_AWQOS;
  input [1:0] S_AXI_ACP_ARBURST;
  input [1:0] S_AXI_ACP_ARLOCK;
  input [2:0] S_AXI_ACP_ARSIZE;
  input [1:0] S_AXI_ACP_AWBURST;
  input [1:0] S_AXI_ACP_AWLOCK;
  input [2:0] S_AXI_ACP_AWSIZE;
  input [4:0] S_AXI_ACP_ARUSER;
  input [4:0] S_AXI_ACP_AWUSER;
  input [63:0] S_AXI_ACP_WDATA;
  input [7:0] S_AXI_ACP_WSTRB;
  output S_AXI_HP0_ARESETN;
  output S_AXI_HP0_ARREADY;
  output S_AXI_HP0_AWREADY;
  output S_AXI_HP0_BVALID;
  output S_AXI_HP0_RLAST;
  output S_AXI_HP0_RVALID;
  output S_AXI_HP0_WREADY;
  output [1:0] S_AXI_HP0_BRESP;
  output [1:0] S_AXI_HP0_RRESP;
  output [5:0] S_AXI_HP0_BID;
  output [5:0] S_AXI_HP0_RID;
  output [63:0] S_AXI_HP0_RDATA;
  output [7:0] S_AXI_HP0_RCOUNT;
  output [7:0] S_AXI_HP0_WCOUNT;
  output [2:0] S_AXI_HP0_RACOUNT;
  output [5:0] S_AXI_HP0_WACOUNT;
  input S_AXI_HP0_ACLK;
  input S_AXI_HP0_ARVALID;
  input S_AXI_HP0_AWVALID;
  input S_AXI_HP0_BREADY;
  input S_AXI_HP0_RDISSUECAP1_EN;
  input S_AXI_HP0_RREADY;
  input S_AXI_HP0_WLAST;
  input S_AXI_HP0_WRISSUECAP1_EN;
  input S_AXI_HP0_WVALID;
  input [1:0] S_AXI_HP0_ARBURST;
  input [1:0] S_AXI_HP0_ARLOCK;
  input [2:0] S_AXI_HP0_ARSIZE;
  input [1:0] S_AXI_HP0_AWBURST;
  input [1:0] S_AXI_HP0_AWLOCK;
  input [2:0] S_AXI_HP0_AWSIZE;
  input [2:0] S_AXI_HP0_ARPROT;
  input [2:0] S_AXI_HP0_AWPROT;
  input [31:0] S_AXI_HP0_ARADDR;
  input [31:0] S_AXI_HP0_AWADDR;
  input [3:0] S_AXI_HP0_ARCACHE;
  input [3:0] S_AXI_HP0_ARLEN;
  input [3:0] S_AXI_HP0_ARQOS;
  input [3:0] S_AXI_HP0_AWCACHE;
  input [3:0] S_AXI_HP0_AWLEN;
  input [3:0] S_AXI_HP0_AWQOS;
  input [5:0] S_AXI_HP0_ARID;
  input [5:0] S_AXI_HP0_AWID;
  input [5:0] S_AXI_HP0_WID;
  input [63:0] S_AXI_HP0_WDATA;
  input [7:0] S_AXI_HP0_WSTRB;
  output S_AXI_HP1_ARESETN;
  output S_AXI_HP1_ARREADY;
  output S_AXI_HP1_AWREADY;
  output S_AXI_HP1_BVALID;
  output S_AXI_HP1_RLAST;
  output S_AXI_HP1_RVALID;
  output S_AXI_HP1_WREADY;
  output [1:0] S_AXI_HP1_BRESP;
  output [1:0] S_AXI_HP1_RRESP;
  output [0:0] S_AXI_HP1_BID;
  output [0:0] S_AXI_HP1_RID;
  output [63:0] S_AXI_HP1_RDATA;
  output [7:0] S_AXI_HP1_RCOUNT;
  output [7:0] S_AXI_HP1_WCOUNT;
  output [2:0] S_AXI_HP1_RACOUNT;
  output [5:0] S_AXI_HP1_WACOUNT;
  input S_AXI_HP1_ACLK;
  input S_AXI_HP1_ARVALID;
  input S_AXI_HP1_AWVALID;
  input S_AXI_HP1_BREADY;
  input S_AXI_HP1_RDISSUECAP1_EN;
  input S_AXI_HP1_RREADY;
  input S_AXI_HP1_WLAST;
  input S_AXI_HP1_WRISSUECAP1_EN;
  input S_AXI_HP1_WVALID;
  input [1:0] S_AXI_HP1_ARBURST;
  input [1:0] S_AXI_HP1_ARLOCK;
  input [2:0] S_AXI_HP1_ARSIZE;
  input [1:0] S_AXI_HP1_AWBURST;
  input [1:0] S_AXI_HP1_AWLOCK;
  input [2:0] S_AXI_HP1_AWSIZE;
  input [2:0] S_AXI_HP1_ARPROT;
  input [2:0] S_AXI_HP1_AWPROT;
  input [31:0] S_AXI_HP1_ARADDR;
  input [31:0] S_AXI_HP1_AWADDR;
  input [3:0] S_AXI_HP1_ARCACHE;
  input [3:0] S_AXI_HP1_ARLEN;
  input [3:0] S_AXI_HP1_ARQOS;
  input [3:0] S_AXI_HP1_AWCACHE;
  input [3:0] S_AXI_HP1_AWLEN;
  input [3:0] S_AXI_HP1_AWQOS;
  input [0:0] S_AXI_HP1_ARID;
  input [0:0] S_AXI_HP1_AWID;
  input [0:0] S_AXI_HP1_WID;
  input [63:0] S_AXI_HP1_WDATA;
  input [7:0] S_AXI_HP1_WSTRB;
  output S_AXI_HP2_ARESETN;
  output S_AXI_HP2_ARREADY;
  output S_AXI_HP2_AWREADY;
  output S_AXI_HP2_BVALID;
  output S_AXI_HP2_RLAST;
  output S_AXI_HP2_RVALID;
  output S_AXI_HP2_WREADY;
  output [1:0] S_AXI_HP2_BRESP;
  output [1:0] S_AXI_HP2_RRESP;
  output [5:0] S_AXI_HP2_BID;
  output [5:0] S_AXI_HP2_RID;
  output [63:0] S_AXI_HP2_RDATA;
  output [7:0] S_AXI_HP2_RCOUNT;
  output [7:0] S_AXI_HP2_WCOUNT;
  output [2:0] S_AXI_HP2_RACOUNT;
  output [5:0] S_AXI_HP2_WACOUNT;
  input S_AXI_HP2_ACLK;
  input S_AXI_HP2_ARVALID;
  input S_AXI_HP2_AWVALID;
  input S_AXI_HP2_BREADY;
  input S_AXI_HP2_RDISSUECAP1_EN;
  input S_AXI_HP2_RREADY;
  input S_AXI_HP2_WLAST;
  input S_AXI_HP2_WRISSUECAP1_EN;
  input S_AXI_HP2_WVALID;
  input [1:0] S_AXI_HP2_ARBURST;
  input [1:0] S_AXI_HP2_ARLOCK;
  input [2:0] S_AXI_HP2_ARSIZE;
  input [1:0] S_AXI_HP2_AWBURST;
  input [1:0] S_AXI_HP2_AWLOCK;
  input [2:0] S_AXI_HP2_AWSIZE;
  input [2:0] S_AXI_HP2_ARPROT;
  input [2:0] S_AXI_HP2_AWPROT;
  input [31:0] S_AXI_HP2_ARADDR;
  input [31:0] S_AXI_HP2_AWADDR;
  input [3:0] S_AXI_HP2_ARCACHE;
  input [3:0] S_AXI_HP2_ARLEN;
  input [3:0] S_AXI_HP2_ARQOS;
  input [3:0] S_AXI_HP2_AWCACHE;
  input [3:0] S_AXI_HP2_AWLEN;
  input [3:0] S_AXI_HP2_AWQOS;
  input [5:0] S_AXI_HP2_ARID;
  input [5:0] S_AXI_HP2_AWID;
  input [5:0] S_AXI_HP2_WID;
  input [63:0] S_AXI_HP2_WDATA;
  input [7:0] S_AXI_HP2_WSTRB;
  output S_AXI_HP3_ARESETN;
  output S_AXI_HP3_ARREADY;
  output S_AXI_HP3_AWREADY;
  output S_AXI_HP3_BVALID;
  output S_AXI_HP3_RLAST;
  output S_AXI_HP3_RVALID;
  output S_AXI_HP3_WREADY;
  output [1:0] S_AXI_HP3_BRESP;
  output [1:0] S_AXI_HP3_RRESP;
  output [5:0] S_AXI_HP3_BID;
  output [5:0] S_AXI_HP3_RID;
  output [63:0] S_AXI_HP3_RDATA;
  output [7:0] S_AXI_HP3_RCOUNT;
  output [7:0] S_AXI_HP3_WCOUNT;
  output [2:0] S_AXI_HP3_RACOUNT;
  output [5:0] S_AXI_HP3_WACOUNT;
  input S_AXI_HP3_ACLK;
  input S_AXI_HP3_ARVALID;
  input S_AXI_HP3_AWVALID;
  input S_AXI_HP3_BREADY;
  input S_AXI_HP3_RDISSUECAP1_EN;
  input S_AXI_HP3_RREADY;
  input S_AXI_HP3_WLAST;
  input S_AXI_HP3_WRISSUECAP1_EN;
  input S_AXI_HP3_WVALID;
  input [1:0] S_AXI_HP3_ARBURST;
  input [1:0] S_AXI_HP3_ARLOCK;
  input [2:0] S_AXI_HP3_ARSIZE;
  input [1:0] S_AXI_HP3_AWBURST;
  input [1:0] S_AXI_HP3_AWLOCK;
  input [2:0] S_AXI_HP3_AWSIZE;
  input [2:0] S_AXI_HP3_ARPROT;
  input [2:0] S_AXI_HP3_AWPROT;
  input [31:0] S_AXI_HP3_ARADDR;
  input [31:0] S_AXI_HP3_AWADDR;
  input [3:0] S_AXI_HP3_ARCACHE;
  input [3:0] S_AXI_HP3_ARLEN;
  input [3:0] S_AXI_HP3_ARQOS;
  input [3:0] S_AXI_HP3_AWCACHE;
  input [3:0] S_AXI_HP3_AWLEN;
  input [3:0] S_AXI_HP3_AWQOS;
  input [5:0] S_AXI_HP3_ARID;
  input [5:0] S_AXI_HP3_AWID;
  input [5:0] S_AXI_HP3_WID;
  input [63:0] S_AXI_HP3_WDATA;
  input [7:0] S_AXI_HP3_WSTRB;
  output [1:0] DMA0_DATYPE;
  output DMA0_DAVALID;
  output DMA0_DRREADY;
  output DMA0_RSTN;
  input DMA0_ACLK;
  input DMA0_DAREADY;
  input DMA0_DRLAST;
  input DMA0_DRVALID;
  input [1:0] DMA0_DRTYPE;
  output [1:0] DMA1_DATYPE;
  output DMA1_DAVALID;
  output DMA1_DRREADY;
  output DMA1_RSTN;
  input DMA1_ACLK;
  input DMA1_DAREADY;
  input DMA1_DRLAST;
  input DMA1_DRVALID;
  input [1:0] DMA1_DRTYPE;
  output [1:0] DMA2_DATYPE;
  output DMA2_DAVALID;
  output DMA2_DRREADY;
  output DMA2_RSTN;
  input DMA2_ACLK;
  input DMA2_DAREADY;
  input DMA2_DRLAST;
  input DMA2_DRVALID;
  input DMA3_DRVALID;
  output [1:0] DMA3_DATYPE;
  output DMA3_DAVALID;
  output DMA3_DRREADY;
  output DMA3_RSTN;
  input DMA3_ACLK;
  input DMA3_DAREADY;
  input DMA3_DRLAST;
  input [1:0] DMA2_DRTYPE;
  input [1:0] DMA3_DRTYPE;
  input [31:0] FTMD_TRACEIN_DATA;
  input FTMD_TRACEIN_VALID;
  input FTMD_TRACEIN_CLK;
  input [3:0] FTMD_TRACEIN_ATID;
  input [3:0] FTMT_F2P_TRIG;
  output [3:0] FTMT_F2P_TRIGACK;
  input [31:0] FTMT_F2P_DEBUG;
  input [3:0] FTMT_P2F_TRIGACK;
  output [3:0] FTMT_P2F_TRIG;
  output [31:0] FTMT_P2F_DEBUG;
  output FCLK_CLK3;
  output FCLK_CLK2;
  output FCLK_CLK1;
  output FCLK_CLK0;
  input FCLK_CLKTRIG3_N;
  input FCLK_CLKTRIG2_N;
  input FCLK_CLKTRIG1_N;
  input FCLK_CLKTRIG0_N;
  output FCLK_RESET3_N;
  output FCLK_RESET2_N;
  output FCLK_RESET1_N;
  output FCLK_RESET0_N;
  input FPGA_IDLE_N;
  input [3:0] DDR_ARB;
  input [0:0] IRQ_F2P;
  input Core0_nFIQ;
  input Core0_nIRQ;
  input Core1_nFIQ;
  input Core1_nIRQ;
  output EVENT_EVENTO;
  output [1:0] EVENT_STANDBYWFE;
  output [1:0] EVENT_STANDBYWFI;
  input EVENT_EVENTI;
  inout [53:0] MIO;
  inout DDR_Clk;
  inout DDR_Clk_n;
  inout DDR_CKE;
  inout DDR_CS_n;
  inout DDR_RAS_n;
  inout DDR_CAS_n;
  output DDR_WEB;
  inout [2:0] DDR_BankAddr;
  inout [14:0] DDR_Addr;
  inout DDR_ODT;
  inout DDR_DRSTB;
  inout [31:0] DDR_DQ;
  inout [3:0] DDR_DM;
  inout [3:0] DDR_DQS;
  inout [3:0] DDR_DQS_n;
  inout DDR_VRN;
  inout DDR_VRP;
  input PS_SRSTB;
  input PS_CLK;
  input PS_PORB;
  output IRQ_P2F_DMAC_ABORT;
  output IRQ_P2F_DMAC0;
  output IRQ_P2F_DMAC1;
  output IRQ_P2F_DMAC2;
  output IRQ_P2F_DMAC3;
  output IRQ_P2F_DMAC4;
  output IRQ_P2F_DMAC5;
  output IRQ_P2F_DMAC6;
  output IRQ_P2F_DMAC7;
  output IRQ_P2F_SMC;
  output IRQ_P2F_QSPI;
  output IRQ_P2F_CTI;
  output IRQ_P2F_GPIO;
  output IRQ_P2F_USB0;
  output IRQ_P2F_ENET0;
  output IRQ_P2F_ENET_WAKE0;
  output IRQ_P2F_SDIO0;
  output IRQ_P2F_I2C0;
  output IRQ_P2F_SPI0;
  output IRQ_P2F_UART0;
  output IRQ_P2F_CAN0;
  output IRQ_P2F_USB1;
  output IRQ_P2F_ENET1;
  output IRQ_P2F_ENET_WAKE1;
  output IRQ_P2F_SDIO1;
  output IRQ_P2F_I2C1;
  output IRQ_P2F_SPI1;
  output IRQ_P2F_UART1;
  output IRQ_P2F_CAN1;
endmodule

module SensorMP_microblaze_0_reset_wrapper
  (
    Slowest_sync_clk,
    Ext_Reset_In,
    Aux_Reset_In,
    MB_Debug_Sys_Rst,
    Core_Reset_Req_0,
    Chip_Reset_Req_0,
    System_Reset_Req_0,
    Core_Reset_Req_1,
    Chip_Reset_Req_1,
    System_Reset_Req_1,
    Dcm_locked,
    RstcPPCresetcore_0,
    RstcPPCresetchip_0,
    RstcPPCresetsys_0,
    RstcPPCresetcore_1,
    RstcPPCresetchip_1,
    RstcPPCresetsys_1,
    MB_Reset,
    Bus_Struct_Reset,
    Peripheral_Reset,
    Interconnect_aresetn,
    Peripheral_aresetn
  );
  input Slowest_sync_clk;
  input Ext_Reset_In;
  input Aux_Reset_In;
  input MB_Debug_Sys_Rst;
  input Core_Reset_Req_0;
  input Chip_Reset_Req_0;
  input System_Reset_Req_0;
  input Core_Reset_Req_1;
  input Chip_Reset_Req_1;
  input System_Reset_Req_1;
  input Dcm_locked;
  output RstcPPCresetcore_0;
  output RstcPPCresetchip_0;
  output RstcPPCresetsys_0;
  output RstcPPCresetcore_1;
  output RstcPPCresetchip_1;
  output RstcPPCresetsys_1;
  output MB_Reset;
  output [0:0] Bus_Struct_Reset;
  output [0:0] Peripheral_Reset;
  output [0:0] Interconnect_aresetn;
  output [0:0] Peripheral_aresetn;
endmodule

module SensorMP_microblaze_0_axi_periph_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [1:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [1:0] M_AXI_ACLK;
  output [1:0] M_AXI_AWID;
  output [63:0] M_AXI_AWADDR;
  output [15:0] M_AXI_AWLEN;
  output [5:0] M_AXI_AWSIZE;
  output [3:0] M_AXI_AWBURST;
  output [3:0] M_AXI_AWLOCK;
  output [7:0] M_AXI_AWCACHE;
  output [5:0] M_AXI_AWPROT;
  output [7:0] M_AXI_AWREGION;
  output [7:0] M_AXI_AWQOS;
  output [1:0] M_AXI_AWUSER;
  output [1:0] M_AXI_AWVALID;
  input [1:0] M_AXI_AWREADY;
  output [1:0] M_AXI_WID;
  output [63:0] M_AXI_WDATA;
  output [7:0] M_AXI_WSTRB;
  output [1:0] M_AXI_WLAST;
  output [1:0] M_AXI_WUSER;
  output [1:0] M_AXI_WVALID;
  input [1:0] M_AXI_WREADY;
  input [1:0] M_AXI_BID;
  input [3:0] M_AXI_BRESP;
  input [1:0] M_AXI_BUSER;
  input [1:0] M_AXI_BVALID;
  output [1:0] M_AXI_BREADY;
  output [1:0] M_AXI_ARID;
  output [63:0] M_AXI_ARADDR;
  output [15:0] M_AXI_ARLEN;
  output [5:0] M_AXI_ARSIZE;
  output [3:0] M_AXI_ARBURST;
  output [3:0] M_AXI_ARLOCK;
  output [7:0] M_AXI_ARCACHE;
  output [5:0] M_AXI_ARPROT;
  output [7:0] M_AXI_ARREGION;
  output [7:0] M_AXI_ARQOS;
  output [1:0] M_AXI_ARUSER;
  output [1:0] M_AXI_ARVALID;
  input [1:0] M_AXI_ARREADY;
  input [1:0] M_AXI_RID;
  input [63:0] M_AXI_RDATA;
  input [3:0] M_AXI_RRESP;
  input [1:0] M_AXI_RLAST;
  input [1:0] M_AXI_RUSER;
  input [1:0] M_AXI_RVALID;
  output [1:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [31:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [31:0] DEBUG_SR_SC_WDATA;
  output [6:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [31:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [31:0] DEBUG_SC_SF_WDATA;
  output [6:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [31:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [31:0] DEBUG_SF_CB_WDATA;
  output [6:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [31:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [31:0] DEBUG_CB_MF_WDATA;
  output [6:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [31:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [31:0] DEBUG_MF_MC_WDATA;
  output [6:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [31:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [31:0] DEBUG_MC_MP_WDATA;
  output [6:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [31:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [31:0] DEBUG_MP_MR_WDATA;
  output [6:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module SensorMP_microblaze_0_axi_ipc_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [0:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [4:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [63:0] S_AXI_WDATA;
  input [7:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [4:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [63:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [0:0] M_AXI_ACLK;
  output [0:0] M_AXI_AWID;
  output [31:0] M_AXI_AWADDR;
  output [7:0] M_AXI_AWLEN;
  output [2:0] M_AXI_AWSIZE;
  output [1:0] M_AXI_AWBURST;
  output [1:0] M_AXI_AWLOCK;
  output [3:0] M_AXI_AWCACHE;
  output [2:0] M_AXI_AWPROT;
  output [3:0] M_AXI_AWREGION;
  output [3:0] M_AXI_AWQOS;
  output [4:0] M_AXI_AWUSER;
  output [0:0] M_AXI_AWVALID;
  input [0:0] M_AXI_AWREADY;
  output [0:0] M_AXI_WID;
  output [63:0] M_AXI_WDATA;
  output [7:0] M_AXI_WSTRB;
  output [0:0] M_AXI_WLAST;
  output [0:0] M_AXI_WUSER;
  output [0:0] M_AXI_WVALID;
  input [0:0] M_AXI_WREADY;
  input [0:0] M_AXI_BID;
  input [1:0] M_AXI_BRESP;
  input [0:0] M_AXI_BUSER;
  input [0:0] M_AXI_BVALID;
  output [0:0] M_AXI_BREADY;
  output [0:0] M_AXI_ARID;
  output [31:0] M_AXI_ARADDR;
  output [7:0] M_AXI_ARLEN;
  output [2:0] M_AXI_ARSIZE;
  output [1:0] M_AXI_ARBURST;
  output [1:0] M_AXI_ARLOCK;
  output [3:0] M_AXI_ARCACHE;
  output [2:0] M_AXI_ARPROT;
  output [3:0] M_AXI_ARREGION;
  output [3:0] M_AXI_ARQOS;
  output [4:0] M_AXI_ARUSER;
  output [0:0] M_AXI_ARVALID;
  input [0:0] M_AXI_ARREADY;
  input [0:0] M_AXI_RID;
  input [63:0] M_AXI_RDATA;
  input [1:0] M_AXI_RRESP;
  input [0:0] M_AXI_RLAST;
  input [0:0] M_AXI_RUSER;
  input [0:0] M_AXI_RVALID;
  output [0:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [63:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [63:0] DEBUG_SR_SC_WDATA;
  output [10:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [63:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [63:0] DEBUG_SC_SF_WDATA;
  output [10:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [63:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [63:0] DEBUG_SF_CB_WDATA;
  output [10:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [63:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [63:0] DEBUG_CB_MF_WDATA;
  output [10:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [63:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [63:0] DEBUG_MF_MC_WDATA;
  output [10:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [63:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [63:0] DEBUG_MC_MP_WDATA;
  output [10:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [63:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [63:0] DEBUG_MP_MR_WDATA;
  output [10:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module SensorMP_microblaze_0_wrapper
  (
    CLK,
    RESET,
    MB_RESET,
    INTERRUPT,
    INTERRUPT_ADDRESS,
    INTERRUPT_ACK,
    EXT_BRK,
    EXT_NM_BRK,
    DBG_STOP,
    MB_Halted,
    MB_Error,
    WAKEUP,
    SLEEP,
    DBG_WAKEUP,
    LOCKSTEP_MASTER_OUT,
    LOCKSTEP_SLAVE_IN,
    LOCKSTEP_OUT,
    INSTR,
    IREADY,
    IWAIT,
    ICE,
    IUE,
    INSTR_ADDR,
    IFETCH,
    I_AS,
    IPLB_M_ABort,
    IPLB_M_ABus,
    IPLB_M_UABus,
    IPLB_M_BE,
    IPLB_M_busLock,
    IPLB_M_lockErr,
    IPLB_M_MSize,
    IPLB_M_priority,
    IPLB_M_rdBurst,
    IPLB_M_request,
    IPLB_M_RNW,
    IPLB_M_size,
    IPLB_M_TAttribute,
    IPLB_M_type,
    IPLB_M_wrBurst,
    IPLB_M_wrDBus,
    IPLB_MBusy,
    IPLB_MRdErr,
    IPLB_MWrErr,
    IPLB_MIRQ,
    IPLB_MWrBTerm,
    IPLB_MWrDAck,
    IPLB_MAddrAck,
    IPLB_MRdBTerm,
    IPLB_MRdDAck,
    IPLB_MRdDBus,
    IPLB_MRdWdAddr,
    IPLB_MRearbitrate,
    IPLB_MSSize,
    IPLB_MTimeout,
    DATA_READ,
    DREADY,
    DWAIT,
    DCE,
    DUE,
    DATA_WRITE,
    DATA_ADDR,
    D_AS,
    READ_STROBE,
    WRITE_STROBE,
    BYTE_ENABLE,
    DPLB_M_ABort,
    DPLB_M_ABus,
    DPLB_M_UABus,
    DPLB_M_BE,
    DPLB_M_busLock,
    DPLB_M_lockErr,
    DPLB_M_MSize,
    DPLB_M_priority,
    DPLB_M_rdBurst,
    DPLB_M_request,
    DPLB_M_RNW,
    DPLB_M_size,
    DPLB_M_TAttribute,
    DPLB_M_type,
    DPLB_M_wrBurst,
    DPLB_M_wrDBus,
    DPLB_MBusy,
    DPLB_MRdErr,
    DPLB_MWrErr,
    DPLB_MIRQ,
    DPLB_MWrBTerm,
    DPLB_MWrDAck,
    DPLB_MAddrAck,
    DPLB_MRdBTerm,
    DPLB_MRdDAck,
    DPLB_MRdDBus,
    DPLB_MRdWdAddr,
    DPLB_MRearbitrate,
    DPLB_MSSize,
    DPLB_MTimeout,
    M_AXI_IP_AWID,
    M_AXI_IP_AWADDR,
    M_AXI_IP_AWLEN,
    M_AXI_IP_AWSIZE,
    M_AXI_IP_AWBURST,
    M_AXI_IP_AWLOCK,
    M_AXI_IP_AWCACHE,
    M_AXI_IP_AWPROT,
    M_AXI_IP_AWQOS,
    M_AXI_IP_AWVALID,
    M_AXI_IP_AWREADY,
    M_AXI_IP_WDATA,
    M_AXI_IP_WSTRB,
    M_AXI_IP_WLAST,
    M_AXI_IP_WVALID,
    M_AXI_IP_WREADY,
    M_AXI_IP_BID,
    M_AXI_IP_BRESP,
    M_AXI_IP_BVALID,
    M_AXI_IP_BREADY,
    M_AXI_IP_ARID,
    M_AXI_IP_ARADDR,
    M_AXI_IP_ARLEN,
    M_AXI_IP_ARSIZE,
    M_AXI_IP_ARBURST,
    M_AXI_IP_ARLOCK,
    M_AXI_IP_ARCACHE,
    M_AXI_IP_ARPROT,
    M_AXI_IP_ARQOS,
    M_AXI_IP_ARVALID,
    M_AXI_IP_ARREADY,
    M_AXI_IP_RID,
    M_AXI_IP_RDATA,
    M_AXI_IP_RRESP,
    M_AXI_IP_RLAST,
    M_AXI_IP_RVALID,
    M_AXI_IP_RREADY,
    M_AXI_DP_AWID,
    M_AXI_DP_AWADDR,
    M_AXI_DP_AWLEN,
    M_AXI_DP_AWSIZE,
    M_AXI_DP_AWBURST,
    M_AXI_DP_AWLOCK,
    M_AXI_DP_AWCACHE,
    M_AXI_DP_AWPROT,
    M_AXI_DP_AWQOS,
    M_AXI_DP_AWVALID,
    M_AXI_DP_AWREADY,
    M_AXI_DP_WDATA,
    M_AXI_DP_WSTRB,
    M_AXI_DP_WLAST,
    M_AXI_DP_WVALID,
    M_AXI_DP_WREADY,
    M_AXI_DP_BID,
    M_AXI_DP_BRESP,
    M_AXI_DP_BVALID,
    M_AXI_DP_BREADY,
    M_AXI_DP_ARID,
    M_AXI_DP_ARADDR,
    M_AXI_DP_ARLEN,
    M_AXI_DP_ARSIZE,
    M_AXI_DP_ARBURST,
    M_AXI_DP_ARLOCK,
    M_AXI_DP_ARCACHE,
    M_AXI_DP_ARPROT,
    M_AXI_DP_ARQOS,
    M_AXI_DP_ARVALID,
    M_AXI_DP_ARREADY,
    M_AXI_DP_RID,
    M_AXI_DP_RDATA,
    M_AXI_DP_RRESP,
    M_AXI_DP_RLAST,
    M_AXI_DP_RVALID,
    M_AXI_DP_RREADY,
    M_AXI_IC_AWID,
    M_AXI_IC_AWADDR,
    M_AXI_IC_AWLEN,
    M_AXI_IC_AWSIZE,
    M_AXI_IC_AWBURST,
    M_AXI_IC_AWLOCK,
    M_AXI_IC_AWCACHE,
    M_AXI_IC_AWPROT,
    M_AXI_IC_AWQOS,
    M_AXI_IC_AWVALID,
    M_AXI_IC_AWREADY,
    M_AXI_IC_AWUSER,
    M_AXI_IC_AWDOMAIN,
    M_AXI_IC_AWSNOOP,
    M_AXI_IC_AWBAR,
    M_AXI_IC_WDATA,
    M_AXI_IC_WSTRB,
    M_AXI_IC_WLAST,
    M_AXI_IC_WVALID,
    M_AXI_IC_WREADY,
    M_AXI_IC_WUSER,
    M_AXI_IC_BID,
    M_AXI_IC_BRESP,
    M_AXI_IC_BVALID,
    M_AXI_IC_BREADY,
    M_AXI_IC_BUSER,
    M_AXI_IC_WACK,
    M_AXI_IC_ARID,
    M_AXI_IC_ARADDR,
    M_AXI_IC_ARLEN,
    M_AXI_IC_ARSIZE,
    M_AXI_IC_ARBURST,
    M_AXI_IC_ARLOCK,
    M_AXI_IC_ARCACHE,
    M_AXI_IC_ARPROT,
    M_AXI_IC_ARQOS,
    M_AXI_IC_ARVALID,
    M_AXI_IC_ARREADY,
    M_AXI_IC_ARUSER,
    M_AXI_IC_ARDOMAIN,
    M_AXI_IC_ARSNOOP,
    M_AXI_IC_ARBAR,
    M_AXI_IC_RID,
    M_AXI_IC_RDATA,
    M_AXI_IC_RRESP,
    M_AXI_IC_RLAST,
    M_AXI_IC_RVALID,
    M_AXI_IC_RREADY,
    M_AXI_IC_RUSER,
    M_AXI_IC_RACK,
    M_AXI_IC_ACVALID,
    M_AXI_IC_ACADDR,
    M_AXI_IC_ACSNOOP,
    M_AXI_IC_ACPROT,
    M_AXI_IC_ACREADY,
    M_AXI_IC_CRREADY,
    M_AXI_IC_CRVALID,
    M_AXI_IC_CRRESP,
    M_AXI_IC_CDVALID,
    M_AXI_IC_CDREADY,
    M_AXI_IC_CDDATA,
    M_AXI_IC_CDLAST,
    M_AXI_DC_AWID,
    M_AXI_DC_AWADDR,
    M_AXI_DC_AWLEN,
    M_AXI_DC_AWSIZE,
    M_AXI_DC_AWBURST,
    M_AXI_DC_AWLOCK,
    M_AXI_DC_AWCACHE,
    M_AXI_DC_AWPROT,
    M_AXI_DC_AWQOS,
    M_AXI_DC_AWVALID,
    M_AXI_DC_AWREADY,
    M_AXI_DC_AWUSER,
    M_AXI_DC_AWDOMAIN,
    M_AXI_DC_AWSNOOP,
    M_AXI_DC_AWBAR,
    M_AXI_DC_WDATA,
    M_AXI_DC_WSTRB,
    M_AXI_DC_WLAST,
    M_AXI_DC_WVALID,
    M_AXI_DC_WREADY,
    M_AXI_DC_WUSER,
    M_AXI_DC_BID,
    M_AXI_DC_BRESP,
    M_AXI_DC_BVALID,
    M_AXI_DC_BREADY,
    M_AXI_DC_BUSER,
    M_AXI_DC_WACK,
    M_AXI_DC_ARID,
    M_AXI_DC_ARADDR,
    M_AXI_DC_ARLEN,
    M_AXI_DC_ARSIZE,
    M_AXI_DC_ARBURST,
    M_AXI_DC_ARLOCK,
    M_AXI_DC_ARCACHE,
    M_AXI_DC_ARPROT,
    M_AXI_DC_ARQOS,
    M_AXI_DC_ARVALID,
    M_AXI_DC_ARREADY,
    M_AXI_DC_ARUSER,
    M_AXI_DC_ARDOMAIN,
    M_AXI_DC_ARSNOOP,
    M_AXI_DC_ARBAR,
    M_AXI_DC_RID,
    M_AXI_DC_RDATA,
    M_AXI_DC_RRESP,
    M_AXI_DC_RLAST,
    M_AXI_DC_RVALID,
    M_AXI_DC_RREADY,
    M_AXI_DC_RUSER,
    M_AXI_DC_RACK,
    M_AXI_DC_ACVALID,
    M_AXI_DC_ACADDR,
    M_AXI_DC_ACSNOOP,
    M_AXI_DC_ACPROT,
    M_AXI_DC_ACREADY,
    M_AXI_DC_CRREADY,
    M_AXI_DC_CRVALID,
    M_AXI_DC_CRRESP,
    M_AXI_DC_CDVALID,
    M_AXI_DC_CDREADY,
    M_AXI_DC_CDDATA,
    M_AXI_DC_CDLAST,
    DBG_CLK,
    DBG_TDI,
    DBG_TDO,
    DBG_REG_EN,
    DBG_SHIFT,
    DBG_CAPTURE,
    DBG_UPDATE,
    DEBUG_RST,
    Trace_Instruction,
    Trace_Valid_Instr,
    Trace_PC,
    Trace_Reg_Write,
    Trace_Reg_Addr,
    Trace_MSR_Reg,
    Trace_PID_Reg,
    Trace_New_Reg_Value,
    Trace_Exception_Taken,
    Trace_Exception_Kind,
    Trace_Jump_Taken,
    Trace_Delay_Slot,
    Trace_Data_Address,
    Trace_Data_Access,
    Trace_Data_Read,
    Trace_Data_Write,
    Trace_Data_Write_Value,
    Trace_Data_Byte_Enable,
    Trace_DCache_Req,
    Trace_DCache_Hit,
    Trace_DCache_Rdy,
    Trace_DCache_Read,
    Trace_ICache_Req,
    Trace_ICache_Hit,
    Trace_ICache_Rdy,
    Trace_OF_PipeRun,
    Trace_EX_PipeRun,
    Trace_MEM_PipeRun,
    Trace_MB_Halted,
    Trace_Jump_Hit,
    FSL0_S_CLK,
    FSL0_S_READ,
    FSL0_S_DATA,
    FSL0_S_CONTROL,
    FSL0_S_EXISTS,
    FSL0_M_CLK,
    FSL0_M_WRITE,
    FSL0_M_DATA,
    FSL0_M_CONTROL,
    FSL0_M_FULL,
    FSL1_S_CLK,
    FSL1_S_READ,
    FSL1_S_DATA,
    FSL1_S_CONTROL,
    FSL1_S_EXISTS,
    FSL1_M_CLK,
    FSL1_M_WRITE,
    FSL1_M_DATA,
    FSL1_M_CONTROL,
    FSL1_M_FULL,
    FSL2_S_CLK,
    FSL2_S_READ,
    FSL2_S_DATA,
    FSL2_S_CONTROL,
    FSL2_S_EXISTS,
    FSL2_M_CLK,
    FSL2_M_WRITE,
    FSL2_M_DATA,
    FSL2_M_CONTROL,
    FSL2_M_FULL,
    FSL3_S_CLK,
    FSL3_S_READ,
    FSL3_S_DATA,
    FSL3_S_CONTROL,
    FSL3_S_EXISTS,
    FSL3_M_CLK,
    FSL3_M_WRITE,
    FSL3_M_DATA,
    FSL3_M_CONTROL,
    FSL3_M_FULL,
    FSL4_S_CLK,
    FSL4_S_READ,
    FSL4_S_DATA,
    FSL4_S_CONTROL,
    FSL4_S_EXISTS,
    FSL4_M_CLK,
    FSL4_M_WRITE,
    FSL4_M_DATA,
    FSL4_M_CONTROL,
    FSL4_M_FULL,
    FSL5_S_CLK,
    FSL5_S_READ,
    FSL5_S_DATA,
    FSL5_S_CONTROL,
    FSL5_S_EXISTS,
    FSL5_M_CLK,
    FSL5_M_WRITE,
    FSL5_M_DATA,
    FSL5_M_CONTROL,
    FSL5_M_FULL,
    FSL6_S_CLK,
    FSL6_S_READ,
    FSL6_S_DATA,
    FSL6_S_CONTROL,
    FSL6_S_EXISTS,
    FSL6_M_CLK,
    FSL6_M_WRITE,
    FSL6_M_DATA,
    FSL6_M_CONTROL,
    FSL6_M_FULL,
    FSL7_S_CLK,
    FSL7_S_READ,
    FSL7_S_DATA,
    FSL7_S_CONTROL,
    FSL7_S_EXISTS,
    FSL7_M_CLK,
    FSL7_M_WRITE,
    FSL7_M_DATA,
    FSL7_M_CONTROL,
    FSL7_M_FULL,
    FSL8_S_CLK,
    FSL8_S_READ,
    FSL8_S_DATA,
    FSL8_S_CONTROL,
    FSL8_S_EXISTS,
    FSL8_M_CLK,
    FSL8_M_WRITE,
    FSL8_M_DATA,
    FSL8_M_CONTROL,
    FSL8_M_FULL,
    FSL9_S_CLK,
    FSL9_S_READ,
    FSL9_S_DATA,
    FSL9_S_CONTROL,
    FSL9_S_EXISTS,
    FSL9_M_CLK,
    FSL9_M_WRITE,
    FSL9_M_DATA,
    FSL9_M_CONTROL,
    FSL9_M_FULL,
    FSL10_S_CLK,
    FSL10_S_READ,
    FSL10_S_DATA,
    FSL10_S_CONTROL,
    FSL10_S_EXISTS,
    FSL10_M_CLK,
    FSL10_M_WRITE,
    FSL10_M_DATA,
    FSL10_M_CONTROL,
    FSL10_M_FULL,
    FSL11_S_CLK,
    FSL11_S_READ,
    FSL11_S_DATA,
    FSL11_S_CONTROL,
    FSL11_S_EXISTS,
    FSL11_M_CLK,
    FSL11_M_WRITE,
    FSL11_M_DATA,
    FSL11_M_CONTROL,
    FSL11_M_FULL,
    FSL12_S_CLK,
    FSL12_S_READ,
    FSL12_S_DATA,
    FSL12_S_CONTROL,
    FSL12_S_EXISTS,
    FSL12_M_CLK,
    FSL12_M_WRITE,
    FSL12_M_DATA,
    FSL12_M_CONTROL,
    FSL12_M_FULL,
    FSL13_S_CLK,
    FSL13_S_READ,
    FSL13_S_DATA,
    FSL13_S_CONTROL,
    FSL13_S_EXISTS,
    FSL13_M_CLK,
    FSL13_M_WRITE,
    FSL13_M_DATA,
    FSL13_M_CONTROL,
    FSL13_M_FULL,
    FSL14_S_CLK,
    FSL14_S_READ,
    FSL14_S_DATA,
    FSL14_S_CONTROL,
    FSL14_S_EXISTS,
    FSL14_M_CLK,
    FSL14_M_WRITE,
    FSL14_M_DATA,
    FSL14_M_CONTROL,
    FSL14_M_FULL,
    FSL15_S_CLK,
    FSL15_S_READ,
    FSL15_S_DATA,
    FSL15_S_CONTROL,
    FSL15_S_EXISTS,
    FSL15_M_CLK,
    FSL15_M_WRITE,
    FSL15_M_DATA,
    FSL15_M_CONTROL,
    FSL15_M_FULL,
    M0_AXIS_TLAST,
    M0_AXIS_TDATA,
    M0_AXIS_TVALID,
    M0_AXIS_TREADY,
    S0_AXIS_TLAST,
    S0_AXIS_TDATA,
    S0_AXIS_TVALID,
    S0_AXIS_TREADY,
    M1_AXIS_TLAST,
    M1_AXIS_TDATA,
    M1_AXIS_TVALID,
    M1_AXIS_TREADY,
    S1_AXIS_TLAST,
    S1_AXIS_TDATA,
    S1_AXIS_TVALID,
    S1_AXIS_TREADY,
    M2_AXIS_TLAST,
    M2_AXIS_TDATA,
    M2_AXIS_TVALID,
    M2_AXIS_TREADY,
    S2_AXIS_TLAST,
    S2_AXIS_TDATA,
    S2_AXIS_TVALID,
    S2_AXIS_TREADY,
    M3_AXIS_TLAST,
    M3_AXIS_TDATA,
    M3_AXIS_TVALID,
    M3_AXIS_TREADY,
    S3_AXIS_TLAST,
    S3_AXIS_TDATA,
    S3_AXIS_TVALID,
    S3_AXIS_TREADY,
    M4_AXIS_TLAST,
    M4_AXIS_TDATA,
    M4_AXIS_TVALID,
    M4_AXIS_TREADY,
    S4_AXIS_TLAST,
    S4_AXIS_TDATA,
    S4_AXIS_TVALID,
    S4_AXIS_TREADY,
    M5_AXIS_TLAST,
    M5_AXIS_TDATA,
    M5_AXIS_TVALID,
    M5_AXIS_TREADY,
    S5_AXIS_TLAST,
    S5_AXIS_TDATA,
    S5_AXIS_TVALID,
    S5_AXIS_TREADY,
    M6_AXIS_TLAST,
    M6_AXIS_TDATA,
    M6_AXIS_TVALID,
    M6_AXIS_TREADY,
    S6_AXIS_TLAST,
    S6_AXIS_TDATA,
    S6_AXIS_TVALID,
    S6_AXIS_TREADY,
    M7_AXIS_TLAST,
    M7_AXIS_TDATA,
    M7_AXIS_TVALID,
    M7_AXIS_TREADY,
    S7_AXIS_TLAST,
    S7_AXIS_TDATA,
    S7_AXIS_TVALID,
    S7_AXIS_TREADY,
    M8_AXIS_TLAST,
    M8_AXIS_TDATA,
    M8_AXIS_TVALID,
    M8_AXIS_TREADY,
    S8_AXIS_TLAST,
    S8_AXIS_TDATA,
    S8_AXIS_TVALID,
    S8_AXIS_TREADY,
    M9_AXIS_TLAST,
    M9_AXIS_TDATA,
    M9_AXIS_TVALID,
    M9_AXIS_TREADY,
    S9_AXIS_TLAST,
    S9_AXIS_TDATA,
    S9_AXIS_TVALID,
    S9_AXIS_TREADY,
    M10_AXIS_TLAST,
    M10_AXIS_TDATA,
    M10_AXIS_TVALID,
    M10_AXIS_TREADY,
    S10_AXIS_TLAST,
    S10_AXIS_TDATA,
    S10_AXIS_TVALID,
    S10_AXIS_TREADY,
    M11_AXIS_TLAST,
    M11_AXIS_TDATA,
    M11_AXIS_TVALID,
    M11_AXIS_TREADY,
    S11_AXIS_TLAST,
    S11_AXIS_TDATA,
    S11_AXIS_TVALID,
    S11_AXIS_TREADY,
    M12_AXIS_TLAST,
    M12_AXIS_TDATA,
    M12_AXIS_TVALID,
    M12_AXIS_TREADY,
    S12_AXIS_TLAST,
    S12_AXIS_TDATA,
    S12_AXIS_TVALID,
    S12_AXIS_TREADY,
    M13_AXIS_TLAST,
    M13_AXIS_TDATA,
    M13_AXIS_TVALID,
    M13_AXIS_TREADY,
    S13_AXIS_TLAST,
    S13_AXIS_TDATA,
    S13_AXIS_TVALID,
    S13_AXIS_TREADY,
    M14_AXIS_TLAST,
    M14_AXIS_TDATA,
    M14_AXIS_TVALID,
    M14_AXIS_TREADY,
    S14_AXIS_TLAST,
    S14_AXIS_TDATA,
    S14_AXIS_TVALID,
    S14_AXIS_TREADY,
    M15_AXIS_TLAST,
    M15_AXIS_TDATA,
    M15_AXIS_TVALID,
    M15_AXIS_TREADY,
    S15_AXIS_TLAST,
    S15_AXIS_TDATA,
    S15_AXIS_TVALID,
    S15_AXIS_TREADY,
    ICACHE_FSL_IN_CLK,
    ICACHE_FSL_IN_READ,
    ICACHE_FSL_IN_DATA,
    ICACHE_FSL_IN_CONTROL,
    ICACHE_FSL_IN_EXISTS,
    ICACHE_FSL_OUT_CLK,
    ICACHE_FSL_OUT_WRITE,
    ICACHE_FSL_OUT_DATA,
    ICACHE_FSL_OUT_CONTROL,
    ICACHE_FSL_OUT_FULL,
    DCACHE_FSL_IN_CLK,
    DCACHE_FSL_IN_READ,
    DCACHE_FSL_IN_DATA,
    DCACHE_FSL_IN_CONTROL,
    DCACHE_FSL_IN_EXISTS,
    DCACHE_FSL_OUT_CLK,
    DCACHE_FSL_OUT_WRITE,
    DCACHE_FSL_OUT_DATA,
    DCACHE_FSL_OUT_CONTROL,
    DCACHE_FSL_OUT_FULL
  );
  input CLK;
  input RESET;
  input MB_RESET;
  input INTERRUPT;
  input [0:31] INTERRUPT_ADDRESS;
  output [0:1] INTERRUPT_ACK;
  input EXT_BRK;
  input EXT_NM_BRK;
  input DBG_STOP;
  output MB_Halted;
  output MB_Error;
  input [0:1] WAKEUP;
  output SLEEP;
  output DBG_WAKEUP;
  output [0:4095] LOCKSTEP_MASTER_OUT;
  input [0:4095] LOCKSTEP_SLAVE_IN;
  output [0:4095] LOCKSTEP_OUT;
  input [0:31] INSTR;
  input IREADY;
  input IWAIT;
  input ICE;
  input IUE;
  output [0:31] INSTR_ADDR;
  output IFETCH;
  output I_AS;
  output IPLB_M_ABort;
  output [0:31] IPLB_M_ABus;
  output [0:31] IPLB_M_UABus;
  output [0:3] IPLB_M_BE;
  output IPLB_M_busLock;
  output IPLB_M_lockErr;
  output [0:1] IPLB_M_MSize;
  output [0:1] IPLB_M_priority;
  output IPLB_M_rdBurst;
  output IPLB_M_request;
  output IPLB_M_RNW;
  output [0:3] IPLB_M_size;
  output [0:15] IPLB_M_TAttribute;
  output [0:2] IPLB_M_type;
  output IPLB_M_wrBurst;
  output [0:31] IPLB_M_wrDBus;
  input IPLB_MBusy;
  input IPLB_MRdErr;
  input IPLB_MWrErr;
  input IPLB_MIRQ;
  input IPLB_MWrBTerm;
  input IPLB_MWrDAck;
  input IPLB_MAddrAck;
  input IPLB_MRdBTerm;
  input IPLB_MRdDAck;
  input [0:31] IPLB_MRdDBus;
  input [0:3] IPLB_MRdWdAddr;
  input IPLB_MRearbitrate;
  input [0:1] IPLB_MSSize;
  input IPLB_MTimeout;
  input [0:31] DATA_READ;
  input DREADY;
  input DWAIT;
  input DCE;
  input DUE;
  output [0:31] DATA_WRITE;
  output [0:31] DATA_ADDR;
  output D_AS;
  output READ_STROBE;
  output WRITE_STROBE;
  output [0:3] BYTE_ENABLE;
  output DPLB_M_ABort;
  output [0:31] DPLB_M_ABus;
  output [0:31] DPLB_M_UABus;
  output [0:3] DPLB_M_BE;
  output DPLB_M_busLock;
  output DPLB_M_lockErr;
  output [0:1] DPLB_M_MSize;
  output [0:1] DPLB_M_priority;
  output DPLB_M_rdBurst;
  output DPLB_M_request;
  output DPLB_M_RNW;
  output [0:3] DPLB_M_size;
  output [0:15] DPLB_M_TAttribute;
  output [0:2] DPLB_M_type;
  output DPLB_M_wrBurst;
  output [0:31] DPLB_M_wrDBus;
  input DPLB_MBusy;
  input DPLB_MRdErr;
  input DPLB_MWrErr;
  input DPLB_MIRQ;
  input DPLB_MWrBTerm;
  input DPLB_MWrDAck;
  input DPLB_MAddrAck;
  input DPLB_MRdBTerm;
  input DPLB_MRdDAck;
  input [0:31] DPLB_MRdDBus;
  input [0:3] DPLB_MRdWdAddr;
  input DPLB_MRearbitrate;
  input [0:1] DPLB_MSSize;
  input DPLB_MTimeout;
  output [0:0] M_AXI_IP_AWID;
  output [31:0] M_AXI_IP_AWADDR;
  output [7:0] M_AXI_IP_AWLEN;
  output [2:0] M_AXI_IP_AWSIZE;
  output [1:0] M_AXI_IP_AWBURST;
  output M_AXI_IP_AWLOCK;
  output [3:0] M_AXI_IP_AWCACHE;
  output [2:0] M_AXI_IP_AWPROT;
  output [3:0] M_AXI_IP_AWQOS;
  output M_AXI_IP_AWVALID;
  input M_AXI_IP_AWREADY;
  output [31:0] M_AXI_IP_WDATA;
  output [3:0] M_AXI_IP_WSTRB;
  output M_AXI_IP_WLAST;
  output M_AXI_IP_WVALID;
  input M_AXI_IP_WREADY;
  input [0:0] M_AXI_IP_BID;
  input [1:0] M_AXI_IP_BRESP;
  input M_AXI_IP_BVALID;
  output M_AXI_IP_BREADY;
  output [0:0] M_AXI_IP_ARID;
  output [31:0] M_AXI_IP_ARADDR;
  output [7:0] M_AXI_IP_ARLEN;
  output [2:0] M_AXI_IP_ARSIZE;
  output [1:0] M_AXI_IP_ARBURST;
  output M_AXI_IP_ARLOCK;
  output [3:0] M_AXI_IP_ARCACHE;
  output [2:0] M_AXI_IP_ARPROT;
  output [3:0] M_AXI_IP_ARQOS;
  output M_AXI_IP_ARVALID;
  input M_AXI_IP_ARREADY;
  input [0:0] M_AXI_IP_RID;
  input [31:0] M_AXI_IP_RDATA;
  input [1:0] M_AXI_IP_RRESP;
  input M_AXI_IP_RLAST;
  input M_AXI_IP_RVALID;
  output M_AXI_IP_RREADY;
  output [0:0] M_AXI_DP_AWID;
  output [31:0] M_AXI_DP_AWADDR;
  output [7:0] M_AXI_DP_AWLEN;
  output [2:0] M_AXI_DP_AWSIZE;
  output [1:0] M_AXI_DP_AWBURST;
  output M_AXI_DP_AWLOCK;
  output [3:0] M_AXI_DP_AWCACHE;
  output [2:0] M_AXI_DP_AWPROT;
  output [3:0] M_AXI_DP_AWQOS;
  output M_AXI_DP_AWVALID;
  input M_AXI_DP_AWREADY;
  output [31:0] M_AXI_DP_WDATA;
  output [3:0] M_AXI_DP_WSTRB;
  output M_AXI_DP_WLAST;
  output M_AXI_DP_WVALID;
  input M_AXI_DP_WREADY;
  input [0:0] M_AXI_DP_BID;
  input [1:0] M_AXI_DP_BRESP;
  input M_AXI_DP_BVALID;
  output M_AXI_DP_BREADY;
  output [0:0] M_AXI_DP_ARID;
  output [31:0] M_AXI_DP_ARADDR;
  output [7:0] M_AXI_DP_ARLEN;
  output [2:0] M_AXI_DP_ARSIZE;
  output [1:0] M_AXI_DP_ARBURST;
  output M_AXI_DP_ARLOCK;
  output [3:0] M_AXI_DP_ARCACHE;
  output [2:0] M_AXI_DP_ARPROT;
  output [3:0] M_AXI_DP_ARQOS;
  output M_AXI_DP_ARVALID;
  input M_AXI_DP_ARREADY;
  input [0:0] M_AXI_DP_RID;
  input [31:0] M_AXI_DP_RDATA;
  input [1:0] M_AXI_DP_RRESP;
  input M_AXI_DP_RLAST;
  input M_AXI_DP_RVALID;
  output M_AXI_DP_RREADY;
  output [0:0] M_AXI_IC_AWID;
  output [31:0] M_AXI_IC_AWADDR;
  output [7:0] M_AXI_IC_AWLEN;
  output [2:0] M_AXI_IC_AWSIZE;
  output [1:0] M_AXI_IC_AWBURST;
  output M_AXI_IC_AWLOCK;
  output [3:0] M_AXI_IC_AWCACHE;
  output [2:0] M_AXI_IC_AWPROT;
  output [3:0] M_AXI_IC_AWQOS;
  output M_AXI_IC_AWVALID;
  input M_AXI_IC_AWREADY;
  output [4:0] M_AXI_IC_AWUSER;
  output [1:0] M_AXI_IC_AWDOMAIN;
  output [2:0] M_AXI_IC_AWSNOOP;
  output [1:0] M_AXI_IC_AWBAR;
  output [31:0] M_AXI_IC_WDATA;
  output [3:0] M_AXI_IC_WSTRB;
  output M_AXI_IC_WLAST;
  output M_AXI_IC_WVALID;
  input M_AXI_IC_WREADY;
  output [0:0] M_AXI_IC_WUSER;
  input [0:0] M_AXI_IC_BID;
  input [1:0] M_AXI_IC_BRESP;
  input M_AXI_IC_BVALID;
  output M_AXI_IC_BREADY;
  input [0:0] M_AXI_IC_BUSER;
  output M_AXI_IC_WACK;
  output [0:0] M_AXI_IC_ARID;
  output [31:0] M_AXI_IC_ARADDR;
  output [7:0] M_AXI_IC_ARLEN;
  output [2:0] M_AXI_IC_ARSIZE;
  output [1:0] M_AXI_IC_ARBURST;
  output M_AXI_IC_ARLOCK;
  output [3:0] M_AXI_IC_ARCACHE;
  output [2:0] M_AXI_IC_ARPROT;
  output [3:0] M_AXI_IC_ARQOS;
  output M_AXI_IC_ARVALID;
  input M_AXI_IC_ARREADY;
  output [4:0] M_AXI_IC_ARUSER;
  output [1:0] M_AXI_IC_ARDOMAIN;
  output [3:0] M_AXI_IC_ARSNOOP;
  output [1:0] M_AXI_IC_ARBAR;
  input [0:0] M_AXI_IC_RID;
  input [31:0] M_AXI_IC_RDATA;
  input [1:0] M_AXI_IC_RRESP;
  input M_AXI_IC_RLAST;
  input M_AXI_IC_RVALID;
  output M_AXI_IC_RREADY;
  input [0:0] M_AXI_IC_RUSER;
  output M_AXI_IC_RACK;
  input M_AXI_IC_ACVALID;
  input [31:0] M_AXI_IC_ACADDR;
  input [3:0] M_AXI_IC_ACSNOOP;
  input [2:0] M_AXI_IC_ACPROT;
  output M_AXI_IC_ACREADY;
  input M_AXI_IC_CRREADY;
  output M_AXI_IC_CRVALID;
  output [4:0] M_AXI_IC_CRRESP;
  output M_AXI_IC_CDVALID;
  input M_AXI_IC_CDREADY;
  output [31:0] M_AXI_IC_CDDATA;
  output M_AXI_IC_CDLAST;
  output [0:0] M_AXI_DC_AWID;
  output [31:0] M_AXI_DC_AWADDR;
  output [7:0] M_AXI_DC_AWLEN;
  output [2:0] M_AXI_DC_AWSIZE;
  output [1:0] M_AXI_DC_AWBURST;
  output M_AXI_DC_AWLOCK;
  output [3:0] M_AXI_DC_AWCACHE;
  output [2:0] M_AXI_DC_AWPROT;
  output [3:0] M_AXI_DC_AWQOS;
  output M_AXI_DC_AWVALID;
  input M_AXI_DC_AWREADY;
  output [4:0] M_AXI_DC_AWUSER;
  output [1:0] M_AXI_DC_AWDOMAIN;
  output [2:0] M_AXI_DC_AWSNOOP;
  output [1:0] M_AXI_DC_AWBAR;
  output [31:0] M_AXI_DC_WDATA;
  output [3:0] M_AXI_DC_WSTRB;
  output M_AXI_DC_WLAST;
  output M_AXI_DC_WVALID;
  input M_AXI_DC_WREADY;
  output [0:0] M_AXI_DC_WUSER;
  input [0:0] M_AXI_DC_BID;
  input [1:0] M_AXI_DC_BRESP;
  input M_AXI_DC_BVALID;
  output M_AXI_DC_BREADY;
  input [0:0] M_AXI_DC_BUSER;
  output M_AXI_DC_WACK;
  output [0:0] M_AXI_DC_ARID;
  output [31:0] M_AXI_DC_ARADDR;
  output [7:0] M_AXI_DC_ARLEN;
  output [2:0] M_AXI_DC_ARSIZE;
  output [1:0] M_AXI_DC_ARBURST;
  output M_AXI_DC_ARLOCK;
  output [3:0] M_AXI_DC_ARCACHE;
  output [2:0] M_AXI_DC_ARPROT;
  output [3:0] M_AXI_DC_ARQOS;
  output M_AXI_DC_ARVALID;
  input M_AXI_DC_ARREADY;
  output [4:0] M_AXI_DC_ARUSER;
  output [1:0] M_AXI_DC_ARDOMAIN;
  output [3:0] M_AXI_DC_ARSNOOP;
  output [1:0] M_AXI_DC_ARBAR;
  input [0:0] M_AXI_DC_RID;
  input [31:0] M_AXI_DC_RDATA;
  input [1:0] M_AXI_DC_RRESP;
  input M_AXI_DC_RLAST;
  input M_AXI_DC_RVALID;
  output M_AXI_DC_RREADY;
  input [0:0] M_AXI_DC_RUSER;
  output M_AXI_DC_RACK;
  input M_AXI_DC_ACVALID;
  input [31:0] M_AXI_DC_ACADDR;
  input [3:0] M_AXI_DC_ACSNOOP;
  input [2:0] M_AXI_DC_ACPROT;
  output M_AXI_DC_ACREADY;
  input M_AXI_DC_CRREADY;
  output M_AXI_DC_CRVALID;
  output [4:0] M_AXI_DC_CRRESP;
  output M_AXI_DC_CDVALID;
  input M_AXI_DC_CDREADY;
  output [31:0] M_AXI_DC_CDDATA;
  output M_AXI_DC_CDLAST;
  input DBG_CLK;
  input DBG_TDI;
  output DBG_TDO;
  input [0:7] DBG_REG_EN;
  input DBG_SHIFT;
  input DBG_CAPTURE;
  input DBG_UPDATE;
  input DEBUG_RST;
  output [0:31] Trace_Instruction;
  output Trace_Valid_Instr;
  output [0:31] Trace_PC;
  output Trace_Reg_Write;
  output [0:4] Trace_Reg_Addr;
  output [0:14] Trace_MSR_Reg;
  output [0:7] Trace_PID_Reg;
  output [0:31] Trace_New_Reg_Value;
  output Trace_Exception_Taken;
  output [0:4] Trace_Exception_Kind;
  output Trace_Jump_Taken;
  output Trace_Delay_Slot;
  output [0:31] Trace_Data_Address;
  output Trace_Data_Access;
  output Trace_Data_Read;
  output Trace_Data_Write;
  output [0:31] Trace_Data_Write_Value;
  output [0:3] Trace_Data_Byte_Enable;
  output Trace_DCache_Req;
  output Trace_DCache_Hit;
  output Trace_DCache_Rdy;
  output Trace_DCache_Read;
  output Trace_ICache_Req;
  output Trace_ICache_Hit;
  output Trace_ICache_Rdy;
  output Trace_OF_PipeRun;
  output Trace_EX_PipeRun;
  output Trace_MEM_PipeRun;
  output Trace_MB_Halted;
  output Trace_Jump_Hit;
  output FSL0_S_CLK;
  output FSL0_S_READ;
  input [0:31] FSL0_S_DATA;
  input FSL0_S_CONTROL;
  input FSL0_S_EXISTS;
  output FSL0_M_CLK;
  output FSL0_M_WRITE;
  output [0:31] FSL0_M_DATA;
  output FSL0_M_CONTROL;
  input FSL0_M_FULL;
  output FSL1_S_CLK;
  output FSL1_S_READ;
  input [0:31] FSL1_S_DATA;
  input FSL1_S_CONTROL;
  input FSL1_S_EXISTS;
  output FSL1_M_CLK;
  output FSL1_M_WRITE;
  output [0:31] FSL1_M_DATA;
  output FSL1_M_CONTROL;
  input FSL1_M_FULL;
  output FSL2_S_CLK;
  output FSL2_S_READ;
  input [0:31] FSL2_S_DATA;
  input FSL2_S_CONTROL;
  input FSL2_S_EXISTS;
  output FSL2_M_CLK;
  output FSL2_M_WRITE;
  output [0:31] FSL2_M_DATA;
  output FSL2_M_CONTROL;
  input FSL2_M_FULL;
  output FSL3_S_CLK;
  output FSL3_S_READ;
  input [0:31] FSL3_S_DATA;
  input FSL3_S_CONTROL;
  input FSL3_S_EXISTS;
  output FSL3_M_CLK;
  output FSL3_M_WRITE;
  output [0:31] FSL3_M_DATA;
  output FSL3_M_CONTROL;
  input FSL3_M_FULL;
  output FSL4_S_CLK;
  output FSL4_S_READ;
  input [0:31] FSL4_S_DATA;
  input FSL4_S_CONTROL;
  input FSL4_S_EXISTS;
  output FSL4_M_CLK;
  output FSL4_M_WRITE;
  output [0:31] FSL4_M_DATA;
  output FSL4_M_CONTROL;
  input FSL4_M_FULL;
  output FSL5_S_CLK;
  output FSL5_S_READ;
  input [0:31] FSL5_S_DATA;
  input FSL5_S_CONTROL;
  input FSL5_S_EXISTS;
  output FSL5_M_CLK;
  output FSL5_M_WRITE;
  output [0:31] FSL5_M_DATA;
  output FSL5_M_CONTROL;
  input FSL5_M_FULL;
  output FSL6_S_CLK;
  output FSL6_S_READ;
  input [0:31] FSL6_S_DATA;
  input FSL6_S_CONTROL;
  input FSL6_S_EXISTS;
  output FSL6_M_CLK;
  output FSL6_M_WRITE;
  output [0:31] FSL6_M_DATA;
  output FSL6_M_CONTROL;
  input FSL6_M_FULL;
  output FSL7_S_CLK;
  output FSL7_S_READ;
  input [0:31] FSL7_S_DATA;
  input FSL7_S_CONTROL;
  input FSL7_S_EXISTS;
  output FSL7_M_CLK;
  output FSL7_M_WRITE;
  output [0:31] FSL7_M_DATA;
  output FSL7_M_CONTROL;
  input FSL7_M_FULL;
  output FSL8_S_CLK;
  output FSL8_S_READ;
  input [0:31] FSL8_S_DATA;
  input FSL8_S_CONTROL;
  input FSL8_S_EXISTS;
  output FSL8_M_CLK;
  output FSL8_M_WRITE;
  output [0:31] FSL8_M_DATA;
  output FSL8_M_CONTROL;
  input FSL8_M_FULL;
  output FSL9_S_CLK;
  output FSL9_S_READ;
  input [0:31] FSL9_S_DATA;
  input FSL9_S_CONTROL;
  input FSL9_S_EXISTS;
  output FSL9_M_CLK;
  output FSL9_M_WRITE;
  output [0:31] FSL9_M_DATA;
  output FSL9_M_CONTROL;
  input FSL9_M_FULL;
  output FSL10_S_CLK;
  output FSL10_S_READ;
  input [0:31] FSL10_S_DATA;
  input FSL10_S_CONTROL;
  input FSL10_S_EXISTS;
  output FSL10_M_CLK;
  output FSL10_M_WRITE;
  output [0:31] FSL10_M_DATA;
  output FSL10_M_CONTROL;
  input FSL10_M_FULL;
  output FSL11_S_CLK;
  output FSL11_S_READ;
  input [0:31] FSL11_S_DATA;
  input FSL11_S_CONTROL;
  input FSL11_S_EXISTS;
  output FSL11_M_CLK;
  output FSL11_M_WRITE;
  output [0:31] FSL11_M_DATA;
  output FSL11_M_CONTROL;
  input FSL11_M_FULL;
  output FSL12_S_CLK;
  output FSL12_S_READ;
  input [0:31] FSL12_S_DATA;
  input FSL12_S_CONTROL;
  input FSL12_S_EXISTS;
  output FSL12_M_CLK;
  output FSL12_M_WRITE;
  output [0:31] FSL12_M_DATA;
  output FSL12_M_CONTROL;
  input FSL12_M_FULL;
  output FSL13_S_CLK;
  output FSL13_S_READ;
  input [0:31] FSL13_S_DATA;
  input FSL13_S_CONTROL;
  input FSL13_S_EXISTS;
  output FSL13_M_CLK;
  output FSL13_M_WRITE;
  output [0:31] FSL13_M_DATA;
  output FSL13_M_CONTROL;
  input FSL13_M_FULL;
  output FSL14_S_CLK;
  output FSL14_S_READ;
  input [0:31] FSL14_S_DATA;
  input FSL14_S_CONTROL;
  input FSL14_S_EXISTS;
  output FSL14_M_CLK;
  output FSL14_M_WRITE;
  output [0:31] FSL14_M_DATA;
  output FSL14_M_CONTROL;
  input FSL14_M_FULL;
  output FSL15_S_CLK;
  output FSL15_S_READ;
  input [0:31] FSL15_S_DATA;
  input FSL15_S_CONTROL;
  input FSL15_S_EXISTS;
  output FSL15_M_CLK;
  output FSL15_M_WRITE;
  output [0:31] FSL15_M_DATA;
  output FSL15_M_CONTROL;
  input FSL15_M_FULL;
  output M0_AXIS_TLAST;
  output [31:0] M0_AXIS_TDATA;
  output M0_AXIS_TVALID;
  input M0_AXIS_TREADY;
  input S0_AXIS_TLAST;
  input [31:0] S0_AXIS_TDATA;
  input S0_AXIS_TVALID;
  output S0_AXIS_TREADY;
  output M1_AXIS_TLAST;
  output [31:0] M1_AXIS_TDATA;
  output M1_AXIS_TVALID;
  input M1_AXIS_TREADY;
  input S1_AXIS_TLAST;
  input [31:0] S1_AXIS_TDATA;
  input S1_AXIS_TVALID;
  output S1_AXIS_TREADY;
  output M2_AXIS_TLAST;
  output [31:0] M2_AXIS_TDATA;
  output M2_AXIS_TVALID;
  input M2_AXIS_TREADY;
  input S2_AXIS_TLAST;
  input [31:0] S2_AXIS_TDATA;
  input S2_AXIS_TVALID;
  output S2_AXIS_TREADY;
  output M3_AXIS_TLAST;
  output [31:0] M3_AXIS_TDATA;
  output M3_AXIS_TVALID;
  input M3_AXIS_TREADY;
  input S3_AXIS_TLAST;
  input [31:0] S3_AXIS_TDATA;
  input S3_AXIS_TVALID;
  output S3_AXIS_TREADY;
  output M4_AXIS_TLAST;
  output [31:0] M4_AXIS_TDATA;
  output M4_AXIS_TVALID;
  input M4_AXIS_TREADY;
  input S4_AXIS_TLAST;
  input [31:0] S4_AXIS_TDATA;
  input S4_AXIS_TVALID;
  output S4_AXIS_TREADY;
  output M5_AXIS_TLAST;
  output [31:0] M5_AXIS_TDATA;
  output M5_AXIS_TVALID;
  input M5_AXIS_TREADY;
  input S5_AXIS_TLAST;
  input [31:0] S5_AXIS_TDATA;
  input S5_AXIS_TVALID;
  output S5_AXIS_TREADY;
  output M6_AXIS_TLAST;
  output [31:0] M6_AXIS_TDATA;
  output M6_AXIS_TVALID;
  input M6_AXIS_TREADY;
  input S6_AXIS_TLAST;
  input [31:0] S6_AXIS_TDATA;
  input S6_AXIS_TVALID;
  output S6_AXIS_TREADY;
  output M7_AXIS_TLAST;
  output [31:0] M7_AXIS_TDATA;
  output M7_AXIS_TVALID;
  input M7_AXIS_TREADY;
  input S7_AXIS_TLAST;
  input [31:0] S7_AXIS_TDATA;
  input S7_AXIS_TVALID;
  output S7_AXIS_TREADY;
  output M8_AXIS_TLAST;
  output [31:0] M8_AXIS_TDATA;
  output M8_AXIS_TVALID;
  input M8_AXIS_TREADY;
  input S8_AXIS_TLAST;
  input [31:0] S8_AXIS_TDATA;
  input S8_AXIS_TVALID;
  output S8_AXIS_TREADY;
  output M9_AXIS_TLAST;
  output [31:0] M9_AXIS_TDATA;
  output M9_AXIS_TVALID;
  input M9_AXIS_TREADY;
  input S9_AXIS_TLAST;
  input [31:0] S9_AXIS_TDATA;
  input S9_AXIS_TVALID;
  output S9_AXIS_TREADY;
  output M10_AXIS_TLAST;
  output [31:0] M10_AXIS_TDATA;
  output M10_AXIS_TVALID;
  input M10_AXIS_TREADY;
  input S10_AXIS_TLAST;
  input [31:0] S10_AXIS_TDATA;
  input S10_AXIS_TVALID;
  output S10_AXIS_TREADY;
  output M11_AXIS_TLAST;
  output [31:0] M11_AXIS_TDATA;
  output M11_AXIS_TVALID;
  input M11_AXIS_TREADY;
  input S11_AXIS_TLAST;
  input [31:0] S11_AXIS_TDATA;
  input S11_AXIS_TVALID;
  output S11_AXIS_TREADY;
  output M12_AXIS_TLAST;
  output [31:0] M12_AXIS_TDATA;
  output M12_AXIS_TVALID;
  input M12_AXIS_TREADY;
  input S12_AXIS_TLAST;
  input [31:0] S12_AXIS_TDATA;
  input S12_AXIS_TVALID;
  output S12_AXIS_TREADY;
  output M13_AXIS_TLAST;
  output [31:0] M13_AXIS_TDATA;
  output M13_AXIS_TVALID;
  input M13_AXIS_TREADY;
  input S13_AXIS_TLAST;
  input [31:0] S13_AXIS_TDATA;
  input S13_AXIS_TVALID;
  output S13_AXIS_TREADY;
  output M14_AXIS_TLAST;
  output [31:0] M14_AXIS_TDATA;
  output M14_AXIS_TVALID;
  input M14_AXIS_TREADY;
  input S14_AXIS_TLAST;
  input [31:0] S14_AXIS_TDATA;
  input S14_AXIS_TVALID;
  output S14_AXIS_TREADY;
  output M15_AXIS_TLAST;
  output [31:0] M15_AXIS_TDATA;
  output M15_AXIS_TVALID;
  input M15_AXIS_TREADY;
  input S15_AXIS_TLAST;
  input [31:0] S15_AXIS_TDATA;
  input S15_AXIS_TVALID;
  output S15_AXIS_TREADY;
  output ICACHE_FSL_IN_CLK;
  output ICACHE_FSL_IN_READ;
  input [0:31] ICACHE_FSL_IN_DATA;
  input ICACHE_FSL_IN_CONTROL;
  input ICACHE_FSL_IN_EXISTS;
  output ICACHE_FSL_OUT_CLK;
  output ICACHE_FSL_OUT_WRITE;
  output [0:31] ICACHE_FSL_OUT_DATA;
  output ICACHE_FSL_OUT_CONTROL;
  input ICACHE_FSL_OUT_FULL;
  output DCACHE_FSL_IN_CLK;
  output DCACHE_FSL_IN_READ;
  input [0:31] DCACHE_FSL_IN_DATA;
  input DCACHE_FSL_IN_CONTROL;
  input DCACHE_FSL_IN_EXISTS;
  output DCACHE_FSL_OUT_CLK;
  output DCACHE_FSL_OUT_WRITE;
  output [0:31] DCACHE_FSL_OUT_DATA;
  output DCACHE_FSL_OUT_CONTROL;
  input DCACHE_FSL_OUT_FULL;
endmodule

module SensorMP_debug_module_0_wrapper
  (
    Interrupt,
    Debug_SYS_Rst,
    Ext_BRK,
    Ext_NM_BRK,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    SPLB_Clk,
    SPLB_Rst,
    PLB_ABus,
    PLB_UABus,
    PLB_PAValid,
    PLB_SAValid,
    PLB_rdPrim,
    PLB_wrPrim,
    PLB_masterID,
    PLB_abort,
    PLB_busLock,
    PLB_RNW,
    PLB_BE,
    PLB_MSize,
    PLB_size,
    PLB_type,
    PLB_lockErr,
    PLB_wrDBus,
    PLB_wrBurst,
    PLB_rdBurst,
    PLB_wrPendReq,
    PLB_rdPendReq,
    PLB_wrPendPri,
    PLB_rdPendPri,
    PLB_reqPri,
    PLB_TAttribute,
    Sl_addrAck,
    Sl_SSize,
    Sl_wait,
    Sl_rearbitrate,
    Sl_wrDAck,
    Sl_wrComp,
    Sl_wrBTerm,
    Sl_rdDBus,
    Sl_rdWdAddr,
    Sl_rdDAck,
    Sl_rdComp,
    Sl_rdBTerm,
    Sl_MBusy,
    Sl_MWrErr,
    Sl_MRdErr,
    Sl_MIRQ,
    Dbg_Clk_0,
    Dbg_TDI_0,
    Dbg_TDO_0,
    Dbg_Reg_En_0,
    Dbg_Capture_0,
    Dbg_Shift_0,
    Dbg_Update_0,
    Dbg_Rst_0,
    Dbg_Clk_1,
    Dbg_TDI_1,
    Dbg_TDO_1,
    Dbg_Reg_En_1,
    Dbg_Capture_1,
    Dbg_Shift_1,
    Dbg_Update_1,
    Dbg_Rst_1,
    Dbg_Clk_2,
    Dbg_TDI_2,
    Dbg_TDO_2,
    Dbg_Reg_En_2,
    Dbg_Capture_2,
    Dbg_Shift_2,
    Dbg_Update_2,
    Dbg_Rst_2,
    Dbg_Clk_3,
    Dbg_TDI_3,
    Dbg_TDO_3,
    Dbg_Reg_En_3,
    Dbg_Capture_3,
    Dbg_Shift_3,
    Dbg_Update_3,
    Dbg_Rst_3,
    Dbg_Clk_4,
    Dbg_TDI_4,
    Dbg_TDO_4,
    Dbg_Reg_En_4,
    Dbg_Capture_4,
    Dbg_Shift_4,
    Dbg_Update_4,
    Dbg_Rst_4,
    Dbg_Clk_5,
    Dbg_TDI_5,
    Dbg_TDO_5,
    Dbg_Reg_En_5,
    Dbg_Capture_5,
    Dbg_Shift_5,
    Dbg_Update_5,
    Dbg_Rst_5,
    Dbg_Clk_6,
    Dbg_TDI_6,
    Dbg_TDO_6,
    Dbg_Reg_En_6,
    Dbg_Capture_6,
    Dbg_Shift_6,
    Dbg_Update_6,
    Dbg_Rst_6,
    Dbg_Clk_7,
    Dbg_TDI_7,
    Dbg_TDO_7,
    Dbg_Reg_En_7,
    Dbg_Capture_7,
    Dbg_Shift_7,
    Dbg_Update_7,
    Dbg_Rst_7,
    Dbg_Clk_8,
    Dbg_TDI_8,
    Dbg_TDO_8,
    Dbg_Reg_En_8,
    Dbg_Capture_8,
    Dbg_Shift_8,
    Dbg_Update_8,
    Dbg_Rst_8,
    Dbg_Clk_9,
    Dbg_TDI_9,
    Dbg_TDO_9,
    Dbg_Reg_En_9,
    Dbg_Capture_9,
    Dbg_Shift_9,
    Dbg_Update_9,
    Dbg_Rst_9,
    Dbg_Clk_10,
    Dbg_TDI_10,
    Dbg_TDO_10,
    Dbg_Reg_En_10,
    Dbg_Capture_10,
    Dbg_Shift_10,
    Dbg_Update_10,
    Dbg_Rst_10,
    Dbg_Clk_11,
    Dbg_TDI_11,
    Dbg_TDO_11,
    Dbg_Reg_En_11,
    Dbg_Capture_11,
    Dbg_Shift_11,
    Dbg_Update_11,
    Dbg_Rst_11,
    Dbg_Clk_12,
    Dbg_TDI_12,
    Dbg_TDO_12,
    Dbg_Reg_En_12,
    Dbg_Capture_12,
    Dbg_Shift_12,
    Dbg_Update_12,
    Dbg_Rst_12,
    Dbg_Clk_13,
    Dbg_TDI_13,
    Dbg_TDO_13,
    Dbg_Reg_En_13,
    Dbg_Capture_13,
    Dbg_Shift_13,
    Dbg_Update_13,
    Dbg_Rst_13,
    Dbg_Clk_14,
    Dbg_TDI_14,
    Dbg_TDO_14,
    Dbg_Reg_En_14,
    Dbg_Capture_14,
    Dbg_Shift_14,
    Dbg_Update_14,
    Dbg_Rst_14,
    Dbg_Clk_15,
    Dbg_TDI_15,
    Dbg_TDO_15,
    Dbg_Reg_En_15,
    Dbg_Capture_15,
    Dbg_Shift_15,
    Dbg_Update_15,
    Dbg_Rst_15,
    Dbg_Clk_16,
    Dbg_TDI_16,
    Dbg_TDO_16,
    Dbg_Reg_En_16,
    Dbg_Capture_16,
    Dbg_Shift_16,
    Dbg_Update_16,
    Dbg_Rst_16,
    Dbg_Clk_17,
    Dbg_TDI_17,
    Dbg_TDO_17,
    Dbg_Reg_En_17,
    Dbg_Capture_17,
    Dbg_Shift_17,
    Dbg_Update_17,
    Dbg_Rst_17,
    Dbg_Clk_18,
    Dbg_TDI_18,
    Dbg_TDO_18,
    Dbg_Reg_En_18,
    Dbg_Capture_18,
    Dbg_Shift_18,
    Dbg_Update_18,
    Dbg_Rst_18,
    Dbg_Clk_19,
    Dbg_TDI_19,
    Dbg_TDO_19,
    Dbg_Reg_En_19,
    Dbg_Capture_19,
    Dbg_Shift_19,
    Dbg_Update_19,
    Dbg_Rst_19,
    Dbg_Clk_20,
    Dbg_TDI_20,
    Dbg_TDO_20,
    Dbg_Reg_En_20,
    Dbg_Capture_20,
    Dbg_Shift_20,
    Dbg_Update_20,
    Dbg_Rst_20,
    Dbg_Clk_21,
    Dbg_TDI_21,
    Dbg_TDO_21,
    Dbg_Reg_En_21,
    Dbg_Capture_21,
    Dbg_Shift_21,
    Dbg_Update_21,
    Dbg_Rst_21,
    Dbg_Clk_22,
    Dbg_TDI_22,
    Dbg_TDO_22,
    Dbg_Reg_En_22,
    Dbg_Capture_22,
    Dbg_Shift_22,
    Dbg_Update_22,
    Dbg_Rst_22,
    Dbg_Clk_23,
    Dbg_TDI_23,
    Dbg_TDO_23,
    Dbg_Reg_En_23,
    Dbg_Capture_23,
    Dbg_Shift_23,
    Dbg_Update_23,
    Dbg_Rst_23,
    Dbg_Clk_24,
    Dbg_TDI_24,
    Dbg_TDO_24,
    Dbg_Reg_En_24,
    Dbg_Capture_24,
    Dbg_Shift_24,
    Dbg_Update_24,
    Dbg_Rst_24,
    Dbg_Clk_25,
    Dbg_TDI_25,
    Dbg_TDO_25,
    Dbg_Reg_En_25,
    Dbg_Capture_25,
    Dbg_Shift_25,
    Dbg_Update_25,
    Dbg_Rst_25,
    Dbg_Clk_26,
    Dbg_TDI_26,
    Dbg_TDO_26,
    Dbg_Reg_En_26,
    Dbg_Capture_26,
    Dbg_Shift_26,
    Dbg_Update_26,
    Dbg_Rst_26,
    Dbg_Clk_27,
    Dbg_TDI_27,
    Dbg_TDO_27,
    Dbg_Reg_En_27,
    Dbg_Capture_27,
    Dbg_Shift_27,
    Dbg_Update_27,
    Dbg_Rst_27,
    Dbg_Clk_28,
    Dbg_TDI_28,
    Dbg_TDO_28,
    Dbg_Reg_En_28,
    Dbg_Capture_28,
    Dbg_Shift_28,
    Dbg_Update_28,
    Dbg_Rst_28,
    Dbg_Clk_29,
    Dbg_TDI_29,
    Dbg_TDO_29,
    Dbg_Reg_En_29,
    Dbg_Capture_29,
    Dbg_Shift_29,
    Dbg_Update_29,
    Dbg_Rst_29,
    Dbg_Clk_30,
    Dbg_TDI_30,
    Dbg_TDO_30,
    Dbg_Reg_En_30,
    Dbg_Capture_30,
    Dbg_Shift_30,
    Dbg_Update_30,
    Dbg_Rst_30,
    Dbg_Clk_31,
    Dbg_TDI_31,
    Dbg_TDO_31,
    Dbg_Reg_En_31,
    Dbg_Capture_31,
    Dbg_Shift_31,
    Dbg_Update_31,
    Dbg_Rst_31,
    bscan_tdi,
    bscan_reset,
    bscan_shift,
    bscan_update,
    bscan_capture,
    bscan_sel1,
    bscan_drck1,
    bscan_tdo1,
    bscan_ext_tdi,
    bscan_ext_reset,
    bscan_ext_shift,
    bscan_ext_update,
    bscan_ext_capture,
    bscan_ext_sel,
    bscan_ext_drck,
    bscan_ext_tdo,
    Ext_JTAG_DRCK,
    Ext_JTAG_RESET,
    Ext_JTAG_SEL,
    Ext_JTAG_CAPTURE,
    Ext_JTAG_SHIFT,
    Ext_JTAG_UPDATE,
    Ext_JTAG_TDI,
    Ext_JTAG_TDO
  );
  output Interrupt;
  output Debug_SYS_Rst;
  output Ext_BRK;
  output Ext_NM_BRK;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input SPLB_Clk;
  input SPLB_Rst;
  input [0:31] PLB_ABus;
  input [0:31] PLB_UABus;
  input PLB_PAValid;
  input PLB_SAValid;
  input PLB_rdPrim;
  input PLB_wrPrim;
  input [0:2] PLB_masterID;
  input PLB_abort;
  input PLB_busLock;
  input PLB_RNW;
  input [0:3] PLB_BE;
  input [0:1] PLB_MSize;
  input [0:3] PLB_size;
  input [0:2] PLB_type;
  input PLB_lockErr;
  input [0:31] PLB_wrDBus;
  input PLB_wrBurst;
  input PLB_rdBurst;
  input PLB_wrPendReq;
  input PLB_rdPendReq;
  input [0:1] PLB_wrPendPri;
  input [0:1] PLB_rdPendPri;
  input [0:1] PLB_reqPri;
  input [0:15] PLB_TAttribute;
  output Sl_addrAck;
  output [0:1] Sl_SSize;
  output Sl_wait;
  output Sl_rearbitrate;
  output Sl_wrDAck;
  output Sl_wrComp;
  output Sl_wrBTerm;
  output [0:31] Sl_rdDBus;
  output [0:3] Sl_rdWdAddr;
  output Sl_rdDAck;
  output Sl_rdComp;
  output Sl_rdBTerm;
  output [0:7] Sl_MBusy;
  output [0:7] Sl_MWrErr;
  output [0:7] Sl_MRdErr;
  output [0:7] Sl_MIRQ;
  output Dbg_Clk_0;
  output Dbg_TDI_0;
  input Dbg_TDO_0;
  output [0:7] Dbg_Reg_En_0;
  output Dbg_Capture_0;
  output Dbg_Shift_0;
  output Dbg_Update_0;
  output Dbg_Rst_0;
  output Dbg_Clk_1;
  output Dbg_TDI_1;
  input Dbg_TDO_1;
  output [0:7] Dbg_Reg_En_1;
  output Dbg_Capture_1;
  output Dbg_Shift_1;
  output Dbg_Update_1;
  output Dbg_Rst_1;
  output Dbg_Clk_2;
  output Dbg_TDI_2;
  input Dbg_TDO_2;
  output [0:7] Dbg_Reg_En_2;
  output Dbg_Capture_2;
  output Dbg_Shift_2;
  output Dbg_Update_2;
  output Dbg_Rst_2;
  output Dbg_Clk_3;
  output Dbg_TDI_3;
  input Dbg_TDO_3;
  output [0:7] Dbg_Reg_En_3;
  output Dbg_Capture_3;
  output Dbg_Shift_3;
  output Dbg_Update_3;
  output Dbg_Rst_3;
  output Dbg_Clk_4;
  output Dbg_TDI_4;
  input Dbg_TDO_4;
  output [0:7] Dbg_Reg_En_4;
  output Dbg_Capture_4;
  output Dbg_Shift_4;
  output Dbg_Update_4;
  output Dbg_Rst_4;
  output Dbg_Clk_5;
  output Dbg_TDI_5;
  input Dbg_TDO_5;
  output [0:7] Dbg_Reg_En_5;
  output Dbg_Capture_5;
  output Dbg_Shift_5;
  output Dbg_Update_5;
  output Dbg_Rst_5;
  output Dbg_Clk_6;
  output Dbg_TDI_6;
  input Dbg_TDO_6;
  output [0:7] Dbg_Reg_En_6;
  output Dbg_Capture_6;
  output Dbg_Shift_6;
  output Dbg_Update_6;
  output Dbg_Rst_6;
  output Dbg_Clk_7;
  output Dbg_TDI_7;
  input Dbg_TDO_7;
  output [0:7] Dbg_Reg_En_7;
  output Dbg_Capture_7;
  output Dbg_Shift_7;
  output Dbg_Update_7;
  output Dbg_Rst_7;
  output Dbg_Clk_8;
  output Dbg_TDI_8;
  input Dbg_TDO_8;
  output [0:7] Dbg_Reg_En_8;
  output Dbg_Capture_8;
  output Dbg_Shift_8;
  output Dbg_Update_8;
  output Dbg_Rst_8;
  output Dbg_Clk_9;
  output Dbg_TDI_9;
  input Dbg_TDO_9;
  output [0:7] Dbg_Reg_En_9;
  output Dbg_Capture_9;
  output Dbg_Shift_9;
  output Dbg_Update_9;
  output Dbg_Rst_9;
  output Dbg_Clk_10;
  output Dbg_TDI_10;
  input Dbg_TDO_10;
  output [0:7] Dbg_Reg_En_10;
  output Dbg_Capture_10;
  output Dbg_Shift_10;
  output Dbg_Update_10;
  output Dbg_Rst_10;
  output Dbg_Clk_11;
  output Dbg_TDI_11;
  input Dbg_TDO_11;
  output [0:7] Dbg_Reg_En_11;
  output Dbg_Capture_11;
  output Dbg_Shift_11;
  output Dbg_Update_11;
  output Dbg_Rst_11;
  output Dbg_Clk_12;
  output Dbg_TDI_12;
  input Dbg_TDO_12;
  output [0:7] Dbg_Reg_En_12;
  output Dbg_Capture_12;
  output Dbg_Shift_12;
  output Dbg_Update_12;
  output Dbg_Rst_12;
  output Dbg_Clk_13;
  output Dbg_TDI_13;
  input Dbg_TDO_13;
  output [0:7] Dbg_Reg_En_13;
  output Dbg_Capture_13;
  output Dbg_Shift_13;
  output Dbg_Update_13;
  output Dbg_Rst_13;
  output Dbg_Clk_14;
  output Dbg_TDI_14;
  input Dbg_TDO_14;
  output [0:7] Dbg_Reg_En_14;
  output Dbg_Capture_14;
  output Dbg_Shift_14;
  output Dbg_Update_14;
  output Dbg_Rst_14;
  output Dbg_Clk_15;
  output Dbg_TDI_15;
  input Dbg_TDO_15;
  output [0:7] Dbg_Reg_En_15;
  output Dbg_Capture_15;
  output Dbg_Shift_15;
  output Dbg_Update_15;
  output Dbg_Rst_15;
  output Dbg_Clk_16;
  output Dbg_TDI_16;
  input Dbg_TDO_16;
  output [0:7] Dbg_Reg_En_16;
  output Dbg_Capture_16;
  output Dbg_Shift_16;
  output Dbg_Update_16;
  output Dbg_Rst_16;
  output Dbg_Clk_17;
  output Dbg_TDI_17;
  input Dbg_TDO_17;
  output [0:7] Dbg_Reg_En_17;
  output Dbg_Capture_17;
  output Dbg_Shift_17;
  output Dbg_Update_17;
  output Dbg_Rst_17;
  output Dbg_Clk_18;
  output Dbg_TDI_18;
  input Dbg_TDO_18;
  output [0:7] Dbg_Reg_En_18;
  output Dbg_Capture_18;
  output Dbg_Shift_18;
  output Dbg_Update_18;
  output Dbg_Rst_18;
  output Dbg_Clk_19;
  output Dbg_TDI_19;
  input Dbg_TDO_19;
  output [0:7] Dbg_Reg_En_19;
  output Dbg_Capture_19;
  output Dbg_Shift_19;
  output Dbg_Update_19;
  output Dbg_Rst_19;
  output Dbg_Clk_20;
  output Dbg_TDI_20;
  input Dbg_TDO_20;
  output [0:7] Dbg_Reg_En_20;
  output Dbg_Capture_20;
  output Dbg_Shift_20;
  output Dbg_Update_20;
  output Dbg_Rst_20;
  output Dbg_Clk_21;
  output Dbg_TDI_21;
  input Dbg_TDO_21;
  output [0:7] Dbg_Reg_En_21;
  output Dbg_Capture_21;
  output Dbg_Shift_21;
  output Dbg_Update_21;
  output Dbg_Rst_21;
  output Dbg_Clk_22;
  output Dbg_TDI_22;
  input Dbg_TDO_22;
  output [0:7] Dbg_Reg_En_22;
  output Dbg_Capture_22;
  output Dbg_Shift_22;
  output Dbg_Update_22;
  output Dbg_Rst_22;
  output Dbg_Clk_23;
  output Dbg_TDI_23;
  input Dbg_TDO_23;
  output [0:7] Dbg_Reg_En_23;
  output Dbg_Capture_23;
  output Dbg_Shift_23;
  output Dbg_Update_23;
  output Dbg_Rst_23;
  output Dbg_Clk_24;
  output Dbg_TDI_24;
  input Dbg_TDO_24;
  output [0:7] Dbg_Reg_En_24;
  output Dbg_Capture_24;
  output Dbg_Shift_24;
  output Dbg_Update_24;
  output Dbg_Rst_24;
  output Dbg_Clk_25;
  output Dbg_TDI_25;
  input Dbg_TDO_25;
  output [0:7] Dbg_Reg_En_25;
  output Dbg_Capture_25;
  output Dbg_Shift_25;
  output Dbg_Update_25;
  output Dbg_Rst_25;
  output Dbg_Clk_26;
  output Dbg_TDI_26;
  input Dbg_TDO_26;
  output [0:7] Dbg_Reg_En_26;
  output Dbg_Capture_26;
  output Dbg_Shift_26;
  output Dbg_Update_26;
  output Dbg_Rst_26;
  output Dbg_Clk_27;
  output Dbg_TDI_27;
  input Dbg_TDO_27;
  output [0:7] Dbg_Reg_En_27;
  output Dbg_Capture_27;
  output Dbg_Shift_27;
  output Dbg_Update_27;
  output Dbg_Rst_27;
  output Dbg_Clk_28;
  output Dbg_TDI_28;
  input Dbg_TDO_28;
  output [0:7] Dbg_Reg_En_28;
  output Dbg_Capture_28;
  output Dbg_Shift_28;
  output Dbg_Update_28;
  output Dbg_Rst_28;
  output Dbg_Clk_29;
  output Dbg_TDI_29;
  input Dbg_TDO_29;
  output [0:7] Dbg_Reg_En_29;
  output Dbg_Capture_29;
  output Dbg_Shift_29;
  output Dbg_Update_29;
  output Dbg_Rst_29;
  output Dbg_Clk_30;
  output Dbg_TDI_30;
  input Dbg_TDO_30;
  output [0:7] Dbg_Reg_En_30;
  output Dbg_Capture_30;
  output Dbg_Shift_30;
  output Dbg_Update_30;
  output Dbg_Rst_30;
  output Dbg_Clk_31;
  output Dbg_TDI_31;
  input Dbg_TDO_31;
  output [0:7] Dbg_Reg_En_31;
  output Dbg_Capture_31;
  output Dbg_Shift_31;
  output Dbg_Update_31;
  output Dbg_Rst_31;
  output bscan_tdi;
  output bscan_reset;
  output bscan_shift;
  output bscan_update;
  output bscan_capture;
  output bscan_sel1;
  output bscan_drck1;
  input bscan_tdo1;
  input bscan_ext_tdi;
  input bscan_ext_reset;
  input bscan_ext_shift;
  input bscan_ext_update;
  input bscan_ext_capture;
  input bscan_ext_sel;
  input bscan_ext_drck;
  output bscan_ext_tdo;
  output Ext_JTAG_DRCK;
  output Ext_JTAG_RESET;
  output Ext_JTAG_SEL;
  output Ext_JTAG_CAPTURE;
  output Ext_JTAG_SHIFT;
  output Ext_JTAG_UPDATE;
  output Ext_JTAG_TDI;
  input Ext_JTAG_TDO;
endmodule

module SensorMP_clock_generator_0_wrapper
  (
    CLKIN,
    CLKOUT0,
    CLKOUT1,
    CLKOUT2,
    CLKOUT3,
    CLKOUT4,
    CLKOUT5,
    CLKOUT6,
    CLKOUT7,
    CLKOUT8,
    CLKOUT9,
    CLKOUT10,
    CLKOUT11,
    CLKOUT12,
    CLKOUT13,
    CLKOUT14,
    CLKOUT15,
    CLKFBIN,
    CLKFBOUT,
    PSCLK,
    PSEN,
    PSINCDEC,
    PSDONE,
    RST,
    LOCKED
  );
  input CLKIN;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output CLKOUT7;
  output CLKOUT8;
  output CLKOUT9;
  output CLKOUT10;
  output CLKOUT11;
  output CLKOUT12;
  output CLKOUT13;
  output CLKOUT14;
  output CLKOUT15;
  input CLKFBIN;
  output CLKFBOUT;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  output PSDONE;
  input RST;
  output LOCKED;
endmodule

module SensorMP_bram_block_0_wrapper
  (
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_EN_B,
    BRAM_WEN_B,
    BRAM_Addr_B,
    BRAM_Din_B,
    BRAM_Dout_B
  );
  input BRAM_Rst_A;
  input BRAM_Clk_A;
  input BRAM_EN_A;
  input [0:3] BRAM_WEN_A;
  input [0:31] BRAM_Addr_A;
  output [0:31] BRAM_Din_A;
  input [0:31] BRAM_Dout_A;
  input BRAM_Rst_B;
  input BRAM_Clk_B;
  input BRAM_EN_B;
  input [0:3] BRAM_WEN_B;
  input [0:31] BRAM_Addr_B;
  output [0:31] BRAM_Din_B;
  input [0:31] BRAM_Dout_B;
endmodule

module SensorMP_bram_cntlr_instruction_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB1_ABus,
    LMB1_WriteDBus,
    LMB1_AddrStrobe,
    LMB1_ReadStrobe,
    LMB1_WriteStrobe,
    LMB1_BE,
    Sl1_DBus,
    Sl1_Ready,
    Sl1_Wait,
    Sl1_UE,
    Sl1_CE,
    LMB2_ABus,
    LMB2_WriteDBus,
    LMB2_AddrStrobe,
    LMB2_ReadStrobe,
    LMB2_WriteStrobe,
    LMB2_BE,
    Sl2_DBus,
    Sl2_Ready,
    Sl2_Wait,
    Sl2_UE,
    Sl2_CE,
    LMB3_ABus,
    LMB3_WriteDBus,
    LMB3_AddrStrobe,
    LMB3_ReadStrobe,
    LMB3_WriteStrobe,
    LMB3_BE,
    Sl3_DBus,
    Sl3_Ready,
    Sl3_Wait,
    Sl3_UE,
    Sl3_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    UE,
    CE,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  input [0:31] LMB1_ABus;
  input [0:31] LMB1_WriteDBus;
  input LMB1_AddrStrobe;
  input LMB1_ReadStrobe;
  input LMB1_WriteStrobe;
  input [0:3] LMB1_BE;
  output [0:31] Sl1_DBus;
  output Sl1_Ready;
  output Sl1_Wait;
  output Sl1_UE;
  output Sl1_CE;
  input [0:31] LMB2_ABus;
  input [0:31] LMB2_WriteDBus;
  input LMB2_AddrStrobe;
  input LMB2_ReadStrobe;
  input LMB2_WriteStrobe;
  input [0:3] LMB2_BE;
  output [0:31] Sl2_DBus;
  output Sl2_Ready;
  output Sl2_Wait;
  output Sl2_UE;
  output Sl2_CE;
  input [0:31] LMB3_ABus;
  input [0:31] LMB3_WriteDBus;
  input LMB3_AddrStrobe;
  input LMB3_ReadStrobe;
  input LMB3_WriteStrobe;
  input [0:3] LMB3_BE;
  output [0:31] Sl3_DBus;
  output Sl3_Ready;
  output Sl3_Wait;
  output Sl3_UE;
  output Sl3_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  output UE;
  output CE;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module SensorMP_bram_cntlr_data_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB1_ABus,
    LMB1_WriteDBus,
    LMB1_AddrStrobe,
    LMB1_ReadStrobe,
    LMB1_WriteStrobe,
    LMB1_BE,
    Sl1_DBus,
    Sl1_Ready,
    Sl1_Wait,
    Sl1_UE,
    Sl1_CE,
    LMB2_ABus,
    LMB2_WriteDBus,
    LMB2_AddrStrobe,
    LMB2_ReadStrobe,
    LMB2_WriteStrobe,
    LMB2_BE,
    Sl2_DBus,
    Sl2_Ready,
    Sl2_Wait,
    Sl2_UE,
    Sl2_CE,
    LMB3_ABus,
    LMB3_WriteDBus,
    LMB3_AddrStrobe,
    LMB3_ReadStrobe,
    LMB3_WriteStrobe,
    LMB3_BE,
    Sl3_DBus,
    Sl3_Ready,
    Sl3_Wait,
    Sl3_UE,
    Sl3_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    UE,
    CE,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  input [0:31] LMB1_ABus;
  input [0:31] LMB1_WriteDBus;
  input LMB1_AddrStrobe;
  input LMB1_ReadStrobe;
  input LMB1_WriteStrobe;
  input [0:3] LMB1_BE;
  output [0:31] Sl1_DBus;
  output Sl1_Ready;
  output Sl1_Wait;
  output Sl1_UE;
  output Sl1_CE;
  input [0:31] LMB2_ABus;
  input [0:31] LMB2_WriteDBus;
  input LMB2_AddrStrobe;
  input LMB2_ReadStrobe;
  input LMB2_WriteStrobe;
  input [0:3] LMB2_BE;
  output [0:31] Sl2_DBus;
  output Sl2_Ready;
  output Sl2_Wait;
  output Sl2_UE;
  output Sl2_CE;
  input [0:31] LMB3_ABus;
  input [0:31] LMB3_WriteDBus;
  input LMB3_AddrStrobe;
  input LMB3_ReadStrobe;
  input LMB3_WriteStrobe;
  input [0:3] LMB3_BE;
  output [0:31] Sl3_DBus;
  output Sl3_Ready;
  output Sl3_Wait;
  output Sl3_UE;
  output Sl3_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  output UE;
  output CE;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module SensorMP_lmb_v10_0_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module SensorMP_lmb_v10_1_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module SensorMP_fsl_i2s_0_wrapper
  (
    FSL_Clk,
    FSL_Rst,
    FSL_S_Clk,
    FSL_S_Read,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Exists,
    FSL_M_Clk,
    FSL_M_Write,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Full,
    i2s_bck,
    i2s_lrck,
    i2s_dati
  );
  input FSL_Clk;
  input FSL_Rst;
  input FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  input FSL_M_Clk;
  output FSL_M_Write;
  output [0:31] FSL_M_Data;
  output FSL_M_Control;
  input FSL_M_Full;
  input i2s_bck;
  input i2s_lrck;
  input i2s_dati;
endmodule

module SensorMP_fsl_v20_0_i2s_mb0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module SensorMP_fsl_v20_1_i2s_mb0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module SensorMP_fsl_i2s_1_wrapper
  (
    FSL_Clk,
    FSL_Rst,
    FSL_S_Clk,
    FSL_S_Read,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Exists,
    FSL_M_Clk,
    FSL_M_Write,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Full,
    i2s_bck,
    i2s_lrck,
    i2s_dati
  );
  input FSL_Clk;
  input FSL_Rst;
  input FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  input FSL_M_Clk;
  output FSL_M_Write;
  output [0:31] FSL_M_Data;
  output FSL_M_Control;
  input FSL_M_Full;
  input i2s_bck;
  input i2s_lrck;
  input i2s_dati;
endmodule

