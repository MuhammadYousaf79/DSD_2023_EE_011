module seq_seven_segment (
    input logic clk,
    input logic reset,
    input logic write,
    input logic [2:0] sel,
    input logic [3:0] num,
    output logic [7:0] anodes,
    output logic [6:0] segments
);

    logic [3:0] mem [7:0];
    logic [16:0] q_out;
    logic [2:0] new_sel;

    function automatic [7:0] sel_decoder(input logic [2:0] sel_in);
        case (sel_in)
            3'b000: sel_decoder = 8'b11111110;
            3'b001: sel_decoder = 8'b11111101;
            3'b010: sel_decoder = 8'b11111011;
            3'b011: sel_decoder = 8'b11110111;
            3'b100: sel_decoder = 8'b11101111;
            3'b101: sel_decoder = 8'b11011111;
            3'b110: sel_decoder = 8'b10111111;
            3'b111: sel_decoder = 8'b01111111;
            default: sel_decoder = 8'b11111111;
        endcase
    endfunction

    function automatic [6:0] num_decorder(input logic [3:0] num_in);
        case (num_in)
            4'h0: num_decorder = 7'b1000000;
            4'h1: num_decorder = 7'b1111001;
            4'h2: num_decorder = 7'b0100100;
            4'h3: num_decorder = 7'b0110000;
            4'h4: num_decorder = 7'b0011001;  
            4'h5: num_decorder = 7'b0010010;  
            4'h6: num_decorder = 7'b0000010;  
            4'h7: num_decorder = 7'b1111000;  
            4'h8: num_decorder = 7'b0000000;  
            4'h9: num_decorder = 7'b0010000;  
            4'hA: num_decorder = 7'b0001000;  
            4'hB: num_decorder = 7'b0000011;  
            4'hC: num_decorder = 7'b1000110;  
            4'hD: num_decorder = 7'b0100001;  
            4'hE: num_decorder = 7'b0000110;  
            4'hF: num_decorder = 7'b0001110;  
            default: num_decorder = 7'b1111111; 
        endcase
    endfunction

    always_comb begin
        if (write) begin
            segments = num_decorder(mem[sel]);
            anodes = sel_decoder(sel);
        end else if (!(write)) begin
            segments = num_decorder(mem[new_sel]);
            anodes = sel_decoder(new_sel);
        end
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            for (int i = 0; i < 8; i = i + 1) begin
                mem[i] <= 4'b0000;
            end
        end else if (write) begin
            mem[sel] <= num;
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            q_out <= 17'b0;
        end else begin
            q_out <= q_out + 1;
        end
    end

    always_ff @(posedge q_out[16] or posedge reset) begin
        if (reset) begin
            new_sel <= 3'b000;
        end
        else if (!(write)) begin
            new_sel <= new_sel + 1;
        end
    end

endmodule