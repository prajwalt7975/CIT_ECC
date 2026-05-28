`default_nettype none

module tt_um_alu7b (
    input  wire [6:0] ui_in,
    output wire [7:0] uo_out,

    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,

    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

    wire [6:0] a;
    wire [6:0] b;
    wire [2:0] op;

    reg [7:0] result;

    assign a  = ui_in[6:0];
    assign b  = uio_in[6:0];
    assign op = ui_in[2:0];

    always @(*) begin
        case(op)

            3'b000: result = a + b;
            3'b001: result = a & b;
            3'b010: result = a | b;
            3'b011: result = a ^ b;
            3'b100: result = a - b;
            3'b101: result = a << 1;
            3'b110: result = a >> 1;
            3'b111: result = ~a;

            default: result = 8'b00000000;

        endcase
    end

    assign uo_out = result;

    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule

`default_nettype wire
