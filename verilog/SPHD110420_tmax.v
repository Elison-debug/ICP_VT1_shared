//  
//  
//  ------------------------------------------------------------
//    STMicroelectronics N.V. 2011
//   All rights reserved. Reproduction in whole or part is prohibited  without the written consent of the copyright holder.                                                                                                                                                                                                                                                                                                                           
//    STMicroelectronics RESERVES THE RIGHTS TO MAKE CHANGES WITHOUT  NOTICE AT ANY TIME.
//  STMicroelectronics MAKES NO WARRANTY,  EXPRESSED, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANY IMPLIED  WARRANTY OR MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE,  OR THAT THE USE WILL NOT INFRINGE ANY THIRD PARTY PATENT,  COPYRIGHT OR TRADEMARK.
//  STMicroelectronics SHALL NOT BE LIABLE  FOR ANY LOSS OR DAMAGE ARISING FROM THE USE OF ITS LIBRARIES OR  SOFTWARE.
//    STMicroelectronics
//   850, Rue Jean Monnet
//   BP 16 - 38921 Crolles Cedex - France
//   Central R&D / DAIS.
//                                                                                                                                                                                                                                                                                                                                                                             
//    
//  
//  ------------------------------------------------------------
//  
//  
//    User           : sophie dumont           
//    Project        : CMP_LUND_110420         
//    Division       : Not known               
//    Creation date  : 20 April 2011           
//    Generator mode : MemConfMAT10/distributed
//    
//    WebGen configuration           : C65LP_ST_SPHDL:335,22:MemConfMAT10/distributed:2.4.a-00
//  
//    HDL C65_ST_SP Compiler version : 4.5@20081008.0 (UPT date)                               
//    
//  
//  For more information about the cuts or the generation environment, please
//  refer to files uk.env and ugnGuiSetupDB in directory DESIGN_DATA.
//   
//  
//  



// ------------------------------------------------------------------------------
// --  Function         : Tetramax Model 
// --  Release Date     : Nov, 2006 
// --  Last Modified By : ZZ
// --  Last modified in : 4.0   
// ------------------------------------------------------------------------------

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 32
   mux   = 8 
   
   
   
   
   

