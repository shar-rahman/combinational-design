`timescale 1ns/1ns

module tb_pooling;

parameter N = 512;
parameter P = N * N;
parameter L = P * 3;

parameter N2 = N / 2;
parameter P2 = N2 * N2;
parameter L2 = P2 * 3;


integer input_file, output_file;
integer i, j, c;
integer status;
integer count;

reg [7:0] tmp;

reg [3:0] din[0:L-1];
reg [3:0] dout[0:L-1];

reg [3:0] in1, in2, in3, in4;
wire [3:0] out;


second_largest dut(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(out)
    );


initial begin
    input_file = $fopen("royce.bin", "rb");
    for (i = 0; i < L; i = i + 2) begin
        status = $fread(tmp, input_file);
        din[i] = tmp[7:4];
        din[i + 1] = tmp[3:0];
    end
    $fclose(input_file);

    count = 0;
    for (c = 0; c < 3; c = c + 1) begin
        for (i = 0; i < N2; i = i + 1) begin
            for (j = 0; j < N2; j = j + 1) begin

                in1 = din[c * P + (2*i + 0) * N + (2*j + 0)];
                in2 = din[c * P + (2*i + 0) * N + (2*j + 1)];
                in3 = din[c * P + (2*i + 1) * N + (2*j + 0)];
                in4 = din[c * P + (2*i + 1) * N + (2*j + 1)];

                #1
                dout[c * P2 + i * N2 + j] = out;

                if (count % 1024 == 0) begin
                    $display("%0d/%0d", count, L2);
                end
                count = count + 1;

            end
        end
    end


    output_file = $fopen("filtered.bin", "wb");
    for (i = 0; i < L2; i = i + 2) begin
        $fwrite(output_file, "%c", {dout[i], dout[i + 1]});
    end
    $fclose(output_file);
end



endmodule
