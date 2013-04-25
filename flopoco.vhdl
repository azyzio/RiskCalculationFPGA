--------------------------------------------------------------------------------
--                            PolyCoeffTable_8_39
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Mioara Joldes (2010)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
entity PolyCoeffTable_8_39 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : out  std_logic_vector(38 downto 0)   );
end entity;

architecture arch of PolyCoeffTable_8_39 is
   -- Build a 2-D array type for the RoM
   subtype word_t is std_logic_vector(19 downto 0);
   type memory_t is array(0 to 511) of word_t;
   function init_rom
      return memory_t is 
      variable tmp : memory_t := (
   "00010000100000000000",
   "00010000100000001000",
   "00010000100000010000",
   "00001000100000011010",
   "00010100100000100000",
   "00000100100000101100",
   "00001000100000110100",
   "11111000100001000000",
   "00100000100000111100",
   "00001100100001001010",
   "00000100100001010110",
   "00011100100001010110",
   "11111100100001101000",
   "00011100100001101000",
   "00100000100001101110",
   "11110100100010000100",
   "00000000100010001010",
   "00100100100010000110",
   "00100100100010010000",
   "00001000100010100000",
   "00101000100010100000",
   "00000000100010110100",
   "00001100100010111010",
   "00001000100011000100",
   "11111100100011010000",
   "00011000100011010000",
   "11111100100011100010",
   "11111100100011101010",
   "11111000100011110100",
   "00100100100011110000",
   "00001000100100000010",
   "00010000100100001000",
   "00001100100100010010",
   "11111100100100100000",
   "00010100100100100010",
   "00100000100100101000",
   "00011000100100110100",
   "11111000100101000110",
   "00001100100101001010",
   "00001100100101010100",
   "00100000100101010110",
   "00000000100101101010",
   "00101000100101100110",
   "00001100100101111000",
   "00011000100101111110",
   "00010100100110001010",
   "00100100100110001110",
   "00100000100110011000",
   "00010100100110100110",
   "00011000100110101110",
   "00010100100110111010",
   "00100100100110111110",
   "00011100100111001010",
   "00000100100111011100",
   "00000100100111100110",
   "00011100100111101000",
   "00100100100111110000",
   "00001000101000000010",
   "00010000101000001010",
   "00101000101000001100",
   "00101000101000010110",
   "00010000101000101000",
   "00010100101000110010",
   "00100100101000110110",
   "00100000101001000010",
   "11111100101001011000",
   "00100100101001010110",
   "00101100101001011110",
   "00010100101001110000",
   "00000100101001111110",
   "00011100101010000010",
   "00001100101010010010",
   "00001100101010011100",
   "00011000101010100010",
   "00010000101010110000",
   "00011100101010111000",
   "00101000101010111110",
   "00011000101011001110",
   "00010100101011011010",
   "00100100101011100000",
   "00001100101011110010",
   "00000100101100000000",
   "00001000101100001010",
   "00011000101100010000",
   "11111000101100100100",
   "00100100101100100010",
   "00100000101100101110",
   "00101100101100110110",
   "00010000101101001010",
   "00110000101101001100",
   "00100000101101011100",
   "00011000101101101010",
   "00010100101101110110",
   "00100000101101111110",
   "00110100101110000100",
   "00001000101110011100",
   "00101000101110011110",
   "00001100101110110010",
   "00000000101111000010",
   "00110000101111000000",
   "00100000101111010000",
   "00011100101111011110",
   "00010100101111101100",
   "00000100101111111100",
   "00001000110000001000",
   "00000000110000010110",
   "00101100110000010100",
   "00101000110000100010",
   "00011100110000110010",
   "00010000110001000010",
   "00000100110001010010",
   "00011100110001010110",
   "00001100110001101000",
   "00100000110001101110",
   "00000100110010000100",
   "00001100110010001110",
   "00010100110010011000",
   "00010000110010100110",
   "11111100110010111000",
   "00100000110010111010",
   "00000100110011010000",
   "00010100110011011000",
   "00011000110011100100",
   "00000100110011110110",
   "00100000110011111010",
   "00110000110100000010",
   "00000000110100011110",
   "00101100110100011110",
   "00010000110100110100",
   "00011000110100111110",
   "00011000110101001100",
   "00111000110101010000",
   "00000100110101101100",
   "00000100110101111010",
   "00100100110101111110",
   "00101000110110001010",
   "00100100110110011010",
   "00101100110110100100",
   "00101100110110110010",
   "00010000110111001000",
   "00011000110111010100",
   "00000100110111101000",
   "00001000110111110100",
   "00101000110111111000",
   "00111000111000000010",
   "00100100111000010110",
   "00101100111000100010",
   "00010000111000111000",
   "00010000111001000110",
   "00101100111001001100",
   "00101000111001011100",
   "00001100111001110100",
   "00101100111001111000",
   "00101100111010000110",
   "00011000111010011100",
   "00001100111010101110",
   "00001100111010111100",
   "00101100111011000010",
   "00011000111011010110",
   "00011100111011100100",
   "00101100111011101110",
   "00010100111100000100",
   "00010100111100010100",
   "00011000111100100010",
   "00100000111100101110",
   "00001100111101000100",
   "00110000111101001000",
   "00101000111101011010",
   "00100100111101101010",
   "00110000111101110110",
   "00001000111110010010",
   "00100000111110011010",
   "00111000111110100010",
   "00100100111110111000",
   "00010000111111001110",
   "00111000111111010010",
   "00101000111111100110",
   "00011100111111111010",
   "00011001000000001100",
   "00000001000000100010",
   "00110001000000100100",
   "00011101000000111010",
   "00010101000001001110",
   "00101101000001010110",
   "00001101000001110000",
   "00101101000001111000",
   "00110001000010000110",
   "00010001000010100010",
   "00111101000010100100",
   "00110101000010111000",
   "00011001000011010000",
   "00111001000011011000",
   "00000101000011111000",
   "00001101000100001000",
   "00101101000100001110",
   "00010001000100101000",
   "00011101000100110110",
   "00010001000101001010",
   "00110001000101010010",
   "00010001000101101110",
   "00111101000101110010",
   "00100001000110001100",
   "00100101000110011100",
   "00011001000110110010",
   "00100001000111000000",
   "00100101000111010010",
   "00110101000111011110",
   "00101101000111110010",
   "00010101001000001100",
   "00011001001000011110",
   "00100001001000101100",
   "00011101001001000000",
   "00101001001001001110",
   "00101001001001100010",
   "00101001001001110100",
   "00010001001010001110",
   "01000001001010010010",
   "00011101001010110000",
   "00111001001010111010",
   "00101101001011010000",
   "00110101001011100000",
   "00100001001011111010",
   "01000101001100000010",
   "01000001001100010110",
   "00011001001100110110",
   "00101001001101000100",
   "00010101001101011110",
   "00111001001101100110",
   "00110001001101111100",
   "00101101001110010000",
   "00110001001110100010",
   "01000001001110110010",
   "00011001001111010010",
   "00101101001111100000",
   "01000001001111101110",
   "00011001010000001110",
   "00101101010000011100",
   "00111001010000101100",
   "00010001010001001100",
   "00100001010001011100",
   "00100001010001110000",
   "00101101010010000010",
   "00100001010010011010",
   "00001101010010110100",
   "00110001010010111110",
   "01001001010011001100",
   "00010101010011110000",
   "00011101010100000100",
   "00110101010100010000",
   "00011001010100101110",
   "00011101010101000010",
   "00010101010101011010",
   "00110101010101100110",
   "00111001010101111010",
   "00101001010110010100",
   "01000101010110100010",
   "00100000000000000100",
   "00100000001000000101",
   "00100000010000001000",
   "00100000011000001101",
   "00100000100000010100",
   "00100000101000011101",
   "00100000110000101000",
   "00100000111000110101",
   "00100001000001000101",
   "00100001001001010110",
   "00100001010001101001",
   "00100001011001111111",
   "00100001100010010110",
   "00100001101010110000",
   "00100001110011001100",
   "00100001111011101001",
   "00100010000100001001",
   "00100010001100101100",
   "00100010010101010000",
   "00100010011101110110",
   "00100010100110011111",
   "00100010101111001001",
   "00100010110111110110",
   "00100011000000100101",
   "00100011001001010110",
   "00100011010010001010",
   "00100011011010111111",
   "00100011100011110111",
   "00100011101100110001",
   "00100011110101101110",
   "00100011111110101100",
   "00100100000111101101",
   "00100100010000110000",
   "00100100011001110101",
   "00100100100010111101",
   "00100100101100000111",
   "00100100110101010011",
   "00100100111110100001",
   "00100101000111110010",
   "00100101010001000101",
   "00100101011010011011",
   "00100101100011110010",
   "00100101101101001101",
   "00100101110110101001",
   "00100110000000001000",
   "00100110001001101001",
   "00100110010011001101",
   "00100110011100110011",
   "00100110100110011011",
   "00100110110000000110",
   "00100110111001110011",
   "00100111000011100011",
   "00100111001101010101",
   "00100111010111001001",
   "00100111100001000000",
   "00100111101010111010",
   "00100111110100110110",
   "00100111111110110100",
   "00101000001000110101",
   "00101000010010111001",
   "00101000011100111111",
   "00101000100111000111",
   "00101000110001010010",
   "00101000111011100000",
   "00101001000101110000",
   "00101001010000000010",
   "00101001011010011000",
   "00101001100100110000",
   "00101001101111001010",
   "00101001111001100111",
   "00101010000100000111",
   "00101010001110101001",
   "00101010011001001110",
   "00101010100011110110",
   "00101010101110100000",
   "00101010111001001101",
   "00101011000011111101",
   "00101011001110101111",
   "00101011011001100100",
   "00101011100100011100",
   "00101011101111010110",
   "00101011111010010011",
   "00101100000101010011",
   "00101100010000010110",
   "00101100011011011011",
   "00101100100110100100",
   "00101100110001101111",
   "00101100111100111101",
   "00101101001000001101",
   "00101101010011100001",
   "00101101011110110111",
   "00101101101010010000",
   "00101101110101101100",
   "00101110000001001011",
   "00101110001100101101",
   "00101110011000010001",
   "00101110100011111001",
   "00101110101111100011",
   "00101110111011010000",
   "00101111000111000001",
   "00101111010010110100",
   "00101111011110101010",
   "00101111101010100011",
   "00101111110110011111",
   "00110000000010011110",
   "00110000001110100000",
   "00110000011010100110",
   "00110000100110101110",
   "00110000110010111001",
   "00110000111111000111",
   "00110001001011011000",
   "00110001010111101101",
   "00110001100100000100",
   "00110001110000011111",
   "00110001111100111100",
   "00110010001001011101",
   "00110010010110000001",
   "00110010100010101000",
   "00110010101111010010",
   "00110010111100000000",
   "00110011001000110000",
   "00110011010101100100",
   "00110011100010011011",
   "00110011101111010101",
   "00110011111100010011",
   "00110100001001010100",
   "00110100010110010111",
   "00110100100011011111",
   "00110100110000101001",
   "00110100111101110111",
   "00110101001011001000",
   "00110101011000011101",
   "00110101100101110100",
   "00110101110011001111",
   "00110110000000101110",
   "00110110001110010000",
   "00110110011011110101",
   "00110110101001011110",
   "00110110110111001010",
   "00110111000100111001",
   "00110111010010101100",
   "00110111100000100010",
   "00110111101110011100",
   "00110111111100011010",
   "00111000001010011011",
   "00111000011000011111",
   "00111000100110100111",
   "00111000110100110010",
   "00111001000011000001",
   "00111001010001010100",
   "00111001011111101010",
   "00111001101110000011",
   "00111001111100100001",
   "00111010001011000010",
   "00111010011001100110",
   "00111010101000001110",
   "00111010110110111010",
   "00111011000101101010",
   "00111011010100011101",
   "00111011100011010100",
   "00111011110010001111",
   "00111100000001001101",
   "00111100010000001111",
   "00111100011111010101",
   "00111100101110011111",
   "00111100111101101100",
   "00111101001100111110",
   "00111101011100010011",
   "00111101101011101100",
   "00111101111011001001",
   "00111110001010101001",
   "00111110011010001110",
   "00111110101001110111",
   "00111110111001100011",
   "00111111001001010011",
   "00111111011001001000",
   "00111111101001000000",
   "00111111111000111100",
   "01000000001000111100",
   "01000000011001000000",
   "01000000101001001001",
   "01000000111001010101",
   "01000001001001100101",
   "01000001011001111010",
   "01000001101010010010",
   "01000001111010101111",
   "01000010001011010000",
   "01000010011011110100",
   "01000010101100011110",
   "01000010111101001011",
   "01000011001101111100",
   "01000011011110110010",
   "01000011101111101011",
   "01000100000000101001",
   "01000100010001101100",
   "01000100100010110010",
   "01000100110011111101",
   "01000101000101001100",
   "01000101010110100000",
   "01000101100111110111",
   "01000101111001010100",
   "01000110001010110100",
   "01000110011100011001",
   "01000110101110000010",
   "01000110111111110000",
   "01000111010001100010",
   "01000111100011011001",
   "01000111110101010100",
   "01001000000111010011",
   "01001000011001010111",
   "01001000101011100000",
   "01001000111101101101",
   "01001001001111111111",
   "01001001100010010101",
   "01001001110100110000",
   "01001010000111001111",
   "01001010011001110100",
   "01001010101100011100",
   "01001010111111001010",
   "01001011010001111100",
   "01001011100100110011",
   "01001011110111101110",
   "01001100001010101111",
   "01001100011101110100",
   "01001100110000111101",
   "01001101000100001100",
   "01001101010111011111",
   "01001101101010111000",
   "01001101111110010101",
   "01001110010001110111",
   "01001110100101011110",
   "01001110111001001010",
   "01001111001100111010",
   "01001111100000110000",
   "01001111110100101011",
   "01010000001000101010",
   "01010000011100101111",
   "01010000110000111001",
   "01010001000101000111",
   "01010001011001011011",
   "01010001101101110100",
   "01010010000010010010",
   "01010010010110110101",
   "01010010101011011101",
   "01010011000000001011",
   "01010011010100111110",
   "01010011101001110101",
   "01010011111110110010",
   "01010100010011110101",
   "01010100101000111100",
   "01010100111110001001",
   "01010101010011011011",
   "01010101101000110011",
   "01010101111110010000",
   "01010110010011110010",
   "01010110101001011010",
      others => (others => '0'));
      	begin 
      return tmp;
      end init_rom;
	signal rom : memory_t := init_rom;
   signal Y1 :  std_logic_vector(19 downto 0);
   signal Y0 :  std_logic_vector(19 downto 0);
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
    Y <= Y1 & Y0(18 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_11_f700_uid83
--                     (IntAdderClassical_11_f700_uid85)
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

entity IntAdder_11_f700_uid83 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of IntAdder_11_f700_uid83 is
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
--                 IntMultiplier_UsingDSP_11_6_6_signed_uid70
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_11_6_6_signed_uid70 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_6_6_signed_uid70 is
   component IntAdder_11_f700_uid83 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

signal XX_m71 :  std_logic_vector(10 downto 0);
signal YY_m71 :  std_logic_vector(5 downto 0);
signal DSP_bh72_ch0_0, DSP_bh72_ch0_0_d1 :  std_logic_vector(42 downto 0);
signal heap_bh72_w9_0 : std_logic;
signal heap_bh72_w8_0 : std_logic;
signal heap_bh72_w7_0 : std_logic;
signal heap_bh72_w6_0 : std_logic;
signal heap_bh72_w5_0 : std_logic;
signal heap_bh72_w4_0 : std_logic;
signal heap_bh72_w3_0 : std_logic;
signal heap_bh72_w2_0 : std_logic;
signal heap_bh72_w1_0 : std_logic;
signal heap_bh72_w0_0 : std_logic;
signal heap_bh72_w3_1, heap_bh72_w3_1_d1 : std_logic;
signal finalAdderIn0_bh72 :  std_logic_vector(10 downto 0);
signal finalAdderIn1_bh72 :  std_logic_vector(10 downto 0);
signal finalAdderCin_bh72 : std_logic;
signal finalAdderOut_bh72 :  std_logic_vector(10 downto 0);
signal CompressionResult72 :  std_logic_vector(10 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            DSP_bh72_ch0_0_d1 <=  DSP_bh72_ch0_0;
            heap_bh72_w3_1_d1 <=  heap_bh72_w3_1;
         end if;
      end process;
   XX_m71 <= X ;
   YY_m71 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh72_ch0_0 <= ("0" & XX_m71(10 downto 0) & "0000000000000") * ("0" & YY_m71(5 downto 0) & "00000000000");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh72_w9_0 <= DSP_bh72_ch0_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w8_0 <= DSP_bh72_ch0_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w7_0 <= DSP_bh72_ch0_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w6_0 <= DSP_bh72_ch0_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w5_0 <= DSP_bh72_ch0_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w4_0 <= DSP_bh72_ch0_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w3_0 <= DSP_bh72_ch0_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w2_0 <= DSP_bh72_ch0_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w1_0 <= DSP_bh72_ch0_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh72_w0_0 <= DSP_bh72_ch0_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh72_w3_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh72 <= "0" & heap_bh72_w9_0 & heap_bh72_w8_0 & heap_bh72_w7_0 & heap_bh72_w6_0 & heap_bh72_w5_0 & heap_bh72_w4_0 & heap_bh72_w3_1_d1 & heap_bh72_w2_0 & heap_bh72_w1_0 & heap_bh72_w0_0;
   finalAdderIn1_bh72 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh72_w3_0 & '0' & '0' & '0';
   finalAdderCin_bh72 <= '0';
   Adder_final72_0: IntAdder_11_f700_uid83  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh72,
                 R => finalAdderOut_bh72   ,
                 X => finalAdderIn0_bh72,
                 Y => finalAdderIn1_bh72);
   -- concatenate all the compressed chunks
   CompressionResult72 <= finalAdderOut_bh72;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult72(9 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_14_f700_uid91
--                     (IntAdderClassical_14_f700_uid93)
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

entity IntAdder_14_f700_uid91 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(13 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntAdder_14_f700_uid91 is
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
--                          IntAdder_19_f700_uid111
--                     (IntAdderClassical_19_f700_uid113)
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

entity IntAdder_19_f700_uid111 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(18 downto 0);
          Y : in  std_logic_vector(18 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(18 downto 0)   );
end entity;

architecture arch of IntAdder_19_f700_uid111 is
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
--                IntMultiplier_UsingDSP_11_14_14_signed_uid98
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_11_14_14_signed_uid98 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_14_14_signed_uid98 is
   component IntAdder_19_f700_uid111 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(18 downto 0);
             Y : in  std_logic_vector(18 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(18 downto 0)   );
   end component;

signal XX_m99 :  std_logic_vector(13 downto 0);
signal YY_m99 :  std_logic_vector(10 downto 0);
signal DSP_bh100_ch0_0, DSP_bh100_ch0_0_d1 :  std_logic_vector(42 downto 0);
signal heap_bh100_w17_0, heap_bh100_w17_0_d1 : std_logic;
signal heap_bh100_w16_0, heap_bh100_w16_0_d1 : std_logic;
signal heap_bh100_w15_0, heap_bh100_w15_0_d1 : std_logic;
signal heap_bh100_w14_0, heap_bh100_w14_0_d1 : std_logic;
signal heap_bh100_w13_0, heap_bh100_w13_0_d1 : std_logic;
signal heap_bh100_w12_0, heap_bh100_w12_0_d1 : std_logic;
signal heap_bh100_w11_0, heap_bh100_w11_0_d1 : std_logic;
signal heap_bh100_w10_0, heap_bh100_w10_0_d1 : std_logic;
signal heap_bh100_w9_0, heap_bh100_w9_0_d1 : std_logic;
signal heap_bh100_w8_0, heap_bh100_w8_0_d1 : std_logic;
signal heap_bh100_w7_0, heap_bh100_w7_0_d1 : std_logic;
signal heap_bh100_w6_0, heap_bh100_w6_0_d1 : std_logic;
signal heap_bh100_w5_0, heap_bh100_w5_0_d1 : std_logic;
signal heap_bh100_w4_0, heap_bh100_w4_0_d1 : std_logic;
signal heap_bh100_w3_0, heap_bh100_w3_0_d1 : std_logic;
signal heap_bh100_w2_0, heap_bh100_w2_0_d1 : std_logic;
signal heap_bh100_w1_0, heap_bh100_w1_0_d1 : std_logic;
signal heap_bh100_w0_0, heap_bh100_w0_0_d1 : std_logic;
signal heap_bh100_w3_1, heap_bh100_w3_1_d1, heap_bh100_w3_1_d2 : std_logic;
signal finalAdderIn0_bh100 :  std_logic_vector(18 downto 0);
signal finalAdderIn1_bh100 :  std_logic_vector(18 downto 0);
signal finalAdderCin_bh100 : std_logic;
signal finalAdderOut_bh100 :  std_logic_vector(18 downto 0);
signal CompressionResult100 :  std_logic_vector(18 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            DSP_bh100_ch0_0_d1 <=  DSP_bh100_ch0_0;
            heap_bh100_w17_0_d1 <=  heap_bh100_w17_0;
            heap_bh100_w16_0_d1 <=  heap_bh100_w16_0;
            heap_bh100_w15_0_d1 <=  heap_bh100_w15_0;
            heap_bh100_w14_0_d1 <=  heap_bh100_w14_0;
            heap_bh100_w13_0_d1 <=  heap_bh100_w13_0;
            heap_bh100_w12_0_d1 <=  heap_bh100_w12_0;
            heap_bh100_w11_0_d1 <=  heap_bh100_w11_0;
            heap_bh100_w10_0_d1 <=  heap_bh100_w10_0;
            heap_bh100_w9_0_d1 <=  heap_bh100_w9_0;
            heap_bh100_w8_0_d1 <=  heap_bh100_w8_0;
            heap_bh100_w7_0_d1 <=  heap_bh100_w7_0;
            heap_bh100_w6_0_d1 <=  heap_bh100_w6_0;
            heap_bh100_w5_0_d1 <=  heap_bh100_w5_0;
            heap_bh100_w4_0_d1 <=  heap_bh100_w4_0;
            heap_bh100_w3_0_d1 <=  heap_bh100_w3_0;
            heap_bh100_w2_0_d1 <=  heap_bh100_w2_0;
            heap_bh100_w1_0_d1 <=  heap_bh100_w1_0;
            heap_bh100_w0_0_d1 <=  heap_bh100_w0_0;
            heap_bh100_w3_1_d1 <=  heap_bh100_w3_1;
            heap_bh100_w3_1_d2 <=  heap_bh100_w3_1_d1;
         end if;
      end process;
   XX_m99 <= Y ;
   YY_m99 <= X ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh100_ch0_0 <= ("0" & XX_m99(13 downto 0) & "0000000000") * ("0" & YY_m99(10 downto 0) & "000000");
   ----------------Synchro barrier, entering cycle 1----------------
   heap_bh100_w17_0 <= DSP_bh100_ch0_0_d1(40); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w16_0 <= DSP_bh100_ch0_0_d1(39); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w15_0 <= DSP_bh100_ch0_0_d1(38); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w14_0 <= DSP_bh100_ch0_0_d1(37); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w13_0 <= DSP_bh100_ch0_0_d1(36); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w12_0 <= DSP_bh100_ch0_0_d1(35); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w11_0 <= DSP_bh100_ch0_0_d1(34); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w10_0 <= DSP_bh100_ch0_0_d1(33); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w9_0 <= DSP_bh100_ch0_0_d1(32); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w8_0 <= DSP_bh100_ch0_0_d1(31); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w7_0 <= DSP_bh100_ch0_0_d1(30); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w6_0 <= DSP_bh100_ch0_0_d1(29); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w5_0 <= DSP_bh100_ch0_0_d1(28); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w4_0 <= DSP_bh100_ch0_0_d1(27); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w3_0 <= DSP_bh100_ch0_0_d1(26); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w2_0 <= DSP_bh100_ch0_0_d1(25); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w1_0 <= DSP_bh100_ch0_0_d1(24); -- cycle= 1 cp= 2.09429e-10
   heap_bh100_w0_0 <= DSP_bh100_ch0_0_d1(23); -- cycle= 1 cp= 2.09429e-10
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh100_w3_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   finalAdderIn0_bh100 <= "0" & heap_bh100_w17_0_d1 & heap_bh100_w16_0_d1 & heap_bh100_w15_0_d1 & heap_bh100_w14_0_d1 & heap_bh100_w13_0_d1 & heap_bh100_w12_0_d1 & heap_bh100_w11_0_d1 & heap_bh100_w10_0_d1 & heap_bh100_w9_0_d1 & heap_bh100_w8_0_d1 & heap_bh100_w7_0_d1 & heap_bh100_w6_0_d1 & heap_bh100_w5_0_d1 & heap_bh100_w4_0_d1 & heap_bh100_w3_1_d2 & heap_bh100_w2_0_d1 & heap_bh100_w1_0_d1 & heap_bh100_w0_0_d1;
   finalAdderIn1_bh100 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh100_w3_0_d1 & '0' & '0' & '0';
   finalAdderCin_bh100 <= '0';
   Adder_final100_0: IntAdder_19_f700_uid111  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh100,
                 R => finalAdderOut_bh100   ,
                 X => finalAdderIn0_bh100,
                 Y => finalAdderIn1_bh100);
   -- concatenate all the compressed chunks
   CompressionResult100 <= finalAdderOut_bh100;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult100(17 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_21_f700_uid119
--                     (IntAdderClassical_21_f700_uid121)
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

entity IntAdder_21_f700_uid119 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(20 downto 0);
          Y : in  std_logic_vector(20 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(20 downto 0)   );
end entity;

architecture arch of IntAdder_21_f700_uid119 is
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
--                     PolynomialEvaluator_degree2_uid68
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010-2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 4 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity PolynomialEvaluator_degree2_uid68 is
   port ( clk, rst : in std_logic;
          Y : in  std_logic_vector(9 downto 0);
          a0 : in  std_logic_vector(19 downto 0);
          a1 : in  std_logic_vector(12 downto 0);
          a2 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(20 downto 0)   );
end entity;

architecture arch of PolynomialEvaluator_degree2_uid68 is
   component IntAdder_14_f700_uid91 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(13 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component IntAdder_21_f700_uid119 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(20 downto 0);
             Y : in  std_logic_vector(20 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(20 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_14_14_signed_uid98 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_6_6_signed_uid70 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(5 downto 0)   );
   end component;

signal sigmaP0, sigmaP0_d1 :  std_logic_vector(5 downto 0);
signal yT1, yT1_d1 :  std_logic_vector(10 downto 0);
signal piPT1 :  std_logic_vector(5 downto 0);
signal op1_1 :  std_logic_vector(13 downto 0);
signal op2_1 :  std_logic_vector(13 downto 0);
signal sigmaP1 :  std_logic_vector(13 downto 0);
signal yT2 :  std_logic_vector(10 downto 0);
signal piP2 :  std_logic_vector(13 downto 0);
signal op1_2 :  std_logic_vector(20 downto 0);
signal op2_2 :  std_logic_vector(20 downto 0);
signal sigmaP2 :  std_logic_vector(20 downto 0);
signal Y_d1, Y_d2 :  std_logic_vector(9 downto 0);
signal a0_d1, a0_d2, a0_d3, a0_d4 :  std_logic_vector(19 downto 0);
signal a1_d1, a1_d2 :  std_logic_vector(12 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sigmaP0_d1 <=  sigmaP0;
            yT1_d1 <=  yT1;
            Y_d1 <=  Y;
            Y_d2 <=  Y_d1;
            a0_d1 <=  a0;
            a0_d2 <=  a0_d1;
            a0_d3 <=  a0_d2;
            a0_d4 <=  a0_d3;
            a1_d1 <=  a1;
            a1_d2 <=  a1_d1;
         end if;
      end process;
   -- LSB weight of sigmaP0 is=2 size=6
   sigmaP0 <= a2;
   -- LSB weight of yT1 is=-8 size=11
   yT1 <= "0" & Y(9 downto 0);
   -- LSB weight of piP1 is=-6 size=17
   ----------------Synchro barrier, entering cycle 1----------------
   Product_1: IntMultiplier_UsingDSP_11_6_6_signed_uid70  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piPT1,
                 X => yT1_d1,
                 Y => sigmaP0_d1);
   ----------------Synchro barrier, entering cycle 2----------------
   op1_1 <= ((0 downto 0 => a1_d2(12)) & a1_d2 & "");
   op2_1 <= ((8 downto 0 => piPT1(4)) & piPT1(4 downto 0) & "");
   Sum1: IntAdder_14_f700_uid91  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP1,
                 X => op1_1,
                 Y => op2_1);
   -- weight of yT2 is=-8 size=11
   yT2 <= "0" & Y_d2(9 downto 0);
   -- weight of piP2 is=-5 size=25
   Product_2: IntMultiplier_UsingDSP_11_14_14_signed_uid98  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piP2,
                 X => yT2,
                 Y => sigmaP1);
   ----------------Synchro barrier, entering cycle 4----------------
   -- the delay at the output of the multiplier is : 0
   op1_2 <= (7 downto 0 => piP2(13)) & piP2(12 downto 0);
   op2_2 <= (0 downto 0 => a0_d4(19)) & a0_d4;
   Sum2: IntAdder_21_f700_uid119  -- pipelineDepth=0 maxInDelay=3.2865e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP2,
                 X => op1_2,
                 Y => op2_2);
   R <= sigmaP2(20 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                 exp_18_18
--                           (FunctionEvaluator_65)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Mioara Joldes, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 6 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity exp_18_18 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          R : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of exp_18_18 is
   component PolyCoeffTable_8_39 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : out  std_logic_vector(38 downto 0)   );
   end component;

   component PolynomialEvaluator_degree2_uid68 is
      port ( clk, rst : in std_logic;
             Y : in  std_logic_vector(9 downto 0);
             a0 : in  std_logic_vector(19 downto 0);
             a1 : in  std_logic_vector(12 downto 0);
             a2 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(20 downto 0)   );
   end component;

signal addr :  std_logic_vector(7 downto 0);
signal Coef, Coef_d1 :  std_logic_vector(38 downto 0);
signal y :  std_logic_vector(9 downto 0);
signal a0 :  std_logic_vector(19 downto 0);
signal a1 :  std_logic_vector(12 downto 0);
signal a2 :  std_logic_vector(5 downto 0);
signal Rpe :  std_logic_vector(20 downto 0);
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
   GeneratedTable: PolyCoeffTable_8_39  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => addr,
                 Y => Coef);
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   y <= X_d2(9 downto 0);
   a0<= Coef_d1(19 downto 0);
   a1<= Coef_d1(32 downto 20);
   a2<= Coef_d1(38 downto 33);
   PolynomialEvaluator: PolynomialEvaluator_degree2_uid68  -- pipelineDepth=4 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Rpe,
                 Y => y,
                 a0 => a0,
                 a1 => a1,
                 a2 => a2);
   ----------------Synchro barrier, entering cycle 6----------------
   -- weight of poly result is : 4
    R <= Rpe(20 downto 3);
end architecture;

