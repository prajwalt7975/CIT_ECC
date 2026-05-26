module encryption_block (
    input clk,
    input rst,
    input [7:0] message,
    input [7:0] key,
    output reg [7:0] cipher
);

always @(posedge clk or posedge rst) begin
    if (rst)
        cipher <= 8'b00000000;
    else
        cipher <= message ^ key;
end

endmodule
