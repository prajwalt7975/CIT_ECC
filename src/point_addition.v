module point_addition(

    input  [7:0] x1,
    input  [7:0] x2,

    output [7:0] x3

);

assign x3 = x1 + x2;

endmodule
