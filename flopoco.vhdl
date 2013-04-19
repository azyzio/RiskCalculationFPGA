
--------------------------------------------------------------------------------
--                            PolyCoeffTable_8_50
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Mioara Joldes (2010)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
entity PolyCoeffTable_8_50 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : out  std_logic_vector(49 downto 0)   );
end entity;

architecture arch of PolyCoeffTable_8_50 is
   -- Build a 2-D array type for the RoM
   subtype word_t is std_logic_vector(24 downto 0);
   type memory_t is array(0 to 511) of word_t;
   function init_rom
      return memory_t is 
      variable tmp : memory_t := (
   "0010000000010000000000000",
   "0010000010010000000100000",
   "0001111100010000001000001",
   "0010010000010000001011110",
   "0001111000010000010000010",
   "0010001100010000010100000",
   "0010001110010000011000000",
   "0001111110010000011100100",
   "0010001010010000100000011",
   "0001111100010000100100110",
   "0010000100010000101000110",
   "0010001000010000101100111",
   "0001111010010000110001011",
   "0010000000010000110101100",
   "0010000110010000111001100",
   "0001111100010000111110000",
   "0010010010010001000001111",
   "0010001010010001000110010",
   "0010010110010001001010011",
   "0010010100010001001110101",
   "0010001100010001010011001",
   "0010001110010001010111100",
   "0010010010010001011011110",
   "0010000010010001100000011",
   "0010010010010001100100100",
   "0010010110010001101000111",
   "0010011010010001101101010",
   "0010001000010001110010000",
   "0010001010010001110110011",
   "0010011000010001111010101",
   "0010000110010001111111100",
   "0010010000010010000011110",
   "0010011100010010001000001",
   "0010001010010010001101000",
   "0010011010010010010001010",
   "0010011110010010010101110",
   "0010010000010010011010101",
   "0010100000010010011111000",
   "0010010110010010100011110",
   "0010001100010010101000101",
   "0010010110010010101101001",
   "0010010100010010110001111",
   "0010010110010010110110100",
   "0010001100010010111011100",
   "0010100100010010111111110",
   "0010011010010011000100110",
   "0010010100010011001001101",
   "0010011010010011001110011",
   "0010011000010011010011010",
   "0010011100010011011000000",
   "0010001110010011011101001",
   "0010011110010011100001101",
   "0010010100010011100110110",
   "0010011100010011101011100",
   "0010011100010011110000100",
   "0010101100010011110101001",
   "0010100100010011111010010",
   "0010100100010011111111010",
   "0010100000010100000100011",
   "0010100000010100001001011",
   "0010101100010100001110010",
   "0010010110010100010011110",
   "0010100110010100011000100",
   "0010100000010100011101110",
   "0010011010010100100011000",
   "0010101100010100100111111",
   "0010011110010100101101010",
   "0010011110010100110010100",
   "0010101110010100110111011",
   "0010100110010100111100110",
   "0010100000010101000010001",
   "0010110100010101000111000",
   "0010100110010101001100101",
   "0010101110010101010001110",
   "0010100010010101010111011",
   "0010100100010101011100110",
   "0010100000010101100010001",
   "0010111000010101100111001",
   "0010110010010101101100101",
   "0010111000010101110010000",
   "0010110000010101110111101",
   "0010110100010101111101000",
   "0010110100010110000010100",
   "0010110010010110001000001",
   "0010101010010110001101110",
   "0010110110010110010011001",
   "0010101110010110011000111",
   "0010101010010110011110101",
   "0010101100010110100100010",
   "0011000000010110101001100",
   "0010111000010110101111011",
   "0010111000010110110101000",
   "0011000000010110111010101",
   "0010111000010111000000100",
   "0010101100010111000110100",
   "0010111010010111001100001",
   "0010110110010111010010000",
   "0011000010010111010111101",
   "0010110110010111011101101",
   "0010110110010111100011101",
   "0011000100010111101001010",
   "0010110100010111101111100",
   "0011001100010111110101000",
   "0010111000010111111011011",
   "0011000010011000000001001",
   "0011001010011000000111000",
   "0011001000011000001101001",
   "0011000100011000010011010",
   "0011000110011000011001011",
   "0011001100011000011111011",
   "0010111010011000100101111",
   "0011000000011000101011111",
   "0011010100011000110001110",
   "0011000000011000111000011",
   "0011001000011000111110011",
   "0011010110011001000100011",
   "0011000110011001001011000",
   "0011000110011001010001011",
   "0011010010011001010111100",
   "0011000110011001011110000",
   "0011000110011001100100100",
   "0011010100011001101010101",
   "0011000000011001110001011",
   "0011010110011001110111100",
   "0011011010011001111101111",
   "0011011010011010000100011",
   "0011011010011010001011000",
   "0011001100011010010001110",
   "0011001110011010011000011",
   "0011011000011010011110110",
   "0011100000011010100101010",
   "0011001000011010101100011",
   "0011011100011010110010110",
   "0011100010011010111001011",
   "0011010010011011000000011",
   "0011011110011011000111000",
   "0011100000011011001101110",
   "0011011100011011010100101",
   "0011011010011011011011100",
   "0011100010011011100010010",
   "0011100100011011101001001",
   "0011100000011011110000001",
   "0011101000011011110111000",
   "0011100100011011111110001",
   "0011010110011100000101011",
   "0011100010011100001100001",
   "0011100110011100010011001",
   "0011011000011100011010100",
   "0011101100011100100001010",
   "0011100110011100101000101",
   "0011110000011100101111101",
   "0011101110011100110110111",
   "0011110000011100111110000",
   "0011011010011101000101110",
   "0011011110011101001101000",
   "0011110000011101010100000",
   "0011101110011101011011011",
   "0011110110011101100010101",
   "0011111000011101101010000",
   "0011110010011101110001100",
   "0011111000011101111000111",
   "0011101000011110000000110",
   "0011110010011110001000000",
   "0011110110011110001111100",
   "0011101110011110010111010",
   "0011101110011110011110111",
   "0011101100011110100110101",
   "0011111110011110101101111",
   "0011101100011110110110000",
   "0100000000011110111101011",
   "0011111100011111000101010",
   "0011110010011111001101010",
   "0011110010011111010101000",
   "0100000010011111011100101",
   "0011110110011111100100110",
   "0100000010011111101100011",
   "0100001000011111110100010",
   "0011110110011111111100101",
   "0100000100100000000100011",
   "0011111000100000001100101",
   "0011110100100000010100110",
   "0100000010100000011100101",
   "0100001100100000100100101",
   "0011111100100000101101001",
   "0100010010100000110100111",
   "0100000100100000111101011",
   "0100001010100001000101100",
   "0100010010100001001101110",
   "0100001000100001010110010",
   "0100001000100001011110101",
   "0100001110100001100110111",
   "0100001010100001101111011",
   "0100010110100001110111101",
   "0100001100100010000000011",
   "0100011010100010001000101",
   "0100010000100010010001011",
   "0100001100100010011010001",
   "0100001000100010100010110",
   "0100100000100010101011000",
   "0100010100100010110011111",
   "0100010100100010111100101",
   "0100011010100011000101011",
   "0100010110100011001110010",
   "0100100000100011010110111",
   "0100011010100011011111111",
   "0100010010100011101000111",
   "0100100000100011110001101",
   "0100100000100011111010101",
   "0100100000100100000011101",
   "0100100000100100001100101",
   "0100110010100100010101011",
   "0100101110100100011110101",
   "0100101110100100100111110",
   "0100100100100100110001001",
   "0100101010100100111010010",
   "0100110000100101000011011",
   "0100011100100101001101001",
   "0100110110100101010110000",
   "0100110100100101011111011",
   "0100111010100101101000101",
   "0100111000100101110010001",
   "0100100100100101111100000",
   "0100101110100110000101011",
   "0100111010100110001110110",
   "0100110000100110011000100",
   "0100110010100110100010001",
   "0100101100100110101011111",
   "0100111110100110110101010",
   "0101000000100110111111000",
   "0100111110100111001000110",
   "0100110110100111010010110",
   "0100111000100111011100101",
   "0100111100100111100110011",
   "0100111110100111110000011",
   "0101001000100111111010001",
   "0101000000101000000100010",
   "0101001100101000001110001",
   "0101001110101000011000001",
   "0101000000101000100010101",
   "0101000110101000101100101",
   "0101000000101000110111000",
   "0101000100101001000001001",
   "0101001000101001001011011",
   "0100111110101001010101111",
   "0101000010101001100000010",
   "0101000000101001101010101",
   "0101010110101001110100110",
   "0101011010101001111111001",
   "0101011100101010001001101",
   "0101010110101010010100011",
   "0101011110101010011110111",
   "0101011110101010101001100",
   "0101011110101010110100010",
   "0101100100101010111110111",
   "0101001110101011001010000",
   "0101010000101011010100111",
   "0001000000000000000000100",
   "0001000000010000000010100",
   "0001000000100000001000100",
   "1001000000110000010010101",
   "1001000001000000100000101",
   "0001000001010000110010111",
   "1001000001100001001001001",
   "0001000001110001100011011",
   "0001000010000010000001111",
   "1001000010010010100100011",
   "1001000010100011001011001",
   "1001000010110011110110000",
   "0001000011000100100101000",
   "0001000011010101011000010",
   "1001000011100110001111110",
   "0001000011110111001011011",
   "0001000100001000001011011",
   "1001000100011001001111100",
   "0001000100101010011000000",
   "1001000100111011100100110",
   "1001000101001100110101110",
   "0001000101011110001011001",
   "0001000101101111100100111",
   "1001000110000001000010111",
   "1001000110010010100101011",
   "0001000110100100001100010",
   "0001000110110101110111100",
   "0001000111000111100111001",
   "1001000111011001011011010",
   "1001000111101011010011111",
   "0001000111111101010000111",
   "1001001000001111010010100",
   "0001001000100001011000101",
   "1001001000110011100011001",
   "1001001001000101110010011",
   "1001001001011000000110001",
   "1001001001101010011110011",
   "0001001001111100111011011",
   "1001001010001111011100111",
   "1001001010100010000011000",
   "1001001010110100101101111",
   "1001001011000111011101011",
   "1001001011011010010001101",
   "0001001011101101001010100",
   "1001001100000000001000010",
   "0001001100010011001010101",
   "1001001100100110010001110",
   "0001001100111001011101110",
   "0001001101001100101110100",
   "0001001101100000000100001",
   "0001001101110011011110100",
   "1001001110000110111101111",
   "1001001110011010100010000",
   "1001001110101110001011001",
   "0001001111000001111001001",
   "1001001111010101101100001",
   "1001001111101001100100000",
   "1001001111111101100000111",
   "0001010000010001100010110",
   "1001010000100101101001101",
   "0001010000111001110101101",
   "0001010001001110000110100",
   "1001010001100010011100101",
   "1001010001110110110111110",
   "1001010010001011011000000",
   "0001010010011111111101100",
   "1001010010110100101000000",
   "0001010011001001010111110",
   "1001010011011110001100110",
   "1001010011110011000110111",
   "1001010100001000000110010",
   "1001010100011101001011000",
   "0001010100110010010100111",
   "1001010101000111100100001",
   "0001010101011100111000101",
   "0001010101110010010010100",
   "1001010110000111110001110",
   "0001010110011101010110100",
   "1001010110110011000000100",
   "0001010111001000110000000",
   "0001010111011110100100111",
   "1001010111110100011111010",
   "1001011000001010011111001",
   "0001011000100000100100100",
   "1001011000110110101111011",
   "1001011001001100111111111",
   "1001011001100011010101111",
   "0001011001111001110001100",
   "0001011010010000010010110",
   "0001011010100110111001110",
   "0001011010111101100110010",
   "1001011011010100011000100",
   "0001011011101011010000100",
   "1001011100000010001110001",
   "1001011100011001010001100",
   "0001011100110000011010110",
   "0001011101000111101001110",
   "0001011101011110111110101",
   "1001011101110110011001010",
   "0001011110001101111001110",
   "0001011110100101100000010",
   "0001011110111101001100100",
   "0001011111010100111110111",
   "0001011111101100110111000",
   "1001100000000100110101010",
   "1001100000011100111001100",
   "0001100000110101000011110",
   "1001100001001101010100000",
   "0001100001100101101010011",
   "0001100001111110000110111",
   "0001100010010110101001011",
   "1001100010101111010010001",
   "0001100011001000000001001",
   "0001100011100000110110001",
   "1001100011111001110001100",
   "1001100100010010110011001",
   "1001100100101011111010111",
   "0001100101000101001001000",
   "0001100101011110011101100",
   "1001100101110111111000010",
   "0001100110010001011001011",
   "0001100110101011000001000",
   "1001100111000100101110111",
   "0001100111011110100011011",
   "1001100111111000011110010",
   "1001101000010010011111101",
   "0001101000101100100111100",
   "1001101001000110110101111",
   "0001101001100001001010111",
   "1001101001111011100110100",
   "1001101010010110001000110",
   "1001101010110000110001100",
   "0001101011001011100001001",
   "0001101011100110010111011",
   "1001101100000001010100010",
   "0001101100011100011000000",
   "0001101100110111100010100",
   "1001101101010010110011110",
   "1001101101101110001011111",
   "1001101110001001101010111",
   "1001101110100101010000110",
   "1001101111000000111101100",
   "0001101111011100110001010",
   "0001101111111000101011111",
   "0001110000010100101101100",
   "1001110000110000110110010",
   "1001110001001101000110000",
   "1001110001101001011100110",
   "1001110010000101111010110",
   "0001110010100010011111110",
   "0001110010111111001100000",
   "0001110011011011111111011",
   "1001110011111000111010000",
   "0001110100010101111011110",
   "0001110100110011000100111",
   "0001110101010000010101011",
   "0001110101101101101101001",
   "0001110110001011001100010",
   "0001110110101000110010110",
   "1001110111000110100000101",
   "1001110111100100010110000",
   "0001111000000010010010110",
   "1001111000100000010111001",
   "1001111000111110100011000",
   "1001111001011100110110011",
   "1001111001111011010001011",
   "0001111010011001110100000",
   "1001111010111000011110011",
   "0001111011010111010000010",
   "0001111011110110001010000",
   "0001111100010101001011011",
   "0001111100110100010100100",
   "1001111101010011100101100",
   "0001111101110010111110011",
   "0001111110010010011111000",
   "1001111110110010000111101",
   "1001111111010001111000001",
   "0001111111110001110000100",
   "0010000000010001110001000",
   "1010000000110001111001011",
   "1010000001010010001001111",
   "1010000001110010100010100",
   "0010000010010011000011010",
   "0010000010110011101100000",
   "0010000011010100011101001",
   "1010000011110101010110010",
   "1010000100010110010111110",
   "0010000100110111100001100",
   "0010000101011000110011100",
   "0010000101111010001101111",
   "1010000110011011110000101",
   "1010000110111101011011110",
   "1010000111011111001111011",
   "0010001000000001001011011",
   "0010001000100011010000000",
   "1010001001000101011101000",
   "0010001001100111110010101",
   "1010001010001010010000111",
   "0010001010101100110111111",
   "1010001011001111100111011",
   "1010001011110010011111101",
   "0010001100010101100000101",
   "0010001100111000101010011",
   "0010001101011011111101000",
   "0010001101111111011000011",
   "1010001110100010111100101",
   "0010001111000110101001111",
   "0010001111101010100000000",
   "0010010000001110011111001",
   "1010010000110010100111010",
   "1010010001010110111000100",
   "0010010001111011010010110",
   "1010010010011111110110001",
   "1010010011000100100010101",
   "1010010011101001011000011",
   "1010010100001110010111011",
   "0010010100110011011111100",
   "0010010101011000110001001",
   "0010010101111110001100000",
   "1010010110100011110000010",
   "1010010111001001011101111",
   "1010010111101111010100111",
   "0010011000010101010101100",
   "0010011000111011011111101",
   "0010011001100001110011010",
   "0010011010001000010000100",
   "0010011010101110110111011",
   "0010011011010101101000000",
   "0010011011111100100010010",
   "1010011100100011100110010",
   "1010011101001010110100000",
   "0010011101110010001011101",
   "1010011110011001101101001",
   "0010011111000001011000100",
   "0010011111101001001101111",
   "1010100000010001001101001",
   "0010100000111001010110100",
   "1010100001100001101001111",
   "0010100010001010000111010",
   "1010100010110010101110111",
   "0010100011011011100000101",
   "1010100100000100011100101",
   "1010100100101101100010111",
   "1010100101010110110011011",
   "0010100110000000001110010",
   "1010100110101001110011100",
   "0010100111010011100011010",
   "1010100111111101011101011",
   "1010101000100111100010000",
   "0010101001010001110001001",
   "0010101001111100001010111",
   "0010101010100110101111010",
   "0010101011010001011110010",
   "0010101011111100011000000",
   "1010101100100111011100011",
   "0010101101010010101011101",
      others => (others => '0'));
      	begin 
      return tmp;
      end init_rom;
	signal rom : memory_t := init_rom;
   signal Y1 :  std_logic_vector(24 downto 0);
   signal Y0 :  std_logic_vector(24 downto 0);
   signal Z1 :  std_logic_vector(8 downto 0);
   signal Z0 :  std_logic_vector(8 downto 0);
