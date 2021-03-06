# 03-vivado

## Preparation

### Table with connection of slide switches and LEDs

| **LED** | **Connection** | **Switch** | **Connection** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

## Two-bit wide 4-to-1 multiplexer
### VHDL achitecture
```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 - 1 downto 0);
		b_i           : in  std_logic_vector(2 - 1 downto 0);
		c_i           : in  std_logic_vector(2 - 1 downto 0);
		d_i           : in  std_logic_vector(2 - 1 downto 0);
		sel_i         : in  std_logic_vector(2 - 1 downto 0);
		f_o           : out std_logic_vector(2 - 1 downto 0)       
    );
end entity mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin

       f_o <= a_i when(sel_i = "00") else
              b_i when(sel_i = "01") else
              c_i when(sel_i = "10") else
              d_i;
end architecture Behavioral;
```
### VHDL process
```vhdl
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "11"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "10"; s_a <= "00"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "11"; wait for 100 ns;


        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "11"; wait for 100 ns;
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

### Time waveforms
![2-bit 4to1](images/multiplex.png)

## Vivado tutorial
1. **Project creation**
   - File --> Project --> New... --> Next
   - Choose project name and location --> Next
   - *RTL Project* --> Next
   - Add/create source --> Next
   - Add/create constrains --> Next
   - Choose from *Boards* (Nexys A7-50T) --> Next
   - Finish
2. **How to add source file**
   - File --> Add Sources...
   - Add or create design sources
   - Add/create file --> Next
   - File type *VHDL*
   - Finish
3. **How to add testbench file**
   - File --> Add Sources...
   - Add or create simulation sources 
   - Add/create file --> Next
   - File type *VHDL*
   - Finish
4. **Simulation**
   - Flow --> Run Simulation --> Run Behavioral Simulation
   - Right click on output/input for Signal color or Radix
   - Use Zoom fit for better view
5. **How to add XDC constraints file**
   - File --> Add Sources...
   - Add or create constraints
   - Add/create file --> Next
   - File type *XDC*
   - Finish
