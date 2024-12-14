module look_ahead_adder  (
   
    input  wire [63:0]    A     ,   
    input  wire [63:0]    B     ,
    output wire [63:0]    Sum   ,
    input  wire           Cin   ,
    output wire           Cout  

);
    
    wire [  4:0  ]  G ; //wires for generations output of every 16 bit cla  
    wire [  4:0  ]  P ; //wires for propagations output of every 16 bit cla
    wire [  63:0 ]  c ; //wires for all carry signals to connect them with all carries even it is from 16s or 4 cla
    

 
    sixteen_bit_cla cla1 (

        
        .g(A[15:0] & B[15:0] ), //connect g as it is anding A , B
        .p(A[15:0] ^ B[15:0]),  //connect p as it is xoring A , B  
        .cin(Cin),              //connect cin     
        .c(c[14:0]) ,           //as we said connect our c wires with carries  
        .G(G[0]) ,              //Gen outputs of 16 bit cla with G wire to connect it as an input for our 4 bit cla5
        .P(P[0])                //prop outputs of 16 bit cla with P wire to connect it as an input for our 4 bit cla5
    
    );

    sixteen_bit_cla cla2 (

        .g    ( A[31:16] & B[31:16] ),
        .p    ( A[31:16] ^ B[31:16] ),
        .c    ( c[30:16]            ),
        .cin  ( c[15]               ), //as cin will be connected with c[15] that is one of the output carries from  4 bit cla5
        .G    ( G[1]                ),
        .P    ( P[1]                )  
    
    );

     sixteen_bit_cla cla3 (

         .g    ( A[47:32] & B[47:32] ),
         .p    ( A[47:32] ^ B[47:32] ),
         .c    ( c[46:32]            ), 
         .cin  ( c[31]               ), //as cin will be connected with c[31] that is one of the output carries from  4 bit cla5
         .G    ( G[2]                ),
         .P    ( P[2]                )  
    
    );

     sixteen_bit_cla cla4 (
         .g    (     A[63:48] & B[63:48]     ),
         .p    (     A[63:48] ^ B[63:48]     ),
         .c    (     {c[63:48]}              ),
         .cin  (     c[47]                   ),//as cin will be connected with c[31] that is one of the output carries from  4 bit cla5
         .G    (     G[3]                    ),
         .P    (     P[3]                    )  

        
    
    );

    four_bit_cla cla5 (

        .cin(  Cin     ),
        .g0 (  G[0]    ), 
        .p0 (  P[0]    ),
        .g1 (  G[1]    ),
        .p1 (  P[1]    ),
        .g2 (  G[2]    ),
        .p2 (  P[2]    ),
        .g3 (  G[3]    ),
        .p3 (  P[3]    ),
        .c1 (  c[15]   ), 
        .c2 (  c[31]   ),
        .c3 (  c[47]   ),
        .c4 (  Cout    ),
        .G  (  G[4]    ),
        .P  (  P[4]    )
    );
 

 assign Sum = A ^ B ^ {c[62:0],Cin} ; //xoring inputs and carries to get sum 


endmodule