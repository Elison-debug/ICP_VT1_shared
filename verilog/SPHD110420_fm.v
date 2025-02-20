module ST_SPHDL_1216x32m16_bL (CK,CSN,RY,TBYPASS,WEN,A,D,M,Q );
 input CK,CSN,TBYPASS,WEN;
 input [10:0] A;
 input [31:0] D;
 input [31:0] M;
 output RY;
 output [31:0] Q;
endmodule
module ST_SPHDL_160x32m8_L (CK,CSN,RY,TBYPASS,WEN,A,D,Q );
 input CK,CSN,TBYPASS,WEN;
 input [7:0] A;
 input [31:0] D;
 output RY;
 output [31:0] Q;
endmodule
module ST_SPHDL_160x64m8_L (CK,CSN,RY,TBYPASS,WEN,A,D,Q );
 input CK,CSN,TBYPASS,WEN;
 input [7:0] A;
 input [63:0] D;
 output RY;
 output [63:0] Q;
endmodule
module ST_SPHDL_160x64m8_bL (CK,CSN,RY,TBYPASS,WEN,A,D,M,Q );
 input CK,CSN,TBYPASS,WEN;
 input [7:0] A;
 input [63:0] D;
 input [63:0] M;
 output RY;
 output [63:0] Q;
endmodule
module ST_SPHDL_640x32m16_L (CK,CSN,RY,TBYPASS,WEN,A,D,Q );
 input CK,CSN,TBYPASS,WEN;
 input [9:0] A;
 input [31:0] D;
 output RY;
 output [31:0] Q;
endmodule
