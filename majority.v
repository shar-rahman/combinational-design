`timescale 1ns/1ns

module majority(
    in1,
    in2,
    in3,
    in4,
    out
    );

input [14:0] in1;
input [14:0] in2;
input [14:0] in3;
input [14:0] in4;
output reg [14:0] out;

integer i, oneCount;

always @(in1,in2,in3,in4) begin
    for(i = 0; i < 15; i = i + 1) begin
        oneCount = 0;
        if(in1[i] == 1) oneCount = oneCount + 1;
        if(in2[i] == 1) oneCount = oneCount + 1;
        if(in3[i] == 1) oneCount = oneCount + 1;
        if(in4[i] == 1) oneCount = oneCount + 1;
        if(oneCount >= 2) out[i] = 1;
        else out[i] = 0;
    end
end

endmodule
