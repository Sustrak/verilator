// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2008 by Lane Brooks

module top (input SEL, input[1:0] A, output Z, output Y, output X, output W);
   assign Z = ( SEL) ? A[1] : 1'bz;
   tbuf tbuf(.A(A[0]), .OE(!SEL), .Z(Z));
//   assign Z = (!SEL) ? A[0] : 1'bz;

   tbuf mux0[1:0](.A(A), .OE({SEL,!SEL}), .Z(Y));

   pass mux1(.A(A), .SEL(SEL), .Z(X));
   mux  mux2(.A(A), .SEL(SEL), .Z(W));
endmodule

module pass (input[1:0] A, input SEL, output Z);
   tbuf tbuf1(.A(A[1]), .OE(SEL), .Z(Z));
   tbuf tbuf0(.A(A[0]), .OE(!SEL),.Z(Z));
endmodule

module tbuf (input A, input OE, output Z);
   assign Z = (OE) ? A : 1'bz;
endmodule

module mux (input[1:0] A, input SEL, output Z);
   assign Z = (SEL) ? A[1] : 1'bz;
   assign Z = (!SEL)? A[0] : 1'bz;
endmodule
