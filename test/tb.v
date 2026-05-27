`timescale 1ns/1ps

module tb;

    reg clk;
    reg rst;
    reg start;

    reg [6:0] a;
    reg [6:0] b;
    reg [2:0] op;

    wire [7:0] result;
    wire done;

    serial_alu_ctrl uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        start = 0;

        #10 rst = 0;

        a = 7'd10;
        b = 7'd5;
        op = 3'b000;

        start = 1;

        #20;

        start = 0;

        #100;

        $finish;

    end

endmodule
