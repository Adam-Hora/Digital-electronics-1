------------------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_clk        : std_logic;
    
    signal s_data0_i    : std_logic_vector(4 - 1 downto 0);
    signal s_data1_i    : std_logic_vector(4 - 1 downto 0);
    signal s_data2_i    : std_logic_vector(4 - 1 downto 0);
    signal s_data3_i    : std_logic_vector(4 - 1 downto 0);
    
    signal s_dp_i       : std_logic_vector(4 -1 downto 0);
    signal s_dp_o       : std_logic;
    
    signal s_seg_o      : std_logic_vector(7 -1 downto 0);
    signal s_dig_o      : std_logic_vector(4 -1 downto 0);
    
    begin
    -- Connecting testbench signals with driver_7seg_4digits entity
    -- (Unit Under Test)
    uut_driver_7seg_4digits : entity work.driver_7seg_4digits
      port map 
      ( clk     => s_clk_100MHz,
        reset   => s_reset,
        data0_i => s_data0_i,
        data1_i => s_data1_i,
        data2_i => s_data2_i,
        data3_i => s_data3_i,
        dp_i    => s_dp_i,
        dp_o    => s_dp_o,
        seg_o   => s_seg_o,
        dig_o   => s_dig_o
         
       ); 
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '1';
        wait for 20 ns;
        
        s_reset <= '0';
        wait for 700 ns;
        
        s_reset <= '1';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        --3.142
        s_data3_i <= "0011";
        s_data2_i <= "0001";
        s_data1_i <= "0100";
        s_data0_i <= "0010";
        
        s_dp_i <= "0111";
        wait for 400ns;
         
        assert ((s_dig_o = "0111") or (s_dp_o = '1') or (s_seg_o = "0010010"))
        report "Test failed for input combination: 0111, 1, 0010010" severity error;

        s_data0_i <= "1001";
        s_data1_i <= "0111";
        s_data2_i <= "0000";
        s_data3_i <= "0011";
        s_dp_i <= "1110";
        wait for 200ns;
         
        assert ((s_dig_o = "1101") or (s_dp_o = '1') or (s_seg_o = "0001111"))
        report "Test failed for input combination: 1101, 1, 0001111" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
