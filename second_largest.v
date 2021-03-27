`timescale 1ns/1ns

module second_largest(
    in1,
    in2,
    in3,
    in4,
    out
    );

// Inputs & outputs
input [3:0] in1;
input [3:0] in2;
input [3:0] in3;
input [3:0] in4;
output [3:0] out;

// Intermediate wires
wire [14:0] thermo_in1;
wire [14:0] thermo_in2;
wire [14:0] thermo_in3;
wire [14:0] thermo_in4;


bin_to_thermo encoder1(.bin(in1), .thermo(thermo_in1));
bin_to_thermo encoder2(.bin(in2), .thermo(thermo_in2));
bin_to_thermo encoder3(.bin(in3), .thermo(thermo_in3));
bin_to_thermo encoder4(.bin(in4), .thermo(thermo_in4));


thermo_maj maj0(
    .in1(thermo_in1),
    .in2(thermo_in2),
    .in3(thermo_in3),
    .in4(thermo_in4),
    .out(out)
    );


endmodule
