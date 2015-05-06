-------------------------------------------------------------------------------
-- SensorMP_fsl_i2s_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library fsl_i2s_v1_00_a;
use fsl_i2s_v1_00_a.all;

entity SensorMP_fsl_i2s_0_wrapper is
  port (
    FSL_Clk : in std_logic;
    FSL_Rst : in std_logic;
    FSL_S_Clk : in std_logic;
    FSL_S_Read : out std_logic;
    FSL_S_Data : in std_logic_vector(0 to 31);
    FSL_S_Control : in std_logic;
    FSL_S_Exists : in std_logic;
    FSL_M_Clk : in std_logic;
    FSL_M_Write : out std_logic;
    FSL_M_Data : out std_logic_vector(0 to 31);
    FSL_M_Control : out std_logic;
    FSL_M_Full : in std_logic;
    i2s_bck : in std_logic;
    i2s_lrck : in std_logic;
    i2s_dati : in std_logic
  );
end SensorMP_fsl_i2s_0_wrapper;

architecture STRUCTURE of SensorMP_fsl_i2s_0_wrapper is

  component fsl_i2s is
    port (
      FSL_Clk : in std_logic;
      FSL_Rst : in std_logic;
      FSL_S_Clk : in std_logic;
      FSL_S_Read : out std_logic;
      FSL_S_Data : in std_logic_vector(0 to 31);
      FSL_S_Control : in std_logic;
      FSL_S_Exists : in std_logic;
      FSL_M_Clk : in std_logic;
      FSL_M_Write : out std_logic;
      FSL_M_Data : out std_logic_vector(0 to 31);
      FSL_M_Control : out std_logic;
      FSL_M_Full : in std_logic;
      i2s_bck : in std_logic;
      i2s_lrck : in std_logic;
      i2s_dati : in std_logic
    );
  end component;

begin

  fsl_i2s_0 : fsl_i2s
    port map (
      FSL_Clk => FSL_Clk,
      FSL_Rst => FSL_Rst,
      FSL_S_Clk => FSL_S_Clk,
      FSL_S_Read => FSL_S_Read,
      FSL_S_Data => FSL_S_Data,
      FSL_S_Control => FSL_S_Control,
      FSL_S_Exists => FSL_S_Exists,
      FSL_M_Clk => FSL_M_Clk,
      FSL_M_Write => FSL_M_Write,
      FSL_M_Data => FSL_M_Data,
      FSL_M_Control => FSL_M_Control,
      FSL_M_Full => FSL_M_Full,
      i2s_bck => i2s_bck,
      i2s_lrck => i2s_lrck,
      i2s_dati => i2s_dati
    );

end architecture STRUCTURE;