**********************END OF HEADER ******************************/
`celldefine



//********************************************//
// ST_SPHDL_160x32m8_L model for TetraMAX //
//********************************************//

module ST_SPHDL_160x32m8_L (Q, RY, CK, CSN, TBYPASS, WEN,  A, D  ); 
    parameter addrbits = 8;
    parameter addrmax = 160;
    parameter databits = 32; 


      
    input CSN, CK, WEN, TBYPASS;			  //chip select, output enable
    input [databits-1:0] D;	      	  //Data width
    input [addrbits-1:0] A;    		  //Address bus words
    output [databits-1:0] Q;   		  //Module outputs

    output RY;      
  





    supply0 gnd;

    wire [databits-1:0] Q;    	   //Data width
    reg [databits-1:0] memory [0:addrmax-1]; // memory storage
 
    reg [databits-1:0] readout, DO;
    

    and a0 (write, !WEN, !CSN, !TBYPASS);         	   // form write enable
    and a1 (read, WEN, !CSN, !TBYPASS);         	   // form read enable


    always @(posedge CK)
       if (write) begin
           memory[A] = D;
       end

    always @(posedge CK)
       if (read) begin
         readout = memory[A];
       end


_MUX my0 (TBYPASS, readout[0], D[0], DO[0]);
_MUX my1 (TBYPASS, readout[1], D[1], DO[1]);
_MUX my2 (TBYPASS, readout[2], D[2], DO[2]);
_MUX my3 (TBYPASS, readout[3], D[3], DO[3]);
_MUX my4 (TBYPASS, readout[4], D[4], DO[4]);
_MUX my5 (TBYPASS, readout[5], D[5], DO[5]);
_MUX my6 (TBYPASS, readout[6], D[6], DO[6]);
_MUX my7 (TBYPASS, readout[7], D[7], DO[7]);
_MUX my8 (TBYPASS, readout[8], D[8], DO[8]);
_MUX my9 (TBYPASS, readout[9], D[9], DO[9]);
_MUX my10 (TBYPASS, readout[10], D[10], DO[10]);
_MUX my11 (TBYPASS, readout[11], D[11], DO[11]);
_MUX my12 (TBYPASS, readout[12], D[12], DO[12]);
_MUX my13 (TBYPASS, readout[13], D[13], DO[13]);
_MUX my14 (TBYPASS, readout[14], D[14], DO[14]);
_MUX my15 (TBYPASS, readout[15], D[15], DO[15]);
_MUX my16 (TBYPASS, readout[16], D[16], DO[16]);
_MUX my17 (TBYPASS, readout[17], D[17], DO[17]);
_MUX my18 (TBYPASS, readout[18], D[18], DO[18]);
_MUX my19 (TBYPASS, readout[19], D[19], DO[19]);
_MUX my20 (TBYPASS, readout[20], D[20], DO[20]);
_MUX my21 (TBYPASS, readout[21], D[21], DO[21]);
_MUX my22 (TBYPASS, readout[22], D[22], DO[22]);
_MUX my23 (TBYPASS, readout[23], D[23], DO[23]);
_MUX my24 (TBYPASS, readout[24], D[24], DO[24]);
_MUX my25 (TBYPASS, readout[25], D[25], DO[25]);
_MUX my26 (TBYPASS, readout[26], D[26], DO[26]);
_MUX my27 (TBYPASS, readout[27], D[27], DO[27]);
_MUX my28 (TBYPASS, readout[28], D[28], DO[28]);
_MUX my29 (TBYPASS, readout[29], D[29], DO[29]);
_MUX my30 (TBYPASS, readout[30], D[30], DO[30]);
_MUX my31 (TBYPASS, readout[31], D[31], DO[31]);  


_BUF bfout0 (DO[0], Q[0]);
_BUF bfout1 (DO[1], Q[1]);
_BUF bfout2 (DO[2], Q[2]);
_BUF bfout3 (DO[3], Q[3]);
_BUF bfout4 (DO[4], Q[4]);
_BUF bfout5 (DO[5], Q[5]);
_BUF bfout6 (DO[6], Q[6]);
_BUF bfout7 (DO[7], Q[7]);
_BUF bfout8 (DO[8], Q[8]);
_BUF bfout9 (DO[9], Q[9]);
_BUF bfout10 (DO[10], Q[10]);
_BUF bfout11 (DO[11], Q[11]);
_BUF bfout12 (DO[12], Q[12]);
_BUF bfout13 (DO[13], Q[13]);
_BUF bfout14 (DO[14], Q[14]);
_BUF bfout15 (DO[15], Q[15]);
_BUF bfout16 (DO[16], Q[16]);
_BUF bfout17 (DO[17], Q[17]);
_BUF bfout18 (DO[18], Q[18]);
_BUF bfout19 (DO[19], Q[19]);
_BUF bfout20 (DO[20], Q[20]);
_BUF bfout21 (DO[21], Q[21]);
_BUF bfout22 (DO[22], Q[22]);
_BUF bfout23 (DO[23], Q[23]);
_BUF bfout24 (DO[24], Q[24]);
_BUF bfout25 (DO[25], Q[25]);
_BUF bfout26 (DO[26], Q[26]);
_BUF bfout27 (DO[27], Q[27]);
_BUF bfout28 (DO[28], Q[28]);
_BUF bfout29 (DO[29], Q[29]);
_BUF bfout30 (DO[30], Q[30]);
_BUF bfout31 (DO[31], Q[31]); 


    _TIEX tx (gnd, TX);
    _BUF buf1 (TX, RY);           
endmodule


`endcelldefine





// ------------------------------------------------------------------------------
// --  Function         : Tetramax Model 
// --  Release Date     : Nov, 2006 
// --  Last Modified By : ZZ
// --  Last modified in : 4.0   
// ------------------------------------------------------------------------------

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 1216
   bits  = 32
   mux   = 16 
   
   bit_write = yes 
   
   
   
   

