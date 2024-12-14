// Code your testbench here 
// or browse Examples 
`timescale 1ns / 1ps 
 
module tb_look_ahead_adder; 
 
    // Parameters 
    parameter N = 64; 
 
    // Inputs 
    reg [N-1:0] a; 
    reg [N-1:0] b; 
    reg cin; 
 
    // Outputs 
    wire [N-1:0] sum; 
    wire cout; 
 
    // Instantiate the Unit Under Test (UUT) 
    look_ahead_adder  uut ( 
        .A(a), 
        .B(b), 
        .Cin(cin), 
        .Sum(sum), 
        .Cout(cout) 
    ); 
 
    initial begin 
        // Initialize Inputs 
        a = 0; 
        b = 0; 
        cin = 0; 
 
        // Apply test vectors 
        #10 a = 64'd1 ; b = 64'd1; cin = 0; // 1 + 1 = 2 
        #10 a = 64'd15; b = 64'd1; cin = 0; // 15 + 1 = 16 
        #10 a = 64'hffffffffffffffff; b = 64'd1; cin = 0; //sum = 0, cout =1 
        #10 a = 64'd19000; b = 64'd15000; cin = 0; // sum = 34000 , cout = 0
        #10 a = 64'hffffffff00000000; b = 64'h00000000ffffffff; cin = 1; // sum= 0 , cout =1
        #10 a = 64'd0; b = 64'd0; cin = 1; // 0 + 0 + 1 = 1 
 
        // Add more test cases as needed 
        #10 $stop; // Stop the simulation 
    end 
 
    initial begin 
        $monitor("At time %t, a = %d, b = %d, cin = %d, sum = %d, cout = %b", 
                 $time, a, b, cin, sum, cout); 
    end 
 
endmodule 
 
 
 
