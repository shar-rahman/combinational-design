`timescale 1ns/1ns

module thermo_maj(
    in1,
    in2,
    in3,
    in4,
    out
    );

input [14:0] in1, in2, in3, in4;
output [3:0] out;

wire [14:0] thermo_out;

majority maj0(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(thermo_out)
    );

thermo_to_bin encoder0(.thermo(thermo_out), .bin(out));

endmodule
