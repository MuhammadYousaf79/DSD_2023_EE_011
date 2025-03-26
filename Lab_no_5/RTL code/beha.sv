module beha (
    input logic [3:0] num,
    input logic [2:0] sel,
    output logic [6:0] seg,
    output logic [7:0] an
);

    
    always_comb begin
        case (num)
            4'h0: seg = 7'b0000001;
            4'h1: seg = 7'b1100111;
            4'h2: seg = 7'b0010010;
            4'h3: seg = 7'b0000110;
            4'h4: seg = 7'b1001100;
            4'h5: seg = 7'b0100100;
            4'h6: seg = 7'b0100000;
            4'h7: seg = 7'b0001111;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0000100;
            4'hA: seg = 7'b0001000;
            4'hB: seg = 7'b1100000;
            4'hC: seg = 7'b0110001;
            4'hD: seg = 7'b1000010;
            4'hE: seg = 7'b0110000;
            4'hF: seg = 7'b0111000;
            default: seg = 7'b1111111;
        endcase
    end

    always_comb begin
        an = 8'b11111111;
        case (sel)
            3'b000: an = 8'b11111110;
            3'b001: an = 8'b11111101;
            3'b010: an = 8'b11111011;
            3'b011: an = 8'b11110111;
            3'b100: an = 8'b11101111;
            3'b101: an = 8'b11011111;
            3'b110: an = 8'b10111111;
            3'b111: an = 8'b01111111;
            default: an = 8'b11111111;
        endcase
    end

endmodule
