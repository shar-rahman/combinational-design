`timescale 1ns/1ns
//`include "bin_to_onehot.v"

module tb_thermo_maj;

reg [14:0] in1;
reg [14:0] in2;
reg [14:0] in3;
reg [14:0] in4;
wire [14:0] out2;


majority first(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(out2)
);

initial begin
    in1 <= 15'b000000000000011;
    in2 <= 15'b000000001111111;
    in3 <= 15'b000000000111111;
    in4 <= 15'b000000000000001;

    $display("tb_thermo_maj.v: %b", out2);


    
end
endmodule


