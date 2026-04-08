module four_bit_adder (
    /** Input Ports */
    input wire [3:0] val1,
    input wire [3:0] val2,
    /** Output Ports */
    output logic [4:0] res,
);

/** Logic */
wire c1;
wire c2;
wire c3;
assign res[0] = val1[0] ^ val2[0];
assign c1 = val1[0] & val2[0];
assign res[1] = val1[1] ^ val2[1] ^ c1;
assign c2 = (val1[1] & val2[1]) | (c1 & (val1[1] ^ val2[1]));
assign res[2] = val1[2] ^ val2[2] ^ c2;
assign c3 = (val1[2] & val2[2]) | (c2 & (val1[2] ^ val2[2]));
assign res[3] = val1[3] ^ val2[3] ^ c3;
assign res[4] = (val1[3] & val2[3]) | (c3 & (val1[3] ^ val2[3]));

endmodule