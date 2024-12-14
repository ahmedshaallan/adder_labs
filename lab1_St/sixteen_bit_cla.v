module sixteen_bit_cla (
    
    input  wire [15:0]g       , 
    input  wire [15:0]p       ,
    input  wire       cin     ,
    output wire [15:0]c       ,
    output wire       G       ,
    output wire       P       


);

wire G3  ; // G3 wire as it will be connceted with four_bit_cla cla1 Gen output and with four_bit_cla cla5 input Gen
wire G7  ; // G7 wire as it will be connceted with four_bit_cla cla2 Gen output and with four_bit_cla cla5 input Gen
wire G11 ; // G11 wire as it will be connceted with four_bit_cla cla3 Gen output and with four_bit_cla cla5 input Gen
wire G15 ; // G5 wire as it will be connceted with four_bit_cla cla4 Gen output and with four_bit_cla cla5 input Gen
wire P3  ; // P3 wire as it will be connceted with four_bit_cla cla1 prop output and with four_bit_cla cla5 input prop
wire P7  ; // P7 wire as it will be connceted with four_bit_cla cla2 prop output and with four_bit_cla cla5 input prop
wire P11 ; // P11 wire as it will be connceted with four_bit_cla cla3 prop output and with four_bit_cla cla5 input prop
wire P15 ; // P15 wire as it will be connceted with four_bit_cla cla4 prop output and with four_bit_cla cla5 input prop

    

    four_bit_cla cla1(

        .cin  ( cin   ), 
        .g0   ( g[0]  ), 
        .g1   ( g[1]  ), 
        .g2   ( g[2]  ), 
        .g3   ( g[3]  ), 
        .p0   ( p[0]  ),
        .p1   ( p[1]  ),
        .p2   ( p[2]  ),
        .p3   ( p[3]  ),
        .c1   ( c[0]  ),
        .c2   ( c[1]  ),
        .c3   ( c[2]  ),
        .c4   (       ),
        .G    (  G3   ), 
        .P    (  P3   ) 

    );

     four_bit_cla cla2(

        .cin (  c[3]   ), //as it will be output from cla5
        .g0  (  g[4]   ), 
        .g1  (  g[5]   ), 
        .g2  (  g[6]   ), 
        .g3  (  g[7]   ), 
        .p0  (  p[4]   ),
        .p1  (  p[5]   ),
        .p2  (  p[6]   ),
        .p3  (  p[7]   ),
        .c1  (  c[4]   ),
        .c2  (  c[5]   ),
        .c3  (  c[6]   ),
        .c4  (         ),
        .G   (  G7     ), 
        .P   (  P7     )

    );

     four_bit_cla cla3(

        .cin (   c [7]    ),  //as it will be output from cla5
        .g0  (   g [8]    ), 
        .g1  (   g [9]    ), 
        .g2  (   g [10]   ), 
        .g3  (   g [11]   ), 
        .p0  (   p [8]    ),
        .p1  (   p [9]    ),
        .p2  (   p [10]   ),
        .p3  (   p [11]   ),
        .c1  (   c [8]    ),
        .c2  (   c [9]    ),
        .c3  (   c [10]   ),
        .c4  (            ),
        .G   (   G11      ), 
        .P   (   P11      )

    );

    four_bit_cla cla4(

        .cin (   c[11]    ),  //as it will be output from cla5
        .g0  (   g[12]    ), 
        .g1  (   g[13]    ), 
        .g2  (   g[14]    ), 
        .g3  (   g[15]    ), 
        .p0  (   p[12]    ),
        .p1  (   p[13]    ),
        .p2  (   p[14]    ),
        .p3  (   p[15]    ),
        .c1  (   c[12]    ),
        .c2  (   c[13]    ),
        .c3  (   c[14]    ),
        .c4  (            ),
        .G   (   G15      ),
        .P   (   P15      )

    );

    four_bit_cla cla5(

        .cin (   cin     ), 
        .g0  (   G3      ), 
        .g1  (   G7      ), 
        .g2  (   G11     ), 
        .g3  (   G15     ), 
        .p0  (   P3      ),
        .p1  (   P7      ),
        .p2  (   P11     ),
        .p3  (   P15     ),
        .c1  (   c[3]    ), //as it will be input for cla1
        .c2  (   c[7]    ), //as it will be input for cla2
        .c3  (   c[11]   ), //as it will be input for cla3
        .c4  (   c[15]   ), //as it will be input for cla4
        .G   (   G       ),
        .P   (   P       )

    );


    



endmodule