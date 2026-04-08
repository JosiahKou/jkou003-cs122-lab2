module top_tb;
reg [3:0] val1, val2;
wire [7:0] seg7;

top uut(val1, val2, seg7);

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
    
    $display("val1 val2 sum seg7 DP");
    val1=5; val2=3; #10;
    $display(" %2d   %2d   %2d   %b   %b", val1, val2, val1+val2, seg7[6:0], seg7[7]);
    
    val1=9; val2=9; #10;
    $display(" %2d   %2d   %2d   %b   %b", val1, val2, val1+val2, seg7[6:0], seg7[7]);
    
    val1=15; val2=1; #10;
    $display(" %2d   %2d   %2d   %b   %b", val1, val2, val1+val2, seg7[6:0], seg7[7]);
    
    $finish;
end
endmodule
