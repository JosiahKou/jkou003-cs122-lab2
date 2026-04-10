module top (
    input wire [3:0] val1,
    input wire [3:0] val2,
    output wire [7:0] seg7
);

    wire [4:0] sum;
    
    adder u_adder (
        .val1(val1),
        .val2(val2),
        .res(sum)
    );
    
    decoder u_decoder (
        .bcd(sum[3:0]), 
        .seg7(seg7[6:0])
    );
    
    assign seg7[7] = sum[4];

endmodule