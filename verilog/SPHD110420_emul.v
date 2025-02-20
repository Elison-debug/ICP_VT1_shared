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




/****************************************************************
--  Description         : Emulator Model
--  Last modified in    : 4.0
--  Release Date        : Nov, 2006
--  Changes Made by	: ZZ
--
****************************************************************/


/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 32
   mux   = 8 
   
   
   
   
   
**********************END OF HEADER ******************************/

/* START OF HEADER
   This Header Gives Information about the parameters used inside the Model

   Words = 160
   Bits = 32
   Addr = 8
    
   WordZ = 32'bz;

   END OF HEADER */


   
`timescale 1ns / 1ns

module ST_SPHDL_160x32m8_L (Q, RY,CK, CSN, TBYPASS, WEN, A, D    );

parameter
  Words = 160,
  Bits = 32,
  Addr = 8;





parameter
  WordZ = 32'bz;


output [Bits-1 : 0] Q;

output RY;

input CK;
input CSN;
input WEN;
input TBYPASS;
input [Addr-1 : 0] A;
input [Bits-1 : 0] D;






reg [Bits-1 : 0] Mem [Words-1 : 0];
reg [Bits-1 : 0] Qreg;


always @ (posedge CK)
begin
  
  
      if (CSN == 1'b0)
       begin
        if (TBYPASS == 1'b0 )   
        begin
          if (WEN == 1'b0)
          begin     
          
             //Write Cycle
              Mem[A] <= D;
          
          end //if (WEN == 1'b0)
      
          else if(WEN == 1'b1)
          begin        
              //Read Cycle
              Qreg <= Mem[A];
          end //else if(WEN == 
        end // if (TBYPASS == 1'b0
      end //if (CSN =  
  
end //


assign RY =  1'b1;



assign Q =  (TBYPASS == 0) ? Qreg : D;


endmodule








/****************************************************************
--  Description         : Emulator Model
--  Last modified in    : 4.0
--  Release Date        : Nov, 2006
--  Changes Made by	: ZZ
--
****************************************************************/


/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 1216
   bits  = 32
   mux   = 16 
   
   bit_write = yes 
   
   
   
   
**********************END OF HEADER ******************************/

/* START OF HEADER
   This Header Gives Information about the parameters used inside the Model

   Words = 1216
   Bits = 32
   Addr = 11
    
   WordZ = 32'bz;

   END OF HEADER */


   
`timescale 1ns / 1ns

module ST_SPHDL_1216x32m16_bL (Q, RY,CK, CSN, TBYPASS, WEN, A, D , M   );

parameter
  Words = 1216,
  Bits = 32,
  Addr = 11;





parameter
  WordZ = 32'bz;


output [Bits-1 : 0] Q;

output RY;

input CK;
input CSN;
input WEN;
input TBYPASS;
input [Addr-1 : 0] A;
input [Bits-1 : 0] D;
 
input [Bits-1 : 0] M; 





reg [Bits-1 : 0] Mem [Words-1 : 0];
reg [Bits-1 : 0] Qreg;


