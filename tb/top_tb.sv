`include "src/top.sv"
`default_nettype none

module top_tb;
logic [3:0] bcd;
logic [6:0] seg7;

top uut (
    .bcd(bcd),
    .seg7(seg7)
);

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    for (int i = 0; i < 16; i++) begin
        bcd = i;
        #10;
    end
    #10;
    $finish;
end

endmodule
`default_nettype wire