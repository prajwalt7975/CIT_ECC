`default_nettype none

module alu_7b (
    input  wire [6:0] A,
    input  wire [6:0] B,
    input  wire [2:0] op,
    output reg  [7:0] result
);

always @(*) begin
    case(op)
        3'b000: result = {1'b0, A} + {1'b0, B};
        3'b001: result = {1'b0, (A & B)};
        3'b010: result = {1'b0, (A | B)};
        3'b011: result = {1'b0, (A ^ B)};
        3'b100: result = {1'b0, A} - {1'b0, B};
        default: result = 8'b00000000;
    endcase
end

endmodule
