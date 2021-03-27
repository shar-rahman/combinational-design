`timescale 1ns/1ns

module onehot_to_thermo(
    onehot,
    thermo
    );

input [15:0] onehot;
output reg [14:0] thermo;

integer i;


always @(onehot) begin
    thermo[14] = onehot[15];
    for (i = 14; i >= 1; i = i - 1) begin
        thermo[i - 1] = thermo[i] | onehot[i];
    end
end

endmodule
