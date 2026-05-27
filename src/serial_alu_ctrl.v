`default_nettype none

module serial_alu_ctrl (
    input  wire       clk,
    input  wire       rst,
    input  wire       start,
    input  wire [6:0] a,
    input  wire [6:0] b,
    input  wire [2:0] op,
    output reg  [7:0] result,
    output reg        done
);

    reg [2:0] state;

    localparam IDLE    = 3'b000;
    localparam EXECUTE = 3'b001;
    localparam FINISH  = 3'b010;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state  <= IDLE;
            result <= 8'b0;
            done   <= 1'b0;
        end
        else begin
            case(state)

                IDLE: begin
                    done <= 1'b0;

                    if(start)
                        state <= EXECUTE;
                end

                EXECUTE: begin
                    case(op)

                        3'b000: result <= a + b;
                        3'b001: result <= a & b;
                        3'b010: result <= a | b;
                        3'b011: result <= a ^ b;
                        3'b100: result <= a - b;

                        default: result <= 8'b0;

                    endcase

                    state <= FINISH;
                end

                FINISH: begin
                    done  <= 1'b1;
                    state <= IDLE;
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule

`default_nettype wire
