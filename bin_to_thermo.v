`timescale 1ns/1ns

module bin_to_thermo(
    bin,
    thermo
    );

input [3:0] bin;
output [14:0] thermo;

wire [15:0] onehot;

bin_to_onehot first(
    .bin(bin),
    .onehot(onehot)
);

onehot_to_thermo second(
    .onehot(onehot),
    .thermo(thermo)
);

endmodule
