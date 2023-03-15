----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 19:20:23
-- Design Name: 
-- Module Name: JohnsonCounter3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JohnsonCounter3 is
  Port (clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        led_o : out STD_LOGIC_VECTOR (3 downto 0));
end JohnsonCounter3;

architecture Behavioral of JohnsonCounter3 is

signal john_count : std_logic_vector(3 downto 0) := "0000";

begin
process(clk_i, rst_i)
    begin
        if(rst_i = '1') then
            john_count <= "0000";
        elsif rising_edge(clk_i) then
            john_count(1) <= john_count(0);
            john_count(2) <= john_count(1);
            john_count(3) <= john_count(2);
            john_count(0) <= not john_count(3);
        end if;
    end process;
    led_o <= john_count;


end Behavioral;
