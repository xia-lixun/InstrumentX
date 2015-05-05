-------------------------------------------------------------------------------
-- bram_block_prgm_elaborate.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity bram_block_prgm_elaborate is
  generic (
    C_MEMSIZE : integer;
    C_PORT_DWIDTH : integer;
    C_PORT_AWIDTH : integer;
    C_NUM_WE : integer;
    C_FAMILY : string
    );
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_A : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_A : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_A : in std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_B : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_B : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_B : in std_logic_vector(0 to C_PORT_DWIDTH-1)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of bram_block_prgm_elaborate : entity is "yes";

end bram_block_prgm_elaborate;

architecture STRUCTURE of bram_block_prgm_elaborate is

  component RAMB36E1 is
    generic (
      WRITE_MODE_A : string;
      WRITE_MODE_B : string;
      INIT_FILE : string;
      READ_WIDTH_A : integer;
      READ_WIDTH_B : integer;
      WRITE_WIDTH_A : integer;
      WRITE_WIDTH_B : integer;
      RAM_EXTENSION_A : string;
      RAM_EXTENSION_B : string
    );
    port (
      DBITERR : out std_logic;
      ECCPARITY : out std_logic_vector(7 downto 0);
      INJECTDBITERR : in std_logic;
      INJECTSBITERR : in std_logic;
      RDADDRECC : out std_logic_vector(8 downto 0);
      SBITERR : out std_logic;
      ADDRARDADDR : in std_logic_vector(15 downto 0);
      CASCADEINA : in std_logic;
      CASCADEOUTA : out std_logic;
      CLKARDCLK : in std_logic;
      DIADI : in std_logic_vector(31 downto 0);
      DIPADIP : in std_logic_vector(3 downto 0);
      DOADO : out std_logic_vector(31 downto 0);
      DOPADOP : out std_logic_vector(3 downto 0);
      ENARDEN : in std_logic;
      REGCEAREGCE : in std_logic;
      RSTRAMARSTRAM : in std_logic;
      RSTREGARSTREG : in std_logic;
      WEA : in std_logic_vector(3 downto 0);
      ADDRBWRADDR : in std_logic_vector(15 downto 0);
      CASCADEINB : in std_logic;
      CASCADEOUTB : out std_logic;
      CLKBWRCLK : in std_logic;
      DIBDI : in std_logic_vector(31 downto 0);
      DIPBDIP : in std_logic_vector(3 downto 0);
      DOBDO : out std_logic_vector(31 downto 0);
      DOPBDOP : out std_logic_vector(3 downto 0);
      ENBWREN : in std_logic;
      REGCEB : in std_logic;
      RSTRAMB : in std_logic;
      RSTREGB : in std_logic;
      WEBWE : in std_logic_vector(7 downto 0)
    );
  end component;

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb36e1_0: label is " ";
  attribute BMM_INFO of ramb36e1_1: label is " ";
  attribute BMM_INFO of ramb36e1_2: label is " ";
  attribute BMM_INFO of ramb36e1_3: label is " ";
  -- Internal signals

  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 2);
  signal pgassign3 : std_logic_vector(0 to 23);
  signal pgassign4 : std_logic_vector(0 to 3);
  signal pgassign5 : std_logic_vector(15 downto 0);
  signal pgassign6 : std_logic_vector(31 downto 0);
  signal pgassign7 : std_logic_vector(31 downto 0);
  signal pgassign8 : std_logic_vector(3 downto 0);
  signal pgassign9 : std_logic_vector(15 downto 0);
  signal pgassign10 : std_logic_vector(31 downto 0);
  signal pgassign11 : std_logic_vector(31 downto 0);
  signal pgassign12 : std_logic_vector(7 downto 0);
  signal pgassign13 : std_logic_vector(15 downto 0);
  signal pgassign14 : std_logic_vector(31 downto 0);
  signal pgassign15 : std_logic_vector(31 downto 0);
  signal pgassign16 : std_logic_vector(3 downto 0);
  signal pgassign17 : std_logic_vector(15 downto 0);
  signal pgassign18 : std_logic_vector(31 downto 0);
  signal pgassign19 : std_logic_vector(31 downto 0);
  signal pgassign20 : std_logic_vector(7 downto 0);
  signal pgassign21 : std_logic_vector(15 downto 0);
  signal pgassign22 : std_logic_vector(31 downto 0);
  signal pgassign23 : std_logic_vector(31 downto 0);
  signal pgassign24 : std_logic_vector(3 downto 0);
  signal pgassign25 : std_logic_vector(15 downto 0);
  signal pgassign26 : std_logic_vector(31 downto 0);
  signal pgassign27 : std_logic_vector(31 downto 0);
  signal pgassign28 : std_logic_vector(7 downto 0);
  signal pgassign29 : std_logic_vector(15 downto 0);
  signal pgassign30 : std_logic_vector(31 downto 0);
  signal pgassign31 : std_logic_vector(31 downto 0);
  signal pgassign32 : std_logic_vector(3 downto 0);
  signal pgassign33 : std_logic_vector(15 downto 0);
  signal pgassign34 : std_logic_vector(31 downto 0);
  signal pgassign35 : std_logic_vector(31 downto 0);
  signal pgassign36 : std_logic_vector(7 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 0) <= B"1";
  pgassign2(0 to 2) <= B"000";
  pgassign3(0 to 23) <= B"000000000000000000000000";
  pgassign4(0 to 3) <= B"0000";
  pgassign5(15 downto 15) <= B"1";
  pgassign5(14 downto 3) <= BRAM_Addr_A(18 to 29);
  pgassign5(2 downto 0) <= B"000";
  pgassign6(31 downto 8) <= B"000000000000000000000000";
  pgassign6(7 downto 0) <= BRAM_Dout_A(0 to 7);
  BRAM_Din_A(0 to 7) <= pgassign7(7 downto 0);
  pgassign8(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign8(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign8(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign8(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign9(15 downto 15) <= B"1";
  pgassign9(14 downto 3) <= BRAM_Addr_B(18 to 29);
  pgassign9(2 downto 0) <= B"000";
  pgassign10(31 downto 8) <= B"000000000000000000000000";
  pgassign10(7 downto 0) <= BRAM_Dout_B(0 to 7);
  BRAM_Din_B(0 to 7) <= pgassign11(7 downto 0);
  pgassign12(7 downto 4) <= B"0000";
  pgassign12(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign12(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign12(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign12(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign13(15 downto 15) <= B"1";
  pgassign13(14 downto 3) <= BRAM_Addr_A(18 to 29);
  pgassign13(2 downto 0) <= B"000";
  pgassign14(31 downto 8) <= B"000000000000000000000000";
  pgassign14(7 downto 0) <= BRAM_Dout_A(8 to 15);
  BRAM_Din_A(8 to 15) <= pgassign15(7 downto 0);
  pgassign16(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign16(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign16(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign16(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign17(15 downto 15) <= B"1";
  pgassign17(14 downto 3) <= BRAM_Addr_B(18 to 29);
  pgassign17(2 downto 0) <= B"000";
  pgassign18(31 downto 8) <= B"000000000000000000000000";
  pgassign18(7 downto 0) <= BRAM_Dout_B(8 to 15);
  BRAM_Din_B(8 to 15) <= pgassign19(7 downto 0);
  pgassign20(7 downto 4) <= B"0000";
  pgassign20(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign20(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign20(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign20(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign21(15 downto 15) <= B"1";
  pgassign21(14 downto 3) <= BRAM_Addr_A(18 to 29);
  pgassign21(2 downto 0) <= B"000";
  pgassign22(31 downto 8) <= B"000000000000000000000000";
  pgassign22(7 downto 0) <= BRAM_Dout_A(16 to 23);
  BRAM_Din_A(16 to 23) <= pgassign23(7 downto 0);
  pgassign24(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign24(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign24(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign24(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign25(15 downto 15) <= B"1";
  pgassign25(14 downto 3) <= BRAM_Addr_B(18 to 29);
  pgassign25(2 downto 0) <= B"000";
  pgassign26(31 downto 8) <= B"000000000000000000000000";
  pgassign26(7 downto 0) <= BRAM_Dout_B(16 to 23);
  BRAM_Din_B(16 to 23) <= pgassign27(7 downto 0);
  pgassign28(7 downto 4) <= B"0000";
  pgassign28(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign28(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign28(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign28(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign29(15 downto 15) <= B"1";
  pgassign29(14 downto 3) <= BRAM_Addr_A(18 to 29);
  pgassign29(2 downto 0) <= B"000";
  pgassign30(31 downto 8) <= B"000000000000000000000000";
  pgassign30(7 downto 0) <= BRAM_Dout_A(24 to 31);
  BRAM_Din_A(24 to 31) <= pgassign31(7 downto 0);
  pgassign32(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign32(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign32(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign32(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign33(15 downto 15) <= B"1";
  pgassign33(14 downto 3) <= BRAM_Addr_B(18 to 29);
  pgassign33(2 downto 0) <= B"000";
  pgassign34(31 downto 8) <= B"000000000000000000000000";
  pgassign34(7 downto 0) <= BRAM_Dout_B(24 to 31);
  BRAM_Din_B(24 to 31) <= pgassign35(7 downto 0);
  pgassign36(7 downto 4) <= B"0000";
  pgassign36(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign36(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign36(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign36(0 downto 0) <= BRAM_WEN_B(3 to 3);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb36e1_0 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "bram_block_prgm_combined_0.mem",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign5,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign6,
      DIPADIP => net_gnd4,
      DOADO => pgassign7,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign8,
      ADDRBWRADDR => pgassign9,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign10,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign11,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign12
    );

  ramb36e1_1 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "bram_block_prgm_combined_1.mem",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign13,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign14,
      DIPADIP => net_gnd4,
      DOADO => pgassign15,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign16,
      ADDRBWRADDR => pgassign17,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign18,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign19,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign20
    );

  ramb36e1_2 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "bram_block_prgm_combined_2.mem",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign21,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign22,
      DIPADIP => net_gnd4,
      DOADO => pgassign23,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign24,
      ADDRBWRADDR => pgassign25,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign26,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign27,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign28
    );

  ramb36e1_3 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "bram_block_prgm_combined_3.mem",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign29,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign30,
      DIPADIP => net_gnd4,
      DOADO => pgassign31,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign32,
      ADDRBWRADDR => pgassign33,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign34,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign35,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign36
    );

end architecture STRUCTURE;

