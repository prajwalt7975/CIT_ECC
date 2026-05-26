
module key_generator(

    input  [7:0] private_key,
    output [7:0] public_key

);

assign public_key = private_key + 8'h01;

endmodule