**********************END OF HEADER ******************************/
`celldefine



//********************************************//
// ST_SPHDL_1216x32m16_bL model for TetraMAX //
//********************************************//

module ST_SPHDL_1216x32m16_bL (Q, RY, CK, CSN, TBYPASS, WEN,  A, D, M   ); 

    parameter addrbits = 11;
    parameter databits = 32;
    parameter words = 1216;
    parameter addrmax = 1216;





    output RY;      
    output [databits-1 : 0] Q;
    input [databits-1 : 0] D;
    input [addrbits-1 : 0] A;
    input [databits-1 :0] M;
    input CK, TBYPASS, CSN, WEN;




   

    supply0 gnd;        
    _TIEX tx (gnd, TX);
    _BUF buf1 (TX, RY);           

// For write enable

ST_SPHDL_1216x32m16_bL_1b_inst mp0 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[0]}), .M({M[0]}), .Q({Q[0]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp1 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[1]}), .M({M[1]}), .Q({Q[1]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp2 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[2]}), .M({M[2]}), .Q({Q[2]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp3 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[3]}), .M({M[3]}), .Q({Q[3]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp4 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[4]}), .M({M[4]}), .Q({Q[4]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp5 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[5]}), .M({M[5]}), .Q({Q[5]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp6 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[6]}), .M({M[6]}), .Q({Q[6]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp7 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[7]}), .M({M[7]}), .Q({Q[7]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp8 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[8]}), .M({M[8]}), .Q({Q[8]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp9 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[9]}), .M({M[9]}), .Q({Q[9]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp10 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[10]}), .M({M[10]}), .Q({Q[10]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp11 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[11]}), .M({M[11]}), .Q({Q[11]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp12 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[12]}), .M({M[12]}), .Q({Q[12]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp13 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[13]}), .M({M[13]}), .Q({Q[13]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp14 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[14]}), .M({M[14]}), .Q({Q[14]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp15 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[15]}), .M({M[15]}), .Q({Q[15]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp16 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[16]}), .M({M[16]}), .Q({Q[16]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp17 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[17]}), .M({M[17]}), .Q({Q[17]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp18 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[18]}), .M({M[18]}), .Q({Q[18]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp19 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[19]}), .M({M[19]}), .Q({Q[19]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp20 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[20]}), .M({M[20]}), .Q({Q[20]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp21 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[21]}), .M({M[21]}), .Q({Q[21]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp22 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[22]}), .M({M[22]}), .Q({Q[22]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp23 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[23]}), .M({M[23]}), .Q({Q[23]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp24 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[24]}), .M({M[24]}), .Q({Q[24]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp25 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[25]}), .M({M[25]}), .Q({Q[25]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp26 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[26]}), .M({M[26]}), .Q({Q[26]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp27 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[27]}), .M({M[27]}), .Q({Q[27]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp28 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[28]}), .M({M[28]}), .Q({Q[28]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp29 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[29]}), .M({M[29]}), .Q({Q[29]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp30 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[30]}), .M({M[30]}), .Q({Q[30]}) ); 
ST_SPHDL_1216x32m16_bL_1b_inst mp31 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[31]}), .M({M[31]}), .Q({Q[31]}) ); 

endmodule

//*************************************************//
// One_Bit_Memory model for TetraMax               //
//*************************************************//

module ST_SPHDL_1216x32m16_bL_1b_inst (Q, CK, CSN, TBYPASS, WEN, A, D, M );

    parameter databits = 1;
    parameter addrbits = 11;
    parameter addrmax  = 1216;
    input CK, WEN, CSN, TBYPASS;
    input  [addrbits-1:0] A;
    input  [databits-1:0] D,M;
    output [databits-1:0] Q;
     
    reg [databits-1:0] mymem [0:addrmax-1];
    reg [databits-1:0] readout, DO;
    wire [databits-1:0] Q;
    
    supply0 gnd;
    _TIEX tx (gnd, TX); 

    and a0 (read, !CSN, WEN, !TBYPASS);	// chip select & read enable
    and a1 (write, !CSN, !WEN, !M, !TBYPASS);	// chip select & write enable
 
 
    always @ (posedge CK) 
       if (write) begin
          mymem[A] = D[0];
       end
    
    always @ (posedge CK) 
       if (read) begin
         readout = mymem[A] ;
       end
    
    
   
    _MUX mx5 (TBYPASS,  readout[0], D[0], DO[0]);
    
    _BUF bfout (DO[0], Q[0]);
        
endmodule


`endcelldefine





// ------------------------------------------------------------------------------
// --  Function         : Tetramax Model 
// --  Release Date     : Nov, 2006 
// --  Last Modified By : ZZ
// --  Last modified in : 4.0   
// ------------------------------------------------------------------------------

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 64
   mux   = 8 
   
   
   
   
   

