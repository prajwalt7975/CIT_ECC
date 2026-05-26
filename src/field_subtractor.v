module field_subtractor(

    input  [7:0] a,
    input  [7:0] b,

    output [7:0] sub

);

assign sub = a - b;

endmodule
