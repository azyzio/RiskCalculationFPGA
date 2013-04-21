--------------------------------------------------------------------------------
--                               Compressor_2_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_2_2 is
   port ( X0 : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_2_2 is
signal X :  std_logic_vector(1 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "00" when "00", 
      "01" when "01", 
      "01" when "10", 
      "10" when "11", 
      "--" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_3_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_3_2 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2 is
signal X :  std_logic_vector(2 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "00" when "000", 
      "01" when "001", 
      "01" when "010", 
      "10" when "011", 
      "01" when "100", 
      "10" when "101", 
      "10" when "110", 
      "11" when "111", 
      "--" when others;

end architecture;

--------------------------------------------------------------------------------
--                            PolyCoeffTable_8_31
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Mioara Joldes (2010)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
entity PolyCoeffTable_8_31 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : out  std_logic_vector(30 downto 0)   );
end entity;

architecture arch of PolyCoeffTable_8_31 is
   -- Build a 2-D array type for the RoM
   subtype word_t is std_logic_vector(30 downto 0);
   type memory_t is array(0 to 255) of word_t;
   function init_rom
      return memory_t is 
      variable tmp : memory_t := (
   "0000000010000000010000000000100",
   "1111100010000010010000000100100",
   "1110000010000110010000001000100",
   "0010000001111100010000001100101",
   "0000000010000010010000010000101",
   "0010100001111100010000010100110",
   "1110000010001000010000011000110",
   "1111000010000110010000011100111",
   "1111000010000110010000100001000",
   "1111100010000110010000100101001",
   "1101000010001100010000101001010",
   "0010100010000000010000101101100",
   "1111100010001000010000110001101",
   "0010000010000010010000110101111",
   "1101100010001110010000111010000",
   "1101100010001110010000111110010",
   "1110000010001110010001000010100",
   "1101100010010000010001000110110",
   "0010100010000100010001001011001",
   "1111100010001100010001001111011",
   "0011000010000100010001010011110",
   "1110000010010000010001011000000",
   "1111000010001110010001011100011",
   "0000100010001100010001100000110",
   "1110100010010000010001100101001",
   "1110100010010010010001101001100",
   "0001100010001010010001101110000",
   "1110100010010010010001110010011",
   "0001100010001100010001110110111",
   "0010000010001010010001111011011",
   "0011100010001000010001111111111",
   "0010100010001010010010000100011",
   "0010100010001100010010001000111",
   "1111000010010100010010001101011",
   "0010100010001100010010010010000",
   "0000000010010100010010010110100",
   "0000100010010010010010011011001",
   "0010000010010000010010011111110",
   "0000000010010100010010100100011",
   "0000000010010110010010101001000",
   "1101100010011100010010101101101",
   "0000000010010110010010110010011",
   "0100000010001110010010110111001",
   "1110100010011100010010111011110",
   "1110100010011100010011000000100",
   "1110000010011110010011000101010",
   "0011000010010010010011001010001",
   "0001000010011000010011001110111",
   "1101000010100010010011010011101",
   "0000000010011100010011011000100",
   "0001000010011010010011011101011",
   "0000000010011100010011100010010",
   "1111100010011110010011100111001",
   "1110100010100010010011101100000",
   "0010000010011010010011110001000",
   "1110000010100100010011110101111",
   "0000000010100000010011111010111",
   "0000000010100000010011111111111",
   "1111100010100010010100000100111",
   "1110000010100110010100001001111",
   "0010100010011100010100001111000",
   "1110100010100110010100010100000",
   "0000100010100010010100011001001",
   "0001100010100000010100011110010",
   "0010000010100000010100100011011",
   "0000100010100100010100101000100",
   "1111100010101000010100101101101",
   "0010000010100010010100110010111",
   "1101000010101110010100111000000",
   "1111100010101010010100111101010",
   "1110100010101100010101000010100",
   "1110000010101110010101000111110",
   "0010100010100100010101001101001",
   "1111100010101100010101010010011",
   "0001000010101000010101010111110",
   "0011100010100100010101011101001",
   "0010100010100110010101100010100",
   "0010000010101000010101100111111",
   "0000000010101110010101101101010",
   "1101000010110110010101110010101",
   "0000000010110000010101111000001",
   "0001000010101110010101111101101",
   "0001100010101110010110000011001",
   "0000000010110010010110001000101",
   "1110000010111000010110001110001",
   "0000100010110010010110010011110",
   "0010000010101110010110011001011",
   "0011100010101100010110011111000",
   "0010100010101110010110100100101",
   "0001100010110010010110101010010",
   "1111100010111000010110101111111",
   "0010000010110010010110110101101",
   "1100100011000000010110111011010",
   "1110000010111110010111000001000",
   "0100000010110000010111000110111",
   "0000100010111000010111001100101",
   "1111000010111110010111010010011",
   "0000100010111010010111011000010",
   "0001100010111000010111011110001",
   "0001000010111010010111100100000",
   "0001000010111100010111101001111",
   "1101100011000100010111101111110",
   "0000100010111110010111110101110",
   "0010100010111010010111111011110",
   "0001100010111100011000000001110",
   "0010100010111100011000000111110",
   "1111000011000100011000001101110",
   "0011000010111100011000010011111",
   "1110100011001000011000011001111",
   "1110100011001000011000100000000",
   "1110000011001010011000100110001",
   "0010000011000000011000101100011",
   "0000100011000110011000110010100",
   "0010000011000010011000111000110",
   "0011100011000000011000111111000",
   "0011000011000010011001000101010",
   "0001100011000110011001001011100",
   "1101100011010000011001010001110",
   "0000100011001010011001011000001",
   "0001100011001000011001011110100",
   "0001000011001010011001100100111",
   "0000000011001110011001101011010",
   "1101000011010110011001110001101",
   "0000000011010000011001111000001",
   "0001000011001110011001111110101",
   "0000100011010000011010000101001",
   "1110000011010110011010001011101",
   "0011000011001100011010010010010",
   "1101000011011010011010011000110",
   "1111100011010110011010011111011",
   "1111000011011000011010100110000",
   "0011000011001110011010101100110",
   "0000100011010110011010110011011",
   "0010100011010010011010111010001",
   "0010100011010010011011000000111",
   "0001000011010110011011000111101",
   "1111000011011100011011001110011",
   "0011000011010100011011010101010",
   "1101100011100010011011011100000",
   "1110000011100010011011100010111",
   "0011000011010110011011101001111",
   "0001000011011100011011110000110",
   "0100000011010110011011110111110",
   "1101100011100110011011111110101",
   "1101000011101000011100000101101",
   "0010100011011100011100001100110",
   "1110100011100110011100010011110",
   "0000100011100010011100011010111",
   "0001000011100010011100100010000",
   "1111100011100110011100101001001",
   "1111000011101010011100110000010",
   "0000100011100110011100110111100",
   "0010000011100100011100111110110",
   "0001100011100110011101000110000",
   "1111000011101100011101001101010",
   "0011000011100100011101010100101",
   "1101100011110010011101011011111",
   "1110000011110010011101100011010",
   "0011000011100110011101101010110",
   "0000100011101110011101110010001",
   "0010100011101010011101111001101",
   "0010100011101010011110000001001",
   "0010100011101100011110001000101",
   "0000100011110010011110010000001",
   "0010000011101110011110010111110",
   "0011100011101100011110011111011",
   "0011000011101110011110100111000",
   "0001000011110100011110101110101",
   "1101100011111110011110110110010",
   "1110100011111100011110111110000",
   "1110000011111110011111000101110",
   "0010100011110100011111001101101",
   "0000000011111100011111010101011",
   "0001000011111010011111011101010",
   "0000100011111100011111100101001",
   "1111100100000000011111101101000",
   "0010000011111010011111110101000",
   "0011000011111000011111111101000",
   "0100000011111000100000000101000",
   "0001100011111110100000001101000",
   "1110000100001000100000010101000",
   "1111000100000110100000011101001",
   "1111100100000110100000100101010",
   "1101100100001100100000101101011",
   "0001100100000100100000110101101",
   "0010100100000010100000111101111",
   "0010000100000100100001000110001",
   "0000000100001010100001001110011",
   "0011000100000100100001010110110",
   "1110000100010010100001011111000",
   "0100000100000100100001100111100",
   "0001000100001100100001101111111",
   "1101100100010110100001111000010",
   "1111000100010100100010000000110",
   "1100100100011010100010001001010",
   "0000000100010010100010010001111",
   "0010000100001110100010011010100",
   "0010100100001110100010100011001",
   "0001100100010010100010101011110",
   "1111000100011010100010110100011",
   "0000000100011000100010111101001",
   "1111100100011010100011000101111",
   "1101100100100000100011001110101",
   "0000100100011010100011010111100",
   "0010000100011000100011100000011",
   "0000100100011100100011101001010",
   "1111000100100010100011110010001",
   "0001000100011110100011111011001",
   "0000100100100000100100000100001",
   "1111100100100100100100001101001",
   "0001000100100000100100010110010",
   "0010100100011110100100011111011",
   "0010100100100000100100101000100",
   "1111100100101000100100110001101",
   "0001100100100100100100111010111",
   "0010000100100100100101000100001",
   "0000000100101010100101001101011",
   "0100000100100010100101010110110",
   "1110000100110010100101100000000",
   "1100100100110110100101101001011",
   "0001100100101100100101110010111",
   "0010100100101010100101111100011",
   "0010000100101100100110000101111",
   "0000000100110010100110001111011",
   "0011000100101100100110011001000",
   "0011100100101100100110100010101",
   "0001100100110010100110101100010",
   "1111000100111010100110110101111",
   "0000100100111000100110111111101",
   "1111000100111100100111001001011",
   "0011000100110100100111010011010",
   "1101100101000010100111011101000",
   "1110100101000010100111100110111",
   "0010000100111010100111110000111",
   "1101100101000110100111111010110",
   "1101000101001000101000000100110",
   "0001100100111110101000001110111",
   "1110100101001000101000011000111",
   "1111000101001000101000100011000",
   "1110000101001100101000101101001",
   "0001000101000110101000110111011",
   "0001000101000110101001000001101",
   "1111000101001100101001001011111",
   "0011000101000100101001010110010",
   "1110000101010010101001100000100",
   "0011100101000110101001101011000",
   "0000000101010000101001110101011",
   "0001000101001110101001111111111",
   "0000000101010010101010001010011",
   "0100000101001010101010010101000",
   "1111000101011000101010011111100",
   "1100100101011110101010101010001",
   "0000100101010110101010110100111",
   "0010000101010100101010111111101",
   "0000100101011000101011001010011",
   "1110000101100000101011010101001",
      others => (others => '0'));
      	begin 
      return tmp;
      end init_rom;
	signal rom : memory_t := init_rom;
   signal Y0 :  std_logic_vector(30 downto 0);
begin
	process(clk)
   begin
   if(rising_edge(clk)) then
   	Y0 <= rom(  TO_INTEGER(unsigned(X))  );
   end if;
   end process;
    Y <= Y0;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_10_f400_uid20
--                     (IntAdderClassical_10_f400_uid22)
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

entity IntAdder_10_f400_uid20 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(9 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntAdder_10_f400_uid20 is
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
--                 IntMultiplier_UsingDSP_11_6_5_signed_uid7
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

entity IntMultiplier_UsingDSP_11_6_5_signed_uid7 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(4 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_6_5_signed_uid7 is
   component IntAdder_10_f400_uid20 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(9 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(9 downto 0)   );
   end component;

signal XX_m8 :  std_logic_vector(10 downto 0);
signal YY_m8 :  std_logic_vector(5 downto 0);
signal DSP_bh9_ch0_0 :  std_logic_vector(42 downto 0);
signal heap_bh9_w8_0, heap_bh9_w8_0_d1 : std_logic;
signal heap_bh9_w7_0, heap_bh9_w7_0_d1 : std_logic;
signal heap_bh9_w6_0, heap_bh9_w6_0_d1 : std_logic;
signal heap_bh9_w5_0, heap_bh9_w5_0_d1 : std_logic;
signal heap_bh9_w4_0, heap_bh9_w4_0_d1 : std_logic;
signal heap_bh9_w3_0, heap_bh9_w3_0_d1 : std_logic;
signal heap_bh9_w2_0, heap_bh9_w2_0_d1 : std_logic;
signal heap_bh9_w1_0, heap_bh9_w1_0_d1 : std_logic;
signal heap_bh9_w0_0, heap_bh9_w0_0_d1 : std_logic;
signal heap_bh9_w3_1, heap_bh9_w3_1_d1 : std_logic;
signal heap_bh9_w8_1, heap_bh9_w8_1_d1 : std_logic;
signal finalAdderIn0_bh9 :  std_logic_vector(9 downto 0);
signal finalAdderIn1_bh9 :  std_logic_vector(9 downto 0);
signal finalAdderCin_bh9 : std_logic;
signal finalAdderOut_bh9 :  std_logic_vector(9 downto 0);
signal CompressionResult9 :  std_logic_vector(9 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh9_w8_0_d1 <=  heap_bh9_w8_0;
            heap_bh9_w7_0_d1 <=  heap_bh9_w7_0;
            heap_bh9_w6_0_d1 <=  heap_bh9_w6_0;
            heap_bh9_w5_0_d1 <=  heap_bh9_w5_0;
            heap_bh9_w4_0_d1 <=  heap_bh9_w4_0;
            heap_bh9_w3_0_d1 <=  heap_bh9_w3_0;
            heap_bh9_w2_0_d1 <=  heap_bh9_w2_0;
            heap_bh9_w1_0_d1 <=  heap_bh9_w1_0;
            heap_bh9_w0_0_d1 <=  heap_bh9_w0_0;
            heap_bh9_w3_1_d1 <=  heap_bh9_w3_1;
            heap_bh9_w8_1_d1 <=  heap_bh9_w8_1;
         end if;
      end process;
   XX_m8 <= X ;
   YY_m8 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh9_ch0_0 <= ("" & XX_m8(10 downto 0) & "00000000000000") * ("" & YY_m8(5 downto 0) & "000000000000");
   heap_bh9_w8_0 <= not( DSP_bh9_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w7_0 <= DSP_bh9_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w6_0 <= DSP_bh9_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w5_0 <= DSP_bh9_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w4_0 <= DSP_bh9_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w3_0 <= DSP_bh9_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w2_0 <= DSP_bh9_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w1_0 <= DSP_bh9_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh9_w0_0 <= DSP_bh9_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh9_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh9_w8_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh9 <= "0" & heap_bh9_w8_1_d1 & heap_bh9_w7_0_d1 & heap_bh9_w6_0_d1 & heap_bh9_w5_0_d1 & heap_bh9_w4_0_d1 & heap_bh9_w3_1_d1 & heap_bh9_w2_0_d1 & heap_bh9_w1_0_d1 & heap_bh9_w0_0_d1;
   finalAdderIn1_bh9 <= "0" & heap_bh9_w8_0_d1 & '0' & '0' & '0' & '0' & heap_bh9_w3_0_d1 & '0' & '0' & '0';
   finalAdderCin_bh9 <= '0';
   Adder_final9_0: IntAdder_10_f400_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh9,
                 R => finalAdderOut_bh9   ,
                 X => finalAdderIn0_bh9,
                 Y => finalAdderIn1_bh9);
   -- concatenate all the compressed chunks
   CompressionResult9 <= finalAdderOut_bh9;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult9(8 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_10_f400_uid28
--                     (IntAdderClassical_10_f400_uid30)
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

entity IntAdder_10_f400_uid28 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(9 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntAdder_10_f400_uid28 is
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
--                           IntAdder_15_f400_uid48
--                     (IntAdderClassical_15_f400_uid50)
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

entity IntAdder_15_f400_uid48 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(14 downto 0);
          Y : in  std_logic_vector(14 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(14 downto 0)   );
end entity;

architecture arch of IntAdder_15_f400_uid48 is
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
--                IntMultiplier_UsingDSP_11_10_10_signed_uid35
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

entity IntMultiplier_UsingDSP_11_10_10_signed_uid35 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(9 downto 0);
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_11_10_10_signed_uid35 is
   component IntAdder_15_f400_uid48 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(14 downto 0);
             Y : in  std_logic_vector(14 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(14 downto 0)   );
   end component;

signal XX_m36 :  std_logic_vector(10 downto 0);
signal YY_m36 :  std_logic_vector(9 downto 0);
signal DSP_bh37_ch0_0 :  std_logic_vector(42 downto 0);
signal heap_bh37_w13_0, heap_bh37_w13_0_d1 : std_logic;
signal heap_bh37_w12_0, heap_bh37_w12_0_d1 : std_logic;
signal heap_bh37_w11_0, heap_bh37_w11_0_d1 : std_logic;
signal heap_bh37_w10_0, heap_bh37_w10_0_d1 : std_logic;
signal heap_bh37_w9_0, heap_bh37_w9_0_d1 : std_logic;
signal heap_bh37_w8_0, heap_bh37_w8_0_d1 : std_logic;
signal heap_bh37_w7_0, heap_bh37_w7_0_d1 : std_logic;
signal heap_bh37_w6_0, heap_bh37_w6_0_d1 : std_logic;
signal heap_bh37_w5_0, heap_bh37_w5_0_d1 : std_logic;
signal heap_bh37_w4_0, heap_bh37_w4_0_d1 : std_logic;
signal heap_bh37_w3_0, heap_bh37_w3_0_d1 : std_logic;
signal heap_bh37_w2_0, heap_bh37_w2_0_d1 : std_logic;
signal heap_bh37_w1_0, heap_bh37_w1_0_d1 : std_logic;
signal heap_bh37_w0_0, heap_bh37_w0_0_d1 : std_logic;
signal heap_bh37_w3_1, heap_bh37_w3_1_d1 : std_logic;
signal heap_bh37_w13_1, heap_bh37_w13_1_d1 : std_logic;
signal finalAdderIn0_bh37 :  std_logic_vector(14 downto 0);
signal finalAdderIn1_bh37 :  std_logic_vector(14 downto 0);
signal finalAdderCin_bh37 : std_logic;
signal finalAdderOut_bh37 :  std_logic_vector(14 downto 0);
signal CompressionResult37 :  std_logic_vector(14 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh37_w13_0_d1 <=  heap_bh37_w13_0;
            heap_bh37_w12_0_d1 <=  heap_bh37_w12_0;
            heap_bh37_w11_0_d1 <=  heap_bh37_w11_0;
            heap_bh37_w10_0_d1 <=  heap_bh37_w10_0;
            heap_bh37_w9_0_d1 <=  heap_bh37_w9_0;
            heap_bh37_w8_0_d1 <=  heap_bh37_w8_0;
            heap_bh37_w7_0_d1 <=  heap_bh37_w7_0;
            heap_bh37_w6_0_d1 <=  heap_bh37_w6_0;
            heap_bh37_w5_0_d1 <=  heap_bh37_w5_0;
            heap_bh37_w4_0_d1 <=  heap_bh37_w4_0;
            heap_bh37_w3_0_d1 <=  heap_bh37_w3_0;
            heap_bh37_w2_0_d1 <=  heap_bh37_w2_0;
            heap_bh37_w1_0_d1 <=  heap_bh37_w1_0;
            heap_bh37_w0_0_d1 <=  heap_bh37_w0_0;
            heap_bh37_w3_1_d1 <=  heap_bh37_w3_1;
            heap_bh37_w13_1_d1 <=  heap_bh37_w13_1;
         end if;
      end process;
   XX_m36 <= X ;
   YY_m36 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh37_ch0_0 <= ("" & XX_m36(10 downto 0) & "00000000000000") * ("" & YY_m36(9 downto 0) & "00000000");
   heap_bh37_w13_0 <= not( DSP_bh37_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w12_0 <= DSP_bh37_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w11_0 <= DSP_bh37_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w10_0 <= DSP_bh37_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w9_0 <= DSP_bh37_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w8_0 <= DSP_bh37_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w7_0 <= DSP_bh37_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w6_0 <= DSP_bh37_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w5_0 <= DSP_bh37_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w4_0 <= DSP_bh37_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w3_0 <= DSP_bh37_ch0_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w2_0 <= DSP_bh37_ch0_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w1_0 <= DSP_bh37_ch0_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh37_w0_0 <= DSP_bh37_ch0_0(29); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh37_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh37_w13_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh37 <= "0" & heap_bh37_w13_1_d1 & heap_bh37_w12_0_d1 & heap_bh37_w11_0_d1 & heap_bh37_w10_0_d1 & heap_bh37_w9_0_d1 & heap_bh37_w8_0_d1 & heap_bh37_w7_0_d1 & heap_bh37_w6_0_d1 & heap_bh37_w5_0_d1 & heap_bh37_w4_0_d1 & heap_bh37_w3_1_d1 & heap_bh37_w2_0_d1 & heap_bh37_w1_0_d1 & heap_bh37_w0_0_d1;
   finalAdderIn1_bh37 <= "0" & heap_bh37_w13_0_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh37_w3_0_d1 & '0' & '0' & '0';
   finalAdderCin_bh37 <= '0';
   Adder_final37_0: IntAdder_15_f400_uid48  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh37,
                 R => finalAdderOut_bh37   ,
                 X => finalAdderIn0_bh37,
                 Y => finalAdderIn1_bh37);
   -- concatenate all the compressed chunks
   CompressionResult37 <= finalAdderOut_bh37;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult37(13 downto 4);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_17_f400_uid56
--                     (IntAdderClassical_17_f400_uid58)
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

entity IntAdder_17_f400_uid56 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(16 downto 0);
          Y : in  std_logic_vector(16 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(16 downto 0)   );
end entity;

architecture arch of IntAdder_17_f400_uid56 is
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
-- Pipeline depth: 3 cycles

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
          a0 : in  std_logic_vector(15 downto 0);
          a1 : in  std_logic_vector(8 downto 0);
          a2 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(16 downto 0)   );
end entity;

architecture arch of PolynomialEvaluator_degree2_uid5 is
   component IntAdder_10_f400_uid28 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(9 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component IntAdder_17_f400_uid56 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(16 downto 0);
             Y : in  std_logic_vector(16 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(16 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_10_10_signed_uid35 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(9 downto 0);
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_11_6_5_signed_uid7 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(4 downto 0)   );
   end component;

signal sigmaP0, sigmaP0_d1 :  std_logic_vector(5 downto 0);
signal yT1, yT1_d1 :  std_logic_vector(10 downto 0);
signal piPT1 :  std_logic_vector(4 downto 0);
signal op1_1 :  std_logic_vector(9 downto 0);
signal op2_1 :  std_logic_vector(9 downto 0);
signal sigmaP1 :  std_logic_vector(9 downto 0);
signal yT2 :  std_logic_vector(10 downto 0);
signal piP2 :  std_logic_vector(9 downto 0);
signal op1_2 :  std_logic_vector(16 downto 0);
signal op2_2 :  std_logic_vector(16 downto 0);
signal sigmaP2 :  std_logic_vector(16 downto 0);
signal Y_d1, Y_d2 :  std_logic_vector(9 downto 0);
signal a0_d1, a0_d2, a0_d3 :  std_logic_vector(15 downto 0);
signal a1_d1, a1_d2 :  std_logic_vector(8 downto 0);
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
            a1_d1 <=  a1;
            a1_d2 <=  a1_d1;
         end if;
      end process;
   -- LSB weight of sigmaP0 is=5 size=6
   sigmaP0 <= a2;
   -- LSB weight of yT1 is=-8 size=11
   yT1 <= "0" & Y(9 downto 0);
   -- LSB weight of piP1 is=-3 size=17
   ----------------Synchro barrier, entering cycle 1----------------
   Product_1: IntMultiplier_UsingDSP_11_6_5_signed_uid7  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piPT1,
                 X => yT1_d1,
                 Y => sigmaP0_d1);
   ----------------Synchro barrier, entering cycle 2----------------
   op1_1 <= ((0 downto 0 => a1_d2(8)) & a1_d2 & "");
   op2_1 <= ((5 downto 0 => piPT1(3)) & piPT1(3 downto 0) & "");
   Sum1: IntAdder_10_f400_uid28  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP1,
                 X => op1_1,
                 Y => op2_1);
   -- weight of yT2 is=-8 size=11
   yT2 <= "0" & Y_d2(9 downto 0);
   -- weight of piP2 is=-5 size=21
   Product_2: IntMultiplier_UsingDSP_11_10_10_signed_uid35  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piP2,
                 X => yT2,
                 Y => sigmaP1);
   ----------------Synchro barrier, entering cycle 3----------------
   -- the delay at the output of the multiplier is : 0
   op1_2 <= (7 downto 0 => piP2(9)) & piP2(8 downto 0);
   op2_2 <= (0 downto 0 => a0_d3(15)) & a0_d3;
   Sum2: IntAdder_17_f400_uid56  -- pipelineDepth=0 maxInDelay=4.4472e-10
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP2,
                 X => op1_2,
                 Y => op2_2);
   R <= sigmaP2(16 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                 exp_18_14
--                           (FunctionEvaluator_2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Mioara Joldes, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 5 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity exp_18_14 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of exp_18_14 is
   component PolyCoeffTable_8_31 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : out  std_logic_vector(30 downto 0)   );
   end component;

   component PolynomialEvaluator_degree2_uid5 is
      port ( clk, rst : in std_logic;
             Y : in  std_logic_vector(9 downto 0);
             a0 : in  std_logic_vector(15 downto 0);
             a1 : in  std_logic_vector(8 downto 0);
             a2 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(16 downto 0)   );
   end component;

signal addr :  std_logic_vector(7 downto 0);
signal Coef, Coef_d1 :  std_logic_vector(30 downto 0);
signal y :  std_logic_vector(9 downto 0);
signal a0 :  std_logic_vector(15 downto 0);
signal a1 :  std_logic_vector(8 downto 0);
signal a2 :  std_logic_vector(5 downto 0);
signal Rpe :  std_logic_vector(16 downto 0);
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
   GeneratedTable: PolyCoeffTable_8_31  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => addr,
                 Y => Coef);
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 2----------------
   y <= X_d2(9 downto 0);
   a0<= Coef_d1(15 downto 0);
   a1<= Coef_d1(24 downto 16);
   a2<= Coef_d1(30 downto 25);
   PolynomialEvaluator: PolynomialEvaluator_degree2_uid5  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Rpe,
                 Y => y,
                 a0 => a0,
                 a1 => a1,
                 a2 => a2);
   ----------------Synchro barrier, entering cycle 5----------------
   -- weight of poly result is : 4
    R <= Rpe(16 downto 3);
end architecture;

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
--                           IntAdder_11_f400_uid83
--                     (IntAdderClassical_11_f400_uid85)
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

entity IntAdder_11_f400_uid83 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(10 downto 0);
          Y : in  std_logic_vector(10 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(10 downto 0)   );
end entity;

architecture arch of IntAdder_11_f400_uid83 is
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
   component IntAdder_11_f400_uid83 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(10 downto 0);
             Y : in  std_logic_vector(10 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(10 downto 0)   );
   end component;

signal XX_m71 :  std_logic_vector(10 downto 0);
signal YY_m71 :  std_logic_vector(5 downto 0);
signal DSP_bh72_ch0_0 :  std_logic_vector(42 downto 0);
signal heap_bh72_w9_0, heap_bh72_w9_0_d1 : std_logic;
signal heap_bh72_w8_0, heap_bh72_w8_0_d1 : std_logic;
signal heap_bh72_w7_0, heap_bh72_w7_0_d1 : std_logic;
signal heap_bh72_w6_0, heap_bh72_w6_0_d1 : std_logic;
signal heap_bh72_w5_0, heap_bh72_w5_0_d1 : std_logic;
signal heap_bh72_w4_0, heap_bh72_w4_0_d1 : std_logic;
signal heap_bh72_w3_0, heap_bh72_w3_0_d1 : std_logic;
signal heap_bh72_w2_0, heap_bh72_w2_0_d1 : std_logic;
signal heap_bh72_w1_0, heap_bh72_w1_0_d1 : std_logic;
signal heap_bh72_w0_0, heap_bh72_w0_0_d1 : std_logic;
signal heap_bh72_w3_1, heap_bh72_w3_1_d1 : std_logic;
signal heap_bh72_w9_1, heap_bh72_w9_1_d1 : std_logic;
signal finalAdderIn0_bh72 :  std_logic_vector(10 downto 0);
signal finalAdderIn1_bh72 :  std_logic_vector(10 downto 0);
signal finalAdderCin_bh72 : std_logic;
signal finalAdderOut_bh72 :  std_logic_vector(10 downto 0);
signal CompressionResult72 :  std_logic_vector(10 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh72_w9_0_d1 <=  heap_bh72_w9_0;
            heap_bh72_w8_0_d1 <=  heap_bh72_w8_0;
            heap_bh72_w7_0_d1 <=  heap_bh72_w7_0;
            heap_bh72_w6_0_d1 <=  heap_bh72_w6_0;
            heap_bh72_w5_0_d1 <=  heap_bh72_w5_0;
            heap_bh72_w4_0_d1 <=  heap_bh72_w4_0;
            heap_bh72_w3_0_d1 <=  heap_bh72_w3_0;
            heap_bh72_w2_0_d1 <=  heap_bh72_w2_0;
            heap_bh72_w1_0_d1 <=  heap_bh72_w1_0;
            heap_bh72_w0_0_d1 <=  heap_bh72_w0_0;
            heap_bh72_w3_1_d1 <=  heap_bh72_w3_1;
            heap_bh72_w9_1_d1 <=  heap_bh72_w9_1;
         end if;
      end process;
   XX_m71 <= X ;
   YY_m71 <= Y ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh72_ch0_0 <= ("" & XX_m71(10 downto 0) & "00000000000000") * ("" & YY_m71(5 downto 0) & "000000000000");
   heap_bh72_w9_0 <= not( DSP_bh72_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w8_0 <= DSP_bh72_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w7_0 <= DSP_bh72_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w6_0 <= DSP_bh72_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w5_0 <= DSP_bh72_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w4_0 <= DSP_bh72_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w3_0 <= DSP_bh72_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w2_0 <= DSP_bh72_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w1_0 <= DSP_bh72_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh72_w0_0 <= DSP_bh72_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh72_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh72_w9_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh72 <= "0" & heap_bh72_w9_1_d1 & heap_bh72_w8_0_d1 & heap_bh72_w7_0_d1 & heap_bh72_w6_0_d1 & heap_bh72_w5_0_d1 & heap_bh72_w4_0_d1 & heap_bh72_w3_1_d1 & heap_bh72_w2_0_d1 & heap_bh72_w1_0_d1 & heap_bh72_w0_0_d1;
   finalAdderIn1_bh72 <= "0" & heap_bh72_w9_0_d1 & '0' & '0' & '0' & '0' & '0' & heap_bh72_w3_0_d1 & '0' & '0' & '0';
   finalAdderCin_bh72 <= '0';
   Adder_final72_0: IntAdder_11_f400_uid83  -- pipelineDepth=0 maxInDelay=0
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
--                           IntAdder_14_f400_uid91
--                     (IntAdderClassical_14_f400_uid93)
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

entity IntAdder_14_f400_uid91 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(13 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntAdder_14_f400_uid91 is
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
--                          IntAdder_19_f400_uid111
--                     (IntAdderClassical_19_f400_uid113)
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

entity IntAdder_19_f400_uid111 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(18 downto 0);
          Y : in  std_logic_vector(18 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(18 downto 0)   );
end entity;

architecture arch of IntAdder_19_f400_uid111 is
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
-- Pipeline depth: 1 cycles

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
   component IntAdder_19_f400_uid111 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(18 downto 0);
             Y : in  std_logic_vector(18 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(18 downto 0)   );
   end component;

signal XX_m99 :  std_logic_vector(13 downto 0);
signal YY_m99 :  std_logic_vector(10 downto 0);
signal DSP_bh100_ch0_0 :  std_logic_vector(42 downto 0);
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
signal heap_bh100_w3_1, heap_bh100_w3_1_d1 : std_logic;
signal heap_bh100_w17_1, heap_bh100_w17_1_d1 : std_logic;
signal finalAdderIn0_bh100 :  std_logic_vector(18 downto 0);
signal finalAdderIn1_bh100 :  std_logic_vector(18 downto 0);
signal finalAdderCin_bh100 : std_logic;
signal finalAdderOut_bh100 :  std_logic_vector(18 downto 0);
signal CompressionResult100 :  std_logic_vector(18 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
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
            heap_bh100_w17_1_d1 <=  heap_bh100_w17_1;
         end if;
      end process;
   XX_m99 <= Y ;
   YY_m99 <= X ;
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh100_ch0_0 <= ("" & XX_m99(13 downto 0) & "00000000000") * ("" & YY_m99(10 downto 0) & "0000000");
   heap_bh100_w17_0 <= not( DSP_bh100_ch0_0(42) ); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w16_0 <= DSP_bh100_ch0_0(41); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w15_0 <= DSP_bh100_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w14_0 <= DSP_bh100_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w13_0 <= DSP_bh100_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w12_0 <= DSP_bh100_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w11_0 <= DSP_bh100_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w10_0 <= DSP_bh100_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w9_0 <= DSP_bh100_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w8_0 <= DSP_bh100_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w7_0 <= DSP_bh100_ch0_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w6_0 <= DSP_bh100_ch0_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w5_0 <= DSP_bh100_ch0_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w4_0 <= DSP_bh100_ch0_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w3_0 <= DSP_bh100_ch0_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w2_0 <= DSP_bh100_ch0_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w1_0 <= DSP_bh100_ch0_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh100_w0_0 <= DSP_bh100_ch0_0(25); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
   heap_bh100_w3_1 <= '1'; -- cycle= 0 cp= 0
   heap_bh100_w17_1 <= '1'; -- cycle= 0 cp= 0
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh100 <= "0" & heap_bh100_w17_1_d1 & heap_bh100_w16_0_d1 & heap_bh100_w15_0_d1 & heap_bh100_w14_0_d1 & heap_bh100_w13_0_d1 & heap_bh100_w12_0_d1 & heap_bh100_w11_0_d1 & heap_bh100_w10_0_d1 & heap_bh100_w9_0_d1 & heap_bh100_w8_0_d1 & heap_bh100_w7_0_d1 & heap_bh100_w6_0_d1 & heap_bh100_w5_0_d1 & heap_bh100_w4_0_d1 & heap_bh100_w3_1_d1 & heap_bh100_w2_0_d1 & heap_bh100_w1_0_d1 & heap_bh100_w0_0_d1;
   finalAdderIn1_bh100 <= "0" & heap_bh100_w17_0_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh100_w3_0_d1 & '0' & '0' & '0';
   finalAdderCin_bh100 <= '0';
   Adder_final100_0: IntAdder_19_f400_uid111  -- pipelineDepth=0 maxInDelay=0
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
--                          IntAdder_21_f400_uid119
--                     (IntAdderClassical_21_f400_uid121)
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

entity IntAdder_21_f400_uid119 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(20 downto 0);
          Y : in  std_logic_vector(20 downto 0);
          Cin : in std_logic;
          R : out  std_logic_vector(20 downto 0)   );
end entity;

architecture arch of IntAdder_21_f400_uid119 is
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
-- Pipeline depth: 3 cycles

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
   component IntAdder_14_f400_uid91 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(13 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             Cin : in std_logic;
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component IntAdder_21_f400_uid119 is
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
signal a0_d1, a0_d2, a0_d3 :  std_logic_vector(19 downto 0);
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
   Sum1: IntAdder_14_f400_uid91  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => sigmaP1,
                 X => op1_1,
                 Y => op2_1);
   -- weight of yT2 is=-8 size=11
   yT2 <= "0" & Y_d2(9 downto 0);
   -- weight of piP2 is=-5 size=25
   Product_2: IntMultiplier_UsingDSP_11_14_14_signed_uid98  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => piP2,
                 X => yT2,
                 Y => sigmaP1);
   ----------------Synchro barrier, entering cycle 3----------------
   -- the delay at the output of the multiplier is : 0
   op1_2 <= (7 downto 0 => piP2(13)) & piP2(12 downto 0);
   op2_2 <= (0 downto 0 => a0_d3(19)) & a0_d3;
   Sum2: IntAdder_21_f400_uid119  -- pipelineDepth=0 maxInDelay=4.4472e-10
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
-- Pipeline depth: 5 cycles

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
   PolynomialEvaluator: PolynomialEvaluator_degree2_uid68  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Rpe,
                 Y => y,
                 a0 => a0,
                 a1 => a1,
                 a2 => a2);
   ----------------Synchro barrier, entering cycle 5----------------
   -- weight of poly result is : 4
    R <= Rpe(20 downto 3);
end architecture;

