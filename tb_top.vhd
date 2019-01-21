--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:09:03 12/19/2018
-- Design Name:   
-- Module Name:   C:/VHDL/versao2/tb_top.vhd
-- Project Name:  versao2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         ap_clk : IN  std_logic;
         ap_rst : IN  std_logic;
         ap_start : IN  std_logic;
         ap_done : OUT  std_logic;
         ap_idle : OUT  std_logic;
         ap_ready : OUT  std_logic;
         dado_0 : OUT  std_logic_vector(7 downto 0);
         dado_1 : OUT  std_logic_vector(7 downto 0);
         dado_saida0 : OUT  std_logic_vector(7 downto 0);
         dado_saida1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ap_clk : std_logic := '0';
   signal ap_rst : std_logic := '0';
   signal ap_start : std_logic := '0';

 	--Outputs
   signal ap_done : std_logic;
   signal ap_idle : std_logic;
   signal ap_ready : std_logic;
   signal dado_0 : std_logic_vector(7 downto 0);
   signal dado_1 : std_logic_vector(7 downto 0);
   signal dado_saida0 : std_logic_vector(7 downto 0);
   signal dado_saida1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant ap_clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          ap_clk => ap_clk,
          ap_rst => ap_rst,
          ap_start => ap_start,
          ap_done => ap_done,
          ap_idle => ap_idle,
          ap_ready => ap_ready,
          dado_0 => dado_0,
          dado_1 => dado_1,
          dado_saida0 => dado_saida0,
          dado_saida1 => dado_saida1
        );

   -- Clock process definitions
   ap_clk_process :process
   begin
		ap_clk <= '0';
		wait for ap_clk_period/2;
		ap_clk <= '1';
		wait for ap_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
      wait for 100 ns;	
		ap_rst <= '0';
		ap_start <= '0';

      wait for ap_clk_period*3;
		ap_rst <= '1';
      wait for ap_clk_period*3;
		ap_rst <='0';
      wait for ap_clk_period*3;
		ap_rst <='0'; 
		ap_start <= '1';

      wait;
   end process;

END;
