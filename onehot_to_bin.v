`timescale 1ns/1ns

module onehot_to_bin(
    onehot,
    bin
    );

input [15:0] onehot;
output reg [3:0] bin;

integer i;

always @(onehot) begin
    if(onehot[0] == 1) 
        bin = 4'b0000;
    for(i = 1; i < 16; i = i + 1) begin
        if(onehot[i] == 1) 
            bin = i;
    end
end

endmodule
