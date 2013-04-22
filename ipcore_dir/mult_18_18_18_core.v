////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.49d
//  \   \         Application: netgen
//  /   /         Filename: mult_18_18_18_core.v
// /___/   /\     Timestamp: Sun Apr 21 21:20:56 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/TEMP/_cg/mult_18_18_18_core.ngc C:/TEMP/_cg/mult_18_18_18_core.v 
// Device	: 6vlx240tff1156-1
// Input file	: C:/TEMP/_cg/mult_18_18_18_core.ngc
// Output file	: C:/TEMP/_cg/mult_18_18_18_core.v
// # of Modules	: 1
// Design Name	: mult_18_18_18_core
// Xilinx        : C:\Xilinx\14.4\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mult_18_18_18_core (
  clk, a, b, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input [17 : 0] a;
  input [17 : 0] b;
  output [17 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \NLW_blk00000001/blk00000004_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_MULTSIGNIN_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYCASCIN_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCIN<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_C<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCIN<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_P<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_A<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_A<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_A<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_A<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_A<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000004_ACIN<0>_UNCONNECTED ;
  DSP48E1 #(
    .USE_DPORT ( "FALSE" ),
    .ADREG ( 0 ),
    .AREG ( 1 ),
    .ACASCREG ( 1 ),
    .BREG ( 1 ),
    .BCASCREG ( 1 ),
    .CREG ( 0 ),
    .MREG ( 0 ),
    .PREG ( 1 ),
    .CARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .INMODEREG ( 0 ),
    .USE_MULT ( "MULTIPLY" ),
    .A_INPUT ( "DIRECT" ),
    .B_INPUT ( "DIRECT" ),
    .DREG ( 0 ),
    .SEL_PATTERN ( "PATTERN" ),
    .MASK ( 48'h3fffffffffff ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .PATTERN ( 48'h000000000000 ),
    .USE_SIMD ( "ONE48" ),
    .AUTORESET_PATDET ( "NO_RESET" ),
    .SEL_MASK ( "MASK" ))
  \blk00000001/blk00000004  (
    .PATTERNBDETECT(\NLW_blk00000001/blk00000004_PATTERNBDETECT_UNCONNECTED ),
    .RSTC(\blk00000001/sig00000027 ),
    .CEB1(\blk00000001/sig00000027 ),
    .CEAD(\blk00000001/sig00000027 ),
    .MULTSIGNOUT(\NLW_blk00000001/blk00000004_MULTSIGNOUT_UNCONNECTED ),
    .CEC(\blk00000001/sig00000027 ),
    .RSTM(\blk00000001/sig00000027 ),
    .MULTSIGNIN(\NLW_blk00000001/blk00000004_MULTSIGNIN_UNCONNECTED ),
    .CEB2(\blk00000001/sig00000026 ),
    .RSTCTRL(\blk00000001/sig00000027 ),
    .CEP(\blk00000001/sig00000026 ),
    .CARRYCASCOUT(\NLW_blk00000001/blk00000004_CARRYCASCOUT_UNCONNECTED ),
    .RSTA(\blk00000001/sig00000027 ),
    .CECARRYIN(\blk00000001/sig00000027 ),
    .UNDERFLOW(\NLW_blk00000001/blk00000004_UNDERFLOW_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000001/blk00000004_PATTERNDETECT_UNCONNECTED ),
    .RSTALUMODE(\blk00000001/sig00000027 ),
    .RSTALLCARRYIN(\blk00000001/sig00000027 ),
    .CED(\blk00000001/sig00000027 ),
    .RSTD(\blk00000001/sig00000027 ),
    .CEALUMODE(\blk00000001/sig00000027 ),
    .CEA2(\blk00000001/sig00000026 ),
    .CLK(clk),
    .CEA1(\blk00000001/sig00000027 ),
    .RSTB(\blk00000001/sig00000027 ),
    .OVERFLOW(\NLW_blk00000001/blk00000004_OVERFLOW_UNCONNECTED ),
    .CECTRL(\blk00000001/sig00000027 ),
    .CEM(\blk00000001/sig00000027 ),
    .CARRYIN(\blk00000001/sig00000027 ),
    .CARRYCASCIN(\NLW_blk00000001/blk00000004_CARRYCASCIN_UNCONNECTED ),
    .RSTINMODE(\blk00000001/sig00000027 ),
    .CEINMODE(\blk00000001/sig00000027 ),
    .RSTP(\blk00000001/sig00000027 ),
    .ACOUT({\NLW_blk00000001/blk00000004_ACOUT<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<25>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<19>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACOUT<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACOUT<0>_UNCONNECTED }),
    .OPMODE({\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000026 , 
\blk00000001/sig00000027 , \blk00000001/sig00000026 }),
    .PCIN({\NLW_blk00000001/blk00000004_PCIN<47>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<46>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<45>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<44>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<43>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<42>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<41>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<40>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<39>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<38>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<37>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<36>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<35>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<34>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<33>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<32>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<31>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<30>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<26>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<25>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<24>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<20>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<19>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<18>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCIN<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCIN<0>_UNCONNECTED }),
    .ALUMODE({\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 }),
    .C({\NLW_blk00000001/blk00000004_C<47>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<46>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<45>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<44>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<43>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<42>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<41>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<40>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<39>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<38>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<37>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<36>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<35>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<34>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<33>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<32>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<31>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<30>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<26>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<25>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<24>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<20>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<19>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<18>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<14>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<13>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<12>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<8>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<7>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<6>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<2>_UNCONNECTED , \NLW_blk00000001/blk00000004_C<1>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_C<0>_UNCONNECTED }),
    .CARRYOUT({\NLW_blk00000001/blk00000004_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_CARRYOUT<0>_UNCONNECTED }),
    .INMODE({\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000026 , \blk00000001/sig00000027 , \blk00000001/sig00000027 }),
    .BCIN({\NLW_blk00000001/blk00000004_BCIN<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCIN<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCIN<0>_UNCONNECTED }),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .BCOUT({\NLW_blk00000001/blk00000004_BCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_BCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_BCOUT<0>_UNCONNECTED }),
    .D({\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , 
\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , 
\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , 
\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , 
\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 }),
    .P({\NLW_blk00000001/blk00000004_P<47>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<46>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<45>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<44>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<43>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<42>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<41>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<40>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<39>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<38>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<37>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<36>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<35>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<34>_UNCONNECTED , 
p[17], p[16], p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0], 
\NLW_blk00000001/blk00000004_P<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<14>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<13>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<12>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<8>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<7>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<6>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<2>_UNCONNECTED , \NLW_blk00000001/blk00000004_P<1>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_P<0>_UNCONNECTED }),
    .A({\NLW_blk00000001/blk00000004_A<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_A<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_A<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_A<26>_UNCONNECTED , \NLW_blk00000001/blk00000004_A<25>_UNCONNECTED , 
b[17], b[17], b[17], b[17], b[17], b[17], b[17], b[17], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], 
b[2], b[1], b[0]}),
    .PCOUT({\NLW_blk00000001/blk00000004_PCOUT<47>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<46>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<45>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<44>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<43>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<41>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<40>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<39>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<38>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<37>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<35>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<34>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<33>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<32>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<31>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<26>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<25>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<20>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<19>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_PCOUT<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_PCOUT<0>_UNCONNECTED }),
    .ACIN({\NLW_blk00000001/blk00000004_ACIN<29>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<28>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<27>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<26>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<25>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<24>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<23>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<22>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<21>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<20>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<19>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<18>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<17>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<16>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<15>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<14>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<13>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<12>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<11>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<10>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<9>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<8>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<7>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<6>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<5>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<4>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<3>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<2>_UNCONNECTED , 
\NLW_blk00000001/blk00000004_ACIN<1>_UNCONNECTED , \NLW_blk00000001/blk00000004_ACIN<0>_UNCONNECTED }),
    .CARRYINSEL({\blk00000001/sig00000027 , \blk00000001/sig00000027 , \blk00000001/sig00000027 })
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig00000027 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig00000026 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
