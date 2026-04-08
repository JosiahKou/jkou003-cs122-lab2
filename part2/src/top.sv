cat > src/top.sv << 'EOF'
`include "src/decoder.sv"
`include "src/adder.sv"

module top (
    input wire [3:0] val1,
    input wire [3:0] val2,
    output logic [7:0] seg7
);

wire [4:0] sum;

adder u_adder(val1, val2, sum);
decoder u_decoder(sum[3:0], seg7[6:0]);
assign seg7[7] = sum[4];

endmodule
EOF