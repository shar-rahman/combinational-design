`timescale 1ns/1ns
module tb_thermo_maj;

reg [14:0] in1, in2, in3, in4;

reg [3:0] in1_bin, in2_bin, in3_bin, in4_bin;

wire [3:0] out;

integer amtCorrect, i, j, k, l;


thermo_maj dut(.in1(in1), .in2(in2), .in3(in3), .in4(in4), .out(out));

initial begin
    $display("~ Requirement 1 - Testing 7 Different sets of 4 inputs. ~");
    in1 = 15'b000000000001111;
    in2 = 15'b000000000111111;
    in3 = 15'b000000000011111;
    in4 = 15'b000000000001111;
    i = 4;
    j = 6;
    k = 5;
    l = 4;
    #10;
    if(out == k) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b111111111111111;
    in2 = 15'b000000001111111;
    in3 = 15'b000000000011111;
    in4 = 15'b000000000001111;
    i = 15;
    j = 7;
    k = 5;
    l = 4;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000000000000000;
    in2 = 15'b000000001111111;
    in3 = 15'b000000011111111;
    in4 = 15'b000000000000000;
    i = 0;
    j = 7;
    k = 8;
    l = 0;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000000000111111;
    in2 = 15'b000000000111111;
    in3 = 15'b000000001111111;
    in4 = 15'b000000001111111;
    i = 6;
    j = 6;
    k = 7;
    l = 7;
    #10;
    if(out == k) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000000000001111;
    in2 = 15'b000000000111111;
    in3 = 15'b000000000011111;
    in4 = 15'b000000111111111;
    i = 4;
    j = 6;
    k = 5;
    l = 9;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000000000000001;
    in2 = 15'b000000000000001;
    in3 = 15'b000000000011111;
    in4 = 15'b000000000001111;
    i = 1;
    j = 1;
    k = 5;
    l = 4;
    #10;
    if(out == l) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000111111111111;
    in2 = 15'b011111111111111;
    in3 = 15'b111111111111111;
    in4 = 15'b001111111111111;
    i = 12;
    j = 14;
    k = 15;
    l = 13;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    #10;

    $display("~ Requirement 2: Testing edge cases ~");
    in1 = 15'b000000000000000;
    in2 = 15'b000000000000000;
    in3 = 15'b000000000000000;
    in4 = 15'b000000000000000;
    i = 0;
    j = 0;
    k = 0;
    l = 0;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b111111111111111;
    in2 = 15'b111111111111111;
    in3 = 15'b111111111111111;
    in4 = 15'b111111111111111;
    i = 15;
    j = 15;
    k = 15;
    l = 15;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b111111111111111;
    in2 = 15'b111111111111111;
    in3 = 15'b000000000000000;
    in4 = 15'b000000000000000;
    i = 15;
    j = 15;
    k = 0;
    l = 0;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);
    in1 = 15'b000011111111111;
    in2 = 15'b000011111111111;
    in3 = 15'b000011111111111;
    in4 = 15'b000000000000000;
    i = 11;
    j = 11;
    k = 11;
    l = 0;
    #10;
    if(out == j) $display("The second largest of %d, %d, %d, %d is %d - Correct", i, j, k, l, out);
    else $display ("The second largest of %d, %d, %d, %d is %d - Incorrect", i, j, k, l, out);


end
endmodule