**********************END OF HEADER ******************************/
`celldefine



//********************************************//
// ST_SPHDL_160x64m8_L model for TetraMAX //
//********************************************//

module ST_SPHDL_160x64m8_L (Q, RY, CK, CSN, TBYPASS, WEN,  A, D  ); 
    parameter addrbits = 8;
    parameter addrmax = 160;
    parameter databits = 64; 


      
    input CSN, CK, WEN, TBYPASS;			  //chip select, output enable
    input [databits-1:0] D;	      	  //Data width
    input [addrbits-1:0] A;    		  //Address bus words
    output [databits-1:0] Q;   		  //Module outputs

    output RY;      
  





    supply0 gnd;

    wire [databits-1:0] Q;    	   //Data width
    reg [databits-1:0] memory [0:addrmax-1]; // memory storage
 
    reg [databits-1:0] readout, DO;
    

    and a0 (write, !WEN, !CSN, !TBYPASS);         	   // form write enable
    and a1 (read, WEN, !CSN, !TBYPASS);         	   // form read enable


    always @(posedge CK)
       if (write) begin
           memory[A] = D;
       end

    always @(posedge CK)
       if (read) begin
         readout = memory[A];
       end


_MUX my0 (TBYPASS, readout[0], D[0], DO[0]);
_MUX my1 (TBYPASS, readout[1], D[1], DO[1]);
_MUX my2 (TBYPASS, readout[2], D[2], DO[2]);
_MUX my3 (TBYPASS, readout[3], D[3], DO[3]);
_MUX my4 (TBYPASS, readout[4], D[4], DO[4]);
_MUX my5 (TBYPASS, readout[5], D[5], DO[5]);
_MUX my6 (TBYPASS, readout[6], D[6], DO[6]);
_MUX my7 (TBYPASS, readout[7], D[7], DO[7]);
_MUX my8 (TBYPASS, readout[8], D[8], DO[8]);
_MUX my9 (TBYPASS, readout[9], D[9], DO[9]);
_MUX my10 (TBYPASS, readout[10], D[10], DO[10]);
_MUX my11 (TBYPASS, readout[11], D[11], DO[11]);
_MUX my12 (TBYPASS, readout[12], D[12], DO[12]);
_MUX my13 (TBYPASS, readout[13], D[13], DO[13]);
_MUX my14 (TBYPASS, readout[14], D[14], DO[14]);
_MUX my15 (TBYPASS, readout[15], D[15], DO[15]);
_MUX my16 (TBYPASS, readout[16], D[16], DO[16]);
_MUX my17 (TBYPASS, readout[17], D[17], DO[17]);
_MUX my18 (TBYPASS, readout[18], D[18], DO[18]);
_MUX my19 (TBYPASS, readout[19], D[19], DO[19]);
_MUX my20 (TBYPASS, readout[20], D[20], DO[20]);
_MUX my21 (TBYPASS, readout[21], D[21], DO[21]);
_MUX my22 (TBYPASS, readout[22], D[22], DO[22]);
_MUX my23 (TBYPASS, readout[23], D[23], DO[23]);
_MUX my24 (TBYPASS, readout[24], D[24], DO[24]);
_MUX my25 (TBYPASS, readout[25], D[25], DO[25]);
_MUX my26 (TBYPASS, readout[26], D[26], DO[26]);
_MUX my27 (TBYPASS, readout[27], D[27], DO[27]);
_MUX my28 (TBYPASS, readout[28], D[28], DO[28]);
_MUX my29 (TBYPASS, readout[29], D[29], DO[29]);
_MUX my30 (TBYPASS, readout[30], D[30], DO[30]);
_MUX my31 (TBYPASS, readout[31], D[31], DO[31]);
_MUX my32 (TBYPASS, readout[32], D[32], DO[32]);
_MUX my33 (TBYPASS, readout[33], D[33], DO[33]);
_MUX my34 (TBYPASS, readout[34], D[34], DO[34]);
_MUX my35 (TBYPASS, readout[35], D[35], DO[35]);
_MUX my36 (TBYPASS, readout[36], D[36], DO[36]);
_MUX my37 (TBYPASS, readout[37], D[37], DO[37]);
_MUX my38 (TBYPASS, readout[38], D[38], DO[38]);
_MUX my39 (TBYPASS, readout[39], D[39], DO[39]);
_MUX my40 (TBYPASS, readout[40], D[40], DO[40]);
_MUX my41 (TBYPASS, readout[41], D[41], DO[41]);
_MUX my42 (TBYPASS, readout[42], D[42], DO[42]);
_MUX my43 (TBYPASS, readout[43], D[43], DO[43]);
_MUX my44 (TBYPASS, readout[44], D[44], DO[44]);
_MUX my45 (TBYPASS, readout[45], D[45], DO[45]);
_MUX my46 (TBYPASS, readout[46], D[46], DO[46]);
_MUX my47 (TBYPASS, readout[47], D[47], DO[47]);
_MUX my48 (TBYPASS, readout[48], D[48], DO[48]);
_MUX my49 (TBYPASS, readout[49], D[49], DO[49]);
_MUX my50 (TBYPASS, readout[50], D[50], DO[50]);
_MUX my51 (TBYPASS, readout[51], D[51], DO[51]);
_MUX my52 (TBYPASS, readout[52], D[52], DO[52]);
_MUX my53 (TBYPASS, readout[53], D[53], DO[53]);
_MUX my54 (TBYPASS, readout[54], D[54], DO[54]);
_MUX my55 (TBYPASS, readout[55], D[55], DO[55]);
_MUX my56 (TBYPASS, readout[56], D[56], DO[56]);
_MUX my57 (TBYPASS, readout[57], D[57], DO[57]);
_MUX my58 (TBYPASS, readout[58], D[58], DO[58]);
_MUX my59 (TBYPASS, readout[59], D[59], DO[59]);
_MUX my60 (TBYPASS, readout[60], D[60], DO[60]);
_MUX my61 (TBYPASS, readout[61], D[61], DO[61]);
_MUX my62 (TBYPASS, readout[62], D[62], DO[62]);
_MUX my63 (TBYPASS, readout[63], D[63], DO[63]);  


_BUF bfout0 (DO[0], Q[0]);
_BUF bfout1 (DO[1], Q[1]);
_BUF bfout2 (DO[2], Q[2]);
_BUF bfout3 (DO[3], Q[3]);
_BUF bfout4 (DO[4], Q[4]);
_BUF bfout5 (DO[5], Q[5]);
_BUF bfout6 (DO[6], Q[6]);
_BUF bfout7 (DO[7], Q[7]);
_BUF bfout8 (DO[8], Q[8]);
_BUF bfout9 (DO[9], Q[9]);
_BUF bfout10 (DO[10], Q[10]);
_BUF bfout11 (DO[11], Q[11]);
_BUF bfout12 (DO[12], Q[12]);
_BUF bfout13 (DO[13], Q[13]);
_BUF bfout14 (DO[14], Q[14]);
_BUF bfout15 (DO[15], Q[15]);
_BUF bfout16 (DO[16], Q[16]);
_BUF bfout17 (DO[17], Q[17]);
_BUF bfout18 (DO[18], Q[18]);
_BUF bfout19 (DO[19], Q[19]);
_BUF bfout20 (DO[20], Q[20]);
_BUF bfout21 (DO[21], Q[21]);
_BUF bfout22 (DO[22], Q[22]);
_BUF bfout23 (DO[23], Q[23]);
_BUF bfout24 (DO[24], Q[24]);
_BUF bfout25 (DO[25], Q[25]);
_BUF bfout26 (DO[26], Q[26]);
_BUF bfout27 (DO[27], Q[27]);
_BUF bfout28 (DO[28], Q[28]);
_BUF bfout29 (DO[29], Q[29]);
_BUF bfout30 (DO[30], Q[30]);
_BUF bfout31 (DO[31], Q[31]);
_BUF bfout32 (DO[32], Q[32]);
_BUF bfout33 (DO[33], Q[33]);
_BUF bfout34 (DO[34], Q[34]);
_BUF bfout35 (DO[35], Q[35]);
_BUF bfout36 (DO[36], Q[36]);
_BUF bfout37 (DO[37], Q[37]);
_BUF bfout38 (DO[38], Q[38]);
_BUF bfout39 (DO[39], Q[39]);
_BUF bfout40 (DO[40], Q[40]);
_BUF bfout41 (DO[41], Q[41]);
_BUF bfout42 (DO[42], Q[42]);
_BUF bfout43 (DO[43], Q[43]);
_BUF bfout44 (DO[44], Q[44]);
_BUF bfout45 (DO[45], Q[45]);
_BUF bfout46 (DO[46], Q[46]);
_BUF bfout47 (DO[47], Q[47]);
_BUF bfout48 (DO[48], Q[48]);
_BUF bfout49 (DO[49], Q[49]);
_BUF bfout50 (DO[50], Q[50]);
_BUF bfout51 (DO[51], Q[51]);
_BUF bfout52 (DO[52], Q[52]);
_BUF bfout53 (DO[53], Q[53]);
_BUF bfout54 (DO[54], Q[54]);
_BUF bfout55 (DO[55], Q[55]);
_BUF bfout56 (DO[56], Q[56]);
_BUF bfout57 (DO[57], Q[57]);
_BUF bfout58 (DO[58], Q[58]);
_BUF bfout59 (DO[59], Q[59]);
_BUF bfout60 (DO[60], Q[60]);
_BUF bfout61 (DO[61], Q[61]);
_BUF bfout62 (DO[62], Q[62]);
_BUF bfout63 (DO[63], Q[63]); 


    _TIEX tx (gnd, TX);
    _BUF buf1 (TX, RY);           
endmodule


`endcelldefine





