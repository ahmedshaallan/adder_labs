module four_bit_cla (
    input  wire      cin     ,
    input  wire      g0      ,
    input  wire      p0      ,
    input  wire      g1      ,
    input  wire      p1      ,
    input  wire      g2      ,
    input  wire      p2      ,
    input  wire      g3      ,
    input  wire      p3      ,
    output wire      c1      ,
    output wire      c2      ,
    output wire      c3      ,
    output wire      c4      ,
    output wire      G       ,
    output wire      P 
); 

assign c1 = g0 | p0 & cin ;                                                                      //the function of first carry in terms of cin , prop and gen
assign c2 = g1 | (p1 & g0) | (p1 & p0 & cin) ;                                                   //the function of second carry in terms of cin , prop and gen
assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin) ;                             //the function of third carry in terms of cin , prop and gen
assign c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin) ;  //the function of forth carry in terms of cin , prop and gen
assign G  = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) ;                              //function of output Gen
assign P  = p3 & p2 & p1 & p0 ;                                                                  //function of output Prop

    
endmodule