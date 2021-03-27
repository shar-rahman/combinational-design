`timescale 1ns/1ns

module thermo_to_bin(
    thermo,
    bin
    );

input [14:0] thermo;
output [3:0] bin;
wire [15:0] onehot;

thermo_to_onehot first(.thermo(thermo), .onehot(onehot));

onehot_to_bin second(.onehot(onehot), .bin(bin));

endmodule
