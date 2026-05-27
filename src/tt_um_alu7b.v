`default_nettype none

module tt_um_alu7b (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,

    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire [6:0] a;
    wire [6:0] b;
    wire [2:0] op;

    wire [7:0] result;
    wire done;

    assign a  = ui_in[6:0];
    assign b  = uio_in[6:0];
    assign op = ui_in[2:0];

    serial_alu_ctrl uut (
        .clk(clk),
        .rst(~rst_n),
        .start(ena),
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .done(done)
    );

    assign uo_out = result;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule

`default_nettype wire
