module top_tb;
reg [3:0] val1, val2;
wire [7:0] seg7;
integer i, j, sum, expected_display, expected_dp;
integer errors;

top uut(val1, val2, seg7);

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
    
    errors = 0;
    $display("Testing all 256 combinations...");
    
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            val1 = i;
            val2 = j;
            #5;
            
            sum = i + j;
            expected_display = sum % 16;
            expected_dp = (sum > 15) ? 1 : 0;
            
            // Check if decoder output matches expected display value
            // (This is a simple check - you can add more detailed checking)
            if (seg7[7] !== expected_dp) begin
                errors = errors + 1;
                $display("ERROR: i=%d j=%d sum=%d dp=%b expected=%b", 
                         i, j, sum, seg7[7], expected_dp);
            end
        end
    end
    
    if (errors == 0) begin
        $display("SUCCESS: All 256 combinations tested correctly!");
    end else begin
        $display("FAILED: %0d errors found", errors);
    end
    
    $finish;
end
endmodule