// ------------------------------------------------------------------------------
// --  Function         : Tetramax Model 
// --  Release Date     : Nov, 2006 
// --  Last Modified By : ZZ
// --  Last modified in : 4.0   
// ------------------------------------------------------------------------------

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 640
   bits  = 32
   mux   = 16 
   
   
   
   
   

**********************END OF HEADER ******************************/
`celldefine



//********************************************//
// ST_SPHDL_640x32m16_L model for TetraMAX //
//********************************************//

module ST_SPHDL_640x32m16_L (Q, RY, CK, CSN, TBYPASS, WEN,  A, D  ); 
    parameter addrbits = 10;
    parameter addrmax = 640;
    parameter databits = 32; 


      
    input CSN, CK, WEN, TBYPASS;			  //chip select, output enable
    input [databits-1:0] D;	      	  //Data width
    input [addrbits-1:0] A;    		  //Address bus words
    output [databits-1:0] Q;   		  //Module outputs

    output RY;      
  





    supply0 gnd;

    wire [databits-1:0] Q;    	   //Data width
    reg [databits-1:0] memory [0:addrmax-1]; // memory storage
 
    reg [databits-1:0] readout, DO;
    

    and a0 (write, !WEN, !CSN, !TBYPASS);         	   // form write enable
    and a1 (read, WEN, !CSN, !TBYPASS);         	   // form read enable


    always @(posedge CK)
       if (write) begin
           memory[A] = D;
       end

    always @(posedge CK)
       if (read) begin
         readout = memory[A];
       end


_MUX my0 (TBYPASS, readout[0], D[0], DO[0]);
_MUX my1 (TBYPASS, readout[1], D[1], DO[1]);
_MUX my2 (TBYPASS, readout[2], D[2], DO[2]);
_MUX my3 (TBYPASS, readout[3], D[3], DO[3]);
_MUX my4 (TBYPASS, readout[4], D[4], DO[4]);
_MUX my5 (TBYPASS, readout[5], D[5], DO[5]);
_MUX my6 (TBYPASS, readout[6], D[6], DO[6]);
_MUX my7 (TBYPASS, readout[7], D[7], DO[7]);
_MUX my8 (TBYPASS, readout[8], D[8], DO[8]);
_MUX my9 (TBYPASS, readout[9], D[9], DO[9]);
_MUX my10 (TBYPASS, readout[10], D[10], DO[10]);
_MUX my11 (TBYPASS, readout[11], D[11], DO[11]);
_MUX my12 (TBYPASS, readout[12], D[12], DO[12]);
_MUX my13 (TBYPASS, readout[13], D[13], DO[13]);
_MUX my14 (TBYPASS, readout[14], D[14], DO[14]);
_MUX my15 (TBYPASS, readout[15], D[15], DO[15]);
_MUX my16 (TBYPASS, readout[16], D[16], DO[16]);
_MUX my17 (TBYPASS, readout[17], D[17], DO[17]);
_MUX my18 (TBYPASS, readout[18], D[18], DO[18]);
_MUX my19 (TBYPASS, readout[19], D[19], DO[19]);
_MUX my20 (TBYPASS, readout[20], D[20], DO[20]);
_MUX my21 (TBYPASS, readout[21], D[21], DO[21]);
_MUX my22 (TBYPASS, readout[22], D[22], DO[22]);
_MUX my23 (TBYPASS, readout[23], D[23], DO[23]);
_MUX my24 (TBYPASS, readout[24], D[24], DO[24]);
_MUX my25 (TBYPASS, readout[25], D[25], DO[25]);
_MUX my26 (TBYPASS, readout[26], D[26], DO[26]);
_MUX my27 (TBYPASS, readout[27], D[27], DO[27]);
_MUX my28 (TBYPASS, readout[28], D[28], DO[28]);
_MUX my29 (TBYPASS, readout[29], D[29], DO[29]);
_MUX my30 (TBYPASS, readout[30], D[30], DO[30]);
_MUX my31 (TBYPASS, readout[31], D[31], DO[31]);  


_BUF bfout0 (DO[0], Q[0]);
_BUF bfout1 (DO[1], Q[1]);
_BUF bfout2 (DO[2], Q[2]);
_BUF bfout3 (DO[3], Q[3]);
_BUF bfout4 (DO[4], Q[4]);
_BUF bfout5 (DO[5], Q[5]);
_BUF bfout6 (DO[6], Q[6]);
_BUF bfout7 (DO[7], Q[7]);
_BUF bfout8 (DO[8], Q[8]);
_BUF bfout9 (DO[9], Q[9]);
_BUF bfout10 (DO[10], Q[10]);
_BUF bfout11 (DO[11], Q[11]);
_BUF bfout12 (DO[12], Q[12]);
_BUF bfout13 (DO[13], Q[13]);
_BUF bfout14 (DO[14], Q[14]);
_BUF bfout15 (DO[15], Q[15]);
_BUF bfout16 (DO[16], Q[16]);
_BUF bfout17 (DO[17], Q[17]);
_BUF bfout18 (DO[18], Q[18]);
_BUF bfout19 (DO[19], Q[19]);
_BUF bfout20 (DO[20], Q[20]);
_BUF bfout21 (DO[21], Q[21]);
_BUF bfout22 (DO[22], Q[22]);
_BUF bfout23 (DO[23], Q[23]);
_BUF bfout24 (DO[24], Q[24]);
_BUF bfout25 (DO[25], Q[25]);
_BUF bfout26 (DO[26], Q[26]);
_BUF bfout27 (DO[27], Q[27]);
_BUF bfout28 (DO[28], Q[28]);
_BUF bfout29 (DO[29], Q[29]);
_BUF bfout30 (DO[30], Q[30]);
_BUF bfout31 (DO[31], Q[31]); 


    _TIEX tx (gnd, TX);
    _BUF buf1 (TX, RY);           
endmodule


`endcelldefine





