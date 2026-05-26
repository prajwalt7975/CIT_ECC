module point_doubling(

    input  [7:0] in,

    output [7:0] doubled

);

assign doubled = in << 1;

endmodule