always @ (posedge CK)
begin
  
  
      if (CSN == 1'b0)
       begin
        if (TBYPASS == 1'b0 )   
        begin
          if (WEN == 1'b0)
          begin     
          
              //Write Cycle
            Mem[A] <= (Mem[A] & M) | (D & ~M);
          
          end //if (WEN == 1'b0)
      
          else if(WEN == 1'b1)
          begin        
              //Read Cycle
              Qreg <= Mem[A];
          end //else if(WEN == 
        end // if (TBYPASS == 1'b0
      end //if (CSN =  
  
end //


assign RY =  1'b1;



assign Q =  (TBYPASS == 0) ? Qreg : D;


endmodule








/****************************************************************
--  Description         : Emulator Model
--  Last modified in    : 4.0
--  Release Date        : Nov, 2006
--  Changes Made by	: ZZ
--
****************************************************************/


/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 64
   mux   = 8 
   
   
   
   
   
**********************END OF HEADER ******************************/

/* START OF HEADER
   This Header Gives Information about the parameters used inside the Model

   Words = 160
   Bits = 64
   Addr = 8
    
   WordZ = 64'bz;

   END OF HEADER */


   
`timescale 1ns / 1ns

module ST_SPHDL_160x64m8_L (Q, RY,CK, CSN, TBYPASS, WEN, A, D    );

parameter
  Words = 160,
  Bits = 64,
  Addr = 8;





parameter
  WordZ = 64'bz;


output [Bits-1 : 0] Q;

output RY;

input CK;
input CSN;
input WEN;
input TBYPASS;
input [Addr-1 : 0] A;
input [Bits-1 : 0] D;






reg [Bits-1 : 0] Mem [Words-1 : 0];
reg [Bits-1 : 0] Qreg;


always @ (posedge CK)
begin
  
  
      if (CSN == 1'b0)
       begin
        if (TBYPASS == 1'b0 )   
        begin
          if (WEN == 1'b0)
          begin     
          
             //Write Cycle
              Mem[A] <= D;
          
          end //if (WEN == 1'b0)
      
          else if(WEN == 1'b1)
          begin        
              //Read Cycle
              Qreg <= Mem[A];
          end //else if(WEN == 
        end // if (TBYPASS == 1'b0
      end //if (CSN =  
  
end //


assign RY =  1'b1;



assign Q =  (TBYPASS == 0) ? Qreg : D;


endmodule








/****************************************************************
--  Description         : Emulator Model
--  Last modified in    : 4.0
--  Release Date        : Nov, 2006
--  Changes Made by	: ZZ
--
****************************************************************/


/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 640
   bits  = 32
   mux   = 16 
   
   
   
   
   
**********************END OF HEADER ******************************/

/* START OF HEADER
   This Header Gives Information about the parameters used inside the Model

   Words = 640
   Bits = 32
   Addr = 10
    
   WordZ = 32'bz;

   END OF HEADER */


   
`timescale 1ns / 1ns

module ST_SPHDL_640x32m16_L (Q, RY,CK, CSN, TBYPASS, WEN, A, D    );

parameter
  Words = 640,
  Bits = 32,
  Addr = 10;





parameter
  WordZ = 32'bz;


output [Bits-1 : 0] Q;

output RY;

input CK;
input CSN;
input WEN;
input TBYPASS;
input [Addr-1 : 0] A;
input [Bits-1 : 0] D;






reg [Bits-1 : 0] Mem [Words-1 : 0];
reg [Bits-1 : 0] Qreg;


always @ (posedge CK)
begin
  
  
      if (CSN == 1'b0)
       begin
        if (TBYPASS == 1'b0 )   
        begin
          if (WEN == 1'b0)
          begin     
          
             //Write Cycle
              Mem[A] <= D;
          
          end //if (WEN == 1'b0)
      
          else if(WEN == 1'b1)
          begin        
              //Read Cycle
              Qreg <= Mem[A];
          end //else if(WEN == 
        end // if (TBYPASS == 1'b0
      end //if (CSN =  
  
end //


assign RY =  1'b1;



assign Q =  (TBYPASS == 0) ? Qreg : D;


endmodule








/****************************************************************
--  Description         : Emulator Model
--  Last modified in    : 4.0
--  Release Date        : Nov, 2006
--  Changes Made by	: ZZ
--
****************************************************************/


/******************** START OF HEADER****************************
   This Header Gives Information about the parameters & options present in the Model

   words = 160
   bits  = 64
   mux   = 8 
   
   bit_write = yes 
   
   
   
   
**********************END OF HEADER ******************************/

/* START OF HEADER
   This Header Gives Information about the parameters used inside the Model

   Words = 160
   Bits = 64
   Addr = 8
    
   WordZ = 64'bz;

   END OF HEADER */


   
`timescale 1ns / 1ns

module ST_SPHDL_160x64m8_bL (Q, RY,CK, CSN, TBYPASS, WEN, A, D , M   );

parameter
  Words = 160,
  Bits = 64,
  Addr = 8;





parameter
  WordZ = 64'bz;


output [Bits-1 : 0] Q;

output RY;

input CK;
input CSN;
input WEN;
input TBYPASS;
input [Addr-1 : 0] A;
input [Bits-1 : 0] D;
 
input [Bits-1 : 0] M; 





reg [Bits-1 : 0] Mem [Words-1 : 0];
reg [Bits-1 : 0] Qreg;


always @ (posedge CK)
begin
  
  
      if (CSN == 1'b0)
       begin
        if (TBYPASS == 1'b0 )   
        begin
          if (WEN == 1'b0)
          begin     
          
              //Write Cycle
            Mem[A] <= (Mem[A] & M) | (D & ~M);
          
          end //if (WEN == 1'b0)
      
          else if(WEN == 1'b1)
          begin        
              //Read Cycle
              Qreg <= Mem[A];
          end //else if(WEN == 
        end // if (TBYPASS == 1'b0
      end //if (CSN =  
  
end //


assign RY =  1'b1;



assign Q =  (TBYPASS == 0) ? Qreg : D;


endmodule




