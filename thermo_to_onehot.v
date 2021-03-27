`timescale 1ns/1ns

module thermo_to_onehot(
    thermo,
    onehot
    );

input [14:0] thermo;
output reg [15:0] onehot;

integer i;

always @(thermo) begin
    if(thermo[0] == 0) 
        onehot[0] = 1;
    else
        onehot[0] = 0;
    onehot[15] = thermo[14];
    for(i = 14; i > 0; i = i - 1) begin
        onehot[i] = thermo[i] ^ thermo[i - 1];
    end
end

endmodule
