module top_tb;
logic [3:0] bcd;
logic [6:0] seg7;

top uut (.bcd(bcd), .seg7(seg7));

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
    
    $display("Testing 7-segment decoder:");
    $display("bcd -> seg7");
    
    for (int i = 0; i < 16; i++) begin
        bcd = i;
        #10;
        $display("%d -> %b", bcd, seg7);
    end
    
    $finish;
end
endmodule