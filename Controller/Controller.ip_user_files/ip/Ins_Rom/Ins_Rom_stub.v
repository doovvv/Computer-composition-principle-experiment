// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Nov 23 21:41:37 2023
// Host        : doov running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/vivado_projects/Computer-composition-principle-experiment/Controller/Controller.srcs/sources_1/ip/Ins_Rom/Ins_Rom_stub.v
// Design      : Ins_Rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module Ins_Rom(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[31:0]" */;
  input clka;
  input [7:0]addra;
  output [31:0]douta;
endmodule