begin
Z0 <= '1' & X;
Z1 <= '0' & X;
	process(clk)
   begin
   if(rising_edge(clk)) then
   	Y1 <= rom(  TO_INTEGER(unsigned(Z1)));
   	Y0 <= rom(  TO_INTEGER(unsigned(Z0)));
   end if;
   end process;
    Y <= Y1 & Y0(24 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_14_f200_uid20
--                     (IntAdderClassical_14_f200_uid22)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_14_f200_uid20 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(13 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntAdder_14_f200_uid20 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                 IntMultiplier_UsingDSP_11_9_9_signed_uid7
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_11_9_9_signed_uid7 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(8 downto 0);
          R : out  std_logic_vector(8 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_9_9_signed_uid7 is
   component IntAdder_14_f200_uid20 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(13 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(13 downto 0)   );
   end component;

signal XX_m8 :  std_logic_vector(10 downto 0);
signal YY_m8 :  std_logic_vector(8 downto 0);
signal DSP_bh9_ch0_0 :  std_logic_vector(42 downto 0);
signal heap_bh9_w12_0 : std_logic;
signal heap_bh9_w11_0 : std_logic;
signal heap_bh9_w10_0 : std_logic;
signal heap_bh9_w9_0 : std_logic;
signal heap_bh9_w8_0 : std_logic;
signal heap_bh9_w7_0 : std_logic;
signal heap_bh9_w6_0 : std_logic;
signal heap_bh9_w5_0 : std_logic;
signal heap_bh9_w4_0 : std_logic;
signal heap_bh9_w3_0 : std_logic;
signal heap_bh9_w2_0 : std_logic;
signal heap_bh9_w1_0 : std_logic;
signal heap_bh9_w0_0 : std_logic;
signal heap_bh9_w3_1 : std_logic;
signal heap_bh9_w12_1 : std_logic;
signal finalAdderIn0_bh9 :  std_logic_vector(13 downto 0);
signal finalAdderIn1_bh9 :  std_logic_vector(13 downto 0);
signal finalAdderCin_bh9 : std_logic;
signal finalAdderOut_bh9 :  std_logic_vector(13 downto 0);
signal CompressionResult9 :  std_logic_vector(13 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   XX_m8 <= X ;
   YY_m8 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh9_ch0_0 <= ("" & XX_m8(10 downto 0) & "00000000000000") * ("" & YY_m8(8 downto 0) & "000000000");
   heap_bh9_w12_0 <= not( DSP_bh9_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w11_0 <= DSP_bh9_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w10_0 <= DSP_bh9_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w9_0 <= DSP_bh9_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w8_0 <= DSP_bh9_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w7_0 <= DSP_bh9_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w6_0 <= DSP_bh9_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w5_0 <= DSP_bh9_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w4_0 <= DSP_bh9_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w3_0 <= DSP_bh9_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w2_0 <= DSP_bh9_ch0_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w1_0 <= DSP_bh9_ch0_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w0_0 <= DSP_bh9_ch0_0(30); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh9_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh9_w12_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   finalAdderIn0_bh9 <= "0" & heap_bh9_w12_1 & heap_bh9_w11_0 & heap_bh9_w10_0 & heap_bh9_w9_0 & heap_bh9_w8_0 & heap_bh9_w7_0 & heap_bh9_w6_0 & heap_bh9_w5_0 & heap_bh9_w4_0 & heap_bh9_w3_1 & heap_bh9_w2_0 & heap_bh9_w1_0 & heap_bh9_w0_0;
   finalAdderIn1_bh9 <= "0" & heap_bh9_w12_0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh9_w3_0 & '0' & '0' & '0';
   finalAdderCin_bh9 <= '0';
   Adder_final9_0: IntAdder_14_f200_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh9,
                 R => finalAdderOut_bh9   ,
                 X => finalAdderIn0_bh9,
                 Y => finalAdderIn1_bh9);
   -- concatenate all the compressed chunks
   CompressionResult9 <= finalAdderOut_bh9;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult9(12 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_18_f200_uid28
--                     (IntAdderClassical_18_f200_uid30)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_18_f200_uid28 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          Y : in  std_logic_vector(17 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of IntAdder_18_f200_uid28 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_23_f200_uid48
--                     (IntAdderClassical_23_f200_uid50)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_23_f200_uid48 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(22 downto 0);
          Y : in  std_logic_vector(22 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(22 downto 0)   );
end entity;

architecture arch of IntAdder_23_f200_uid48 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                IntMultiplier_UsingDSP_11_18_18_signed_uid35
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_11_18_18_signed_uid35 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(17 downto 0);
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_18_18_signed_uid35 is
   component IntAdder_23_f200_uid48 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(22 downto 0);
             Y : in  std_logic_vector(22 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(22 downto 0)   );
   end component;

signal XX_m36 :  std_logic_vector(17 downto 0);
signal YY_m36 :  std_logic_vector(10 downto 0);
signal DSP_bh37_ch0_0 :  std_logic_vector(42 downto 0);
signal heap_bh37_w21_0 : std_logic;
signal heap_bh37_w20_0 : std_logic;
signal heap_bh37_w19_0 : std_logic;
signal heap_bh37_w18_0 : std_logic;
signal heap_bh37_w17_0 : std_logic;
signal heap_bh37_w16_0 : std_logic;
signal heap_bh37_w15_0 : std_logic;
signal heap_bh37_w14_0 : std_logic;
signal heap_bh37_w13_0 : std_logic;
signal heap_bh37_w12_0 : std_logic;
signal heap_bh37_w11_0 : std_logic;
signal heap_bh37_w10_0 : std_logic;
signal heap_bh37_w9_0 : std_logic;
signal heap_bh37_w8_0 : std_logic;
signal heap_bh37_w7_0 : std_logic;
signal heap_bh37_w6_0 : std_logic;
signal heap_bh37_w5_0 : std_logic;
signal heap_bh37_w4_0 : std_logic;
signal heap_bh37_w3_0 : std_logic;
signal heap_bh37_w2_0 : std_logic;
signal heap_bh37_w1_0 : std_logic;
signal heap_bh37_w0_0 : std_logic;
signal heap_bh37_w3_1 : std_logic;
signal heap_bh37_w21_1 : std_logic;
signal finalAdderIn0_bh37 :  std_logic_vector(22 downto 0);
signal finalAdderIn1_bh37 :  std_logic_vector(22 downto 0);
signal finalAdderCin_bh37 : std_logic;
signal finalAdderOut_bh37 :  std_logic_vector(22 downto 0);
signal CompressionResult37 :  std_logic_vector(22 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   XX_m36 <= Y ;
   YY_m36 <= X ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh37_ch0_0 <= ("" & XX_m36(17 downto 0) & "0000000") * ("" & YY_m36(10 downto 0) & "0000000");
   heap_bh37_w21_0 <= not( DSP_bh37_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w20_0 <= DSP_bh37_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w19_0 <= DSP_bh37_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w18_0 <= DSP_bh37_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w17_0 <= DSP_bh37_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w16_0 <= DSP_bh37_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w15_0 <= DSP_bh37_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w14_0 <= DSP_bh37_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w13_0 <= DSP_bh37_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w12_0 <= DSP_bh37_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w11_0 <= DSP_bh37_ch0_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w10_0 <= DSP_bh37_ch0_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w9_0 <= DSP_bh37_ch0_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w8_0 <= DSP_bh37_ch0_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w7_0 <= DSP_bh37_ch0_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w6_0 <= DSP_bh37_ch0_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w5_0 <= DSP_bh37_ch0_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w4_0 <= DSP_bh37_ch0_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w3_0 <= DSP_bh37_ch0_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w2_0 <= DSP_bh37_ch0_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w1_0 <= DSP_bh37_ch0_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w0_0 <= DSP_bh37_ch0_0(21); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh37_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh37_w21_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   finalAdderIn0_bh37 <= "0" & heap_bh37_w21_1 & heap_bh37_w20_0 & heap_bh37_w19_0 & heap_bh37_w18_0 & heap_bh37_w17_0 & heap_bh37_w16_0 & heap_bh37_w15_0 & heap_bh37_w14_0 & heap_bh37_w13_0 & heap_bh37_w12_0 & heap_bh37_w11_0 & heap_bh37_w10_0 & heap_bh37_w9_0 & heap_bh37_w8_0 & heap_bh37_w7_0 & heap_bh37_w6_0 & heap_bh37_w5_0 & heap_bh37_w4_0 & heap_bh37_w3_1 & heap_bh37_w2_0 & heap_bh37_w1_0 & heap_bh37_w0_0;
   finalAdderIn1_bh37 <= "0" & heap_bh37_w21_0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh37_w3_0 & '0' & '0' & '0';
   finalAdderCin_bh37 <= '0';
   Adder_final37_0: IntAdder_23_f200_uid48  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh37,
                 R => finalAdderOut_bh37   ,
                 X => finalAdderIn0_bh37,
                 Y => finalAdderIn1_bh37);
   -- concatenate all the compressed chunks
   CompressionResult37 <= finalAdderOut_bh37;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult37(21 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_25_f200_uid56
--                     (IntAdderClassical_25_f200_uid58)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_25_f200_uid56 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(24 downto 0);
          Y : in  std_logic_vector(24 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(24 downto 0)   );
end entity;

architecture arch of IntAdder_25_f200_uid56 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                      PolynomialEvaluator_degree2_uid5
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010-2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity PolynomialEvaluator_degree2_uid5 is
   port ( clk, rst : in std_logic;
          Y : in  std_logic_vector(9 downto 0);
          a0 : in  std_logic_vector(23 downto 0);
          a1 : in  std_logic_vector(16 downto 0);
          a2 : in  std_logic_vector(8 downto 0);
          R : out  std_logic_vector(24 downto 0)   );
end entity;

architecture arch of PolynomialEvaluator_degree2_uid5 is
   component IntAdder_18_f200_uid28 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             Y : in  std_logic_vector(17 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(17 downto 0)   );
   end component;

   component IntAdder_25_f200_uid56 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(24 downto 0);
             Y : in  std_logic_vector(24 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(24 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_18_18_signed_uid35 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(17 downto 0);
             R : out  std_logic_vector(17 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_9_9_signed_uid7 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(8 downto 0);
             R : out  std_logic_vector(8 downto 0)   );
   end component;

signal sigmaP0, sigmaP0_d1 :  std_logic_vector(8 downto 0);
signal yT1, yT1_d1 :  std_logic_vector(10 downto 0);
signal piPT1 :  std_logic_vector(8 downto 0);
signal op1_1 :  std_logic_vector(17 downto 0);
signal op2_1 :  std_logic_vector(17 downto 0);
signal sigmaP1 :  std_logic_vector(17 downto 0);
signal yT2 :  std_logic_vector(10 downto 0);
signal piP2 :  std_logic_vector(17 downto 0);
signal op1_2 :  std_logic_vector(24 downto 0);
signal op2_2 :  std_logic_vector(24 downto 0);
signal sigmaP2 :  std_logic_vector(24 downto 0);
signal Y_d1 :  std_logic_vector(9 downto 0);
signal a0_d1 :  std_logic_vector(23 downto 0);
signal a1_d1 :  std_logic_vector(16 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sigmaP0_d1 <=  sigmaP0;
            yT1_d1 <=  yT1;
            Y_d1 <=  Y;
            a0_d1 <=  a0;
            a1_d1 <=  a1;
         end if;
      end process;
   -- LSB weight of sigmaP0 is=1 size=9
   sigmaP0 <= a2;
   -- LSB weight of yT1 is=-8 size=11
   yT1 <= "0" & Y(9 downto 0);
   -- LSB weight of piP1 is=-7 size=20
   ----------------Synchro barrier, entering cycle 1----------------
   Product_1: IntMultiplier_UsingDSP_11_9_9_signed_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piPT1,
                 X => yT1_d1,
                 Y => sigmaP0_d1);
   op1_1 <= ((0 downto 0 => a1_d1(16)) & a1_d1 & "");
   op2_1 <= ((9 downto 0 => piPT1(7)) & piPT1(7 downto 0) & "");
   Sum1: IntAdder_18_f200_uid28  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP1,
                 X => op1_1,
                 Y => op2_1);
   -- weight of yT2 is=-8 size=11
   yT2 <= "0" & Y_d1(9 downto 0);
   -- weight of piP2 is=-5 size=29
   Product_2: IntMultiplier_UsingDSP_11_18_18_signed_uid35  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piP2,
                 X => yT2,
                 Y => sigmaP1);
   -- the delay at the output of the multiplier is : 0
   op1_2 <= (7 downto 0 => piP2(17)) & piP2(16 downto 0);
   op2_2 <= (0 downto 0 => a0_d1(23)) & a0_d1;
   Sum2: IntAdder_25_f200_uid56  -- pipelineDepth=0 maxInDelay=4.4472e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP2,
                 X => op1_2,
                 Y => op2_2);
   R <= sigmaP2(24 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                            Exponential
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Mioara Joldes, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Exponential is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          R : out  std_logic_vector(21 downto 0)   );
end entity;

architecture arch of Exponential is
   component PolyCoeffTable_8_50 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : out  std_logic_vector(49 downto 0)   );
   end component;

   component PolynomialEvaluator_degree2_uid5 is
      port ( clk, rst : in std_logic;
             Y : in  std_logic_vector(9 downto 0);
             a0 : in  std_logic_vector(23 downto 0);
             a1 : in  std_logic_vector(16 downto 0);
             a2 : in  std_logic_vector(8 downto 0);
             R : out  std_logic_vector(24 downto 0)   );
   end component;

signal addr :  std_logic_vector(7 downto 0);
signal Coef, Coef_d1 :  std_logic_vector(49 downto 0);
signal y :  std_logic_vector(9 downto 0);
signal a0 :  std_logic_vector(23 downto 0);
signal a1 :  std_logic_vector(16 downto 0);
signal a2 :  std_logic_vector(8 downto 0);
signal Rpe :  std_logic_vector(24 downto 0);
signal X_d1, X_d2 :  std_logic_vector(17 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            Coef_d1 <=  Coef;
            X_d1 <=  X;
            X_d2 <=  X_d1;
         end if;
      end process;
   addr <= X(17 downto 10);
   GeneratedTable: PolyCoeffTable_8_50  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => addr,
                 Y => Coef);
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   y <= X_d2(9 downto 0);
   a0<= Coef_d1(23 downto 0);
   a1<= Coef_d1(40 downto 24);
   a2<= Coef_d1(49 downto 41);
   PolynomialEvaluator: PolynomialEvaluator_degree2_uid5  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Rpe,
                 Y => y,
                 a0 => a0,
                 a1 => a1,
                 a2 => a2);
   ----------------Synchro barrier, entering cycle 3----------------
   -- weight of poly result is : 4
    R <= Rpe(24 downto 3);
end architecture;