// ------------------------------------------------------------------------------
// --  Function         : Tetramax Model 
// --  Release Date     : Nov, 2006 
// --  Last Modified By : ZZ
// --  Last modified in : 4.0   
// ------------------------------------------------------------------------------

/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 64
   mux   = 8 
   
   bit_write = yes 
   
   
   
   

**********************END OF HEADER ******************************/
`celldefine



//********************************************//
// ST_SPHDL_160x64m8_bL model for TetraMAX //
//********************************************//

module ST_SPHDL_160x64m8_bL (Q, RY, CK, CSN, TBYPASS, WEN,  A, D, M   ); 

    parameter addrbits = 8;
    parameter databits = 64;
    parameter words = 160;
    parameter addrmax = 160;





    output RY;      
    output [databits-1 : 0] Q;
    input [databits-1 : 0] D;
    input [addrbits-1 : 0] A;
    input [databits-1 :0] M;
    input CK, TBYPASS, CSN, WEN;




   

    supply0 gnd;        
    _TIEX tx (gnd, TX);
    _BUF buf1 (TX, RY);           

// For write enable

ST_SPHDL_160x64m8_bL_1b_inst mp0 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[0]}), .M({M[0]}), .Q({Q[0]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp1 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[1]}), .M({M[1]}), .Q({Q[1]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp2 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[2]}), .M({M[2]}), .Q({Q[2]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp3 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[3]}), .M({M[3]}), .Q({Q[3]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp4 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[4]}), .M({M[4]}), .Q({Q[4]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp5 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[5]}), .M({M[5]}), .Q({Q[5]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp6 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[6]}), .M({M[6]}), .Q({Q[6]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp7 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[7]}), .M({M[7]}), .Q({Q[7]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp8 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[8]}), .M({M[8]}), .Q({Q[8]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp9 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[9]}), .M({M[9]}), .Q({Q[9]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp10 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[10]}), .M({M[10]}), .Q({Q[10]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp11 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[11]}), .M({M[11]}), .Q({Q[11]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp12 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[12]}), .M({M[12]}), .Q({Q[12]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp13 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[13]}), .M({M[13]}), .Q({Q[13]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp14 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[14]}), .M({M[14]}), .Q({Q[14]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp15 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[15]}), .M({M[15]}), .Q({Q[15]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp16 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[16]}), .M({M[16]}), .Q({Q[16]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp17 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[17]}), .M({M[17]}), .Q({Q[17]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp18 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[18]}), .M({M[18]}), .Q({Q[18]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp19 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[19]}), .M({M[19]}), .Q({Q[19]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp20 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[20]}), .M({M[20]}), .Q({Q[20]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp21 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[21]}), .M({M[21]}), .Q({Q[21]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp22 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[22]}), .M({M[22]}), .Q({Q[22]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp23 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[23]}), .M({M[23]}), .Q({Q[23]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp24 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[24]}), .M({M[24]}), .Q({Q[24]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp25 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[25]}), .M({M[25]}), .Q({Q[25]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp26 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[26]}), .M({M[26]}), .Q({Q[26]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp27 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[27]}), .M({M[27]}), .Q({Q[27]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp28 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[28]}), .M({M[28]}), .Q({Q[28]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp29 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[29]}), .M({M[29]}), .Q({Q[29]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp30 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[30]}), .M({M[30]}), .Q({Q[30]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp31 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[31]}), .M({M[31]}), .Q({Q[31]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp32 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[32]}), .M({M[32]}), .Q({Q[32]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp33 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[33]}), .M({M[33]}), .Q({Q[33]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp34 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[34]}), .M({M[34]}), .Q({Q[34]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp35 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[35]}), .M({M[35]}), .Q({Q[35]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp36 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[36]}), .M({M[36]}), .Q({Q[36]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp37 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[37]}), .M({M[37]}), .Q({Q[37]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp38 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[38]}), .M({M[38]}), .Q({Q[38]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp39 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[39]}), .M({M[39]}), .Q({Q[39]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp40 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[40]}), .M({M[40]}), .Q({Q[40]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp41 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[41]}), .M({M[41]}), .Q({Q[41]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp42 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[42]}), .M({M[42]}), .Q({Q[42]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp43 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[43]}), .M({M[43]}), .Q({Q[43]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp44 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[44]}), .M({M[44]}), .Q({Q[44]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp45 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[45]}), .M({M[45]}), .Q({Q[45]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp46 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[46]}), .M({M[46]}), .Q({Q[46]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp47 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[47]}), .M({M[47]}), .Q({Q[47]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp48 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[48]}), .M({M[48]}), .Q({Q[48]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp49 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[49]}), .M({M[49]}), .Q({Q[49]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp50 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[50]}), .M({M[50]}), .Q({Q[50]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp51 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[51]}), .M({M[51]}), .Q({Q[51]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp52 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[52]}), .M({M[52]}), .Q({Q[52]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp53 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[53]}), .M({M[53]}), .Q({Q[53]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp54 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[54]}), .M({M[54]}), .Q({Q[54]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp55 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[55]}), .M({M[55]}), .Q({Q[55]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp56 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[56]}), .M({M[56]}), .Q({Q[56]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp57 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[57]}), .M({M[57]}), .Q({Q[57]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp58 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[58]}), .M({M[58]}), .Q({Q[58]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp59 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[59]}), .M({M[59]}), .Q({Q[59]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp60 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[60]}), .M({M[60]}), .Q({Q[60]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp61 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[61]}), .M({M[61]}), .Q({Q[61]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp62 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[62]}), .M({M[62]}), .Q({Q[62]}) ); 
ST_SPHDL_160x64m8_bL_1b_inst mp63 (.CK(CK), .WEN(WEN), .A(A), .TBYPASS(TBYPASS), .CSN(CSN), .D({D[63]}), .M({M[63]}), .Q({Q[63]}) ); 

endmodule

//*************************************************//
// One_Bit_Memory model for TetraMax               //
//*************************************************//

module ST_SPHDL_160x64m8_bL_1b_inst (Q, CK, CSN, TBYPASS, WEN, A, D, M );

    parameter databits = 1;
    parameter addrbits = 8;
    parameter addrmax  = 160;
    input CK, WEN, CSN, TBYPASS;
    input  [addrbits-1:0] A;
    input  [databits-1:0] D,M;
    output [databits-1:0] Q;
     
    reg [databits-1:0] mymem [0:addrmax-1];
    reg [databits-1:0] readout, DO;
    wire [databits-1:0] Q;
    
    supply0 gnd;
    _TIEX tx (gnd, TX); 

    and a0 (read, !CSN, WEN, !TBYPASS);	// chip select & read enable
    and a1 (write, !CSN, !WEN, !M, !TBYPASS);	// chip select & write enable
 
 
    always @ (posedge CK) 
       if (write) begin
          mymem[A] = D[0];
       end
    
    always @ (posedge CK) 
       if (read) begin
         readout = mymem[A] ;
       end
    
    
   
    _MUX mx5 (TBYPASS,  readout[0], D[0], DO[0]);
    
    _BUF bfout (DO[0], Q[0]);
        
endmodule


`endcelldefine


