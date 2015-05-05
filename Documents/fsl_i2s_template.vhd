------------------------------------------------------------------------------
-- fsl_interface - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          fsl_interface
-- Version:           1.01.a
-- Description:       Example FSL core (VHDL).
-- Date:              Wed May 04 17:07:50 2011 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------


--==========================================================================
-- Company:  ++
-- Contact:  xia@lixun.org
-- 
-- Create Date:    13:01:33 04/04/2011 
-- Design Name:    AD7764 serial port stream engine (capture/playback)
-- Module Name:    SPI Behavioral 
-- Project Name:   InGaAs
-- Target Devices: zynq 7 series
-- Tool versions:  ise 14.7
--
-- Description:    SPI data capture interface for AD7764
--                 
-- Documents:      AD7764 Datasheet, Rev. A
--                 Fast Simplex Link V20 bus, Xilinx Inc, Apr 2010
--
-- Notes:          For design and implementation details please refer to 
--                 appnote "Data Converter Interface".
--                 
-- History: 
-- Rev 0.01 - File Created.
-- Rev 0.02 - Mono operation mode of pcm1794a simplifies signal control.
-- Rev 0.03 - FSL interface integration.
-- Rev 1.00 - Evaluation of multi-clock domain design
--==========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------------
--
--
-- Definition of Ports
-- FSL_Clk         : Synchronous clock
-- FSL_Rst         : System reset, should always come from FSL bus
-- FSL_S_Clk       : Slave asynchronous clock
-- FSL_S_Read      : Read signal, requiring next available input to be read
-- FSL_S_Data      : Input data
-- FSL_S_CONTROL   : Control Bit, indicating the input data are control word
-- FSL_S_Exists    : Data Exist Bit, indicating data exist in the input FSL bus
-- FSL_M_Clk       : Master asynchronous clock
-- FSL_M_Write     : Write signal, enabling writing to output FSL bus
-- FSL_M_Data      : Output data
-- FSL_M_Control   : Control Bit, indicating the output data are contol word
-- FSL_M_Full      : Full Bit, indicating output FSL bus is full
--
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Entity Section
------------------------------------------------------------------------------

-- NOTE: FSL_Clk, FSL_Rst are not used.
--       FSL_M_Clk and FSL_S_Clk, which are the same as is2_bck are not in use
entity fsl_i2s is
    port 
    (
        -- DO NOT EDIT BELOW THIS LINE ---------------------
        -- Bus protocol ports, do not add or delete. 
        FSL_Clk       : in  std_logic;
        FSL_Rst       : in  std_logic;
        
        FSL_S_Clk      : in std_logic;  --i2s bck, DAC
        FSL_S_Read     : out    std_logic;
        FSL_S_Data     : in std_logic_vector(0 to 31);
        FSL_S_Control   : in    std_logic;
        FSL_S_Exists    : in    std_logic;
        
        FSL_M_Clk      : in std_logic;  --i2s bck, ADC
        FSL_M_Write    : out    std_logic;
        FSL_M_Data     : out    std_logic_vector(0 to 31);
        FSL_M_Control   : out   std_logic;
        FSL_M_Full     : in std_logic;
        -- DO NOT EDIT ABOVE THIS LINE ---------------------
    
        -- serial protocol ports --      
        i2s_bck : in std_logic;   -- bit clock up to 20.000MHz
        i2s_lrck : in std_logic;   -- left-right clock up to 10000/32 = 312.5 KHz
        i2s_dati : in std_logic   -- ADC data pin, up to 10MHz
        --i2s_dato : out std_logic;  -- DAC data pin
        
        -- user defined extra signals
        --i2s_ovfl : in std_logic;
        --i2s_ovfr : in std_logic;
        --i2s_calib : in std_logic   -- calibration button
    );

attribute SIGIS : string;
attribute SIGIS of FSL_Clk : signal is "Clk";
attribute SIGIS of FSL_S_Clk : signal is "Clk";
attribute SIGIS of FSL_M_Clk : signal is "Clk";

end fsl_i2s;

------------------------------------------------------------------------------
-- Architecture Section
------------------------------------------------------------------------------


------------------------------
-- cross clock domain design
------------------------------

architecture structure of fsl_i2s is

  -- signals for i2s stream engine
   signal lrck : std_logic_vector(1 downto 0);

   -- working shift registers
   signal adc_sregl : std_logic_vector(31 downto 0);

   -- i2s control signals
   signal lrck_rise : std_logic;  -- word select pulse "WSP", rising edge
   signal lrck_fall : std_logic;  -- word select pulse "WSP", falling edge

   -- frame counter
   signal strcnt : unsigned(2 downto 0);


   
  begin

    --generate WSP signals
    lrck_rise <= '1' when lrck(0)='0' and lrck(1)='1' else '0';
    lrck_fall <= '1' when lrck(0)='1' and lrck(1)='0' else '0';

    --strobe the word into FIFO and update FIFO state
    FSL_M_Data <= adc_sregl(31 downto 3) & std_logic_vector(strcnt);   
    FSL_M_Write <= not FSL_M_Full when lrck_rise='1' else '0';



    
    serial_deserial:process(i2s_bck)
      begin

        if rising_edge(i2s_bck) then
                    
          --     [+ note on how to get the edge event signals (WSP) +]
          -- edge event signals, A.K.A. WSP signals in the I2S specifications
          -- should be derived based on the oppsite phase of the bit clock that
          -- is used to derive the LRCK. In other words, if LRCK signal is
          -- synchronous to the rising edge of BCK, then falling edge of BCK
          -- shall be used to drive the WSP signals, and vice versa.
          
          --update frame counter
          if lrck_rise='1' then
            strcnt <= strcnt + 1;
          end if;
          
        end if; --rising edge


        if falling_edge(i2s_bck) then

          --serial to parallel conversion
          if i2s_lrck = '0' then
            adc_sregl <= adc_sregl(30 downto 0) & i2s_dati; -- data channel
          end if;
          
          --generate WSP signals
          lrck(1 downto 0) <= i2s_lrck & lrck(1);
          
        end if; --falling edge

        
      end process serial_deserial;
      
  end structure;
