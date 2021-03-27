`timescale 1ns/1ns

module bin_to_onehot(
    bin,
    onehot
    );

input [3:0] bin;
output reg [15:0] onehot;

integer i;

always @(bin) begin
    for (i = 0; i < 16; i = i + 1) begin
        onehot[i] = (bin == i);
    end
end

endmodule
