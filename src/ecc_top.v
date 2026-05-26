
module ecc_top(
    input clk,
    input rst,
    input [7:0] message,
    input [7:0] key,
    output [7:0] cipher,
    output [7:0] decrypted,
    output valid
);

wire [7:0] temp_cipher;

encryption_block ENC (
    .clk(clk),
    .rst(rst),
    .message(message),
    .key(key),
    .cipher(temp_cipher)
);

decryption_block DEC (
    .clk(clk),
    .rst(rst),
    .cipher(temp_cipher),
    .key(key),
    .message(decrypted)
);

signature_verification SIG (
    .signature(temp_cipher),
    .expected(temp_cipher),
    .valid(valid)
);

assign cipher = temp_cipher;

endmodule
