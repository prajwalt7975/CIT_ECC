module scalar_multiplication(

    input  [7:0] scalar,
    input  [7:0] point,

    output [15:0] result

);

assign result = scalar * point;

endmodule
