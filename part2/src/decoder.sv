module decoder (
    input wire [3:0] bcd,
    output logic [6:0] seg7
);

always_comb begin
    case (bcd)
        4'd0:  seg7 = 7'b0111111;
        4'd1:  seg7 = 7'b0000110;
        4'd2:  seg7 = 7'b1011011;
        4'd3:  seg7 = 7'b1001111;
        4'd4:  seg7 = 7'b1100110;
        4'd5:  seg7 = 7'b1101101;
        4'd6:  seg7 = 7'b1111101;
        4'd7:  seg7 = 7'b0000111;
        4'd8:  seg7 = 7'b1111111;
        4'd9:  seg7 = 7'b1101111;
        4'd10: seg7 = 7'b1110111;
        4'd11: seg7 = 7'b1111100;
        4'd12: seg7 = 7'b0111001;
        4'd13: seg7 = 7'b1011110;
        4'd14: seg7 = 7'b1111001;
        4'd15: seg7 = 7'b1110001;
        default: seg7 = 7'b0000000;
    endcase
end

endmodule