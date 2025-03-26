module seq_segment_tb();

    logic clk;
    logic reset;
    logic write;
    logic [2:0] sel;
    logic [3:0] num;
    logic [7:0] anodes;
    logic [6:0] segments;

    
    seq_seven_segment DUT (
        .clk(clk),
        .reset(reset),
        .write(write),
        .sel(sel),
        .num(num),
        .anodes(anodes),
        .segments(segments)
    );

    task write_mem(input logic [2:0] sel_in, input logic [3:0] num_in);

            sel = sel_in;
            num = num_in;

            repeat(3) @(posedge clk);

    endtask

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        
        reset = 0;
        write = 0;
        sel = 3'b000;
        num = 4'b0000;


        @(posedge clk);
        reset = 1;
        repeat(3) @(posedge clk);
        @(posedge clk);
        reset = 0;

        repeat(3) @(posedge clk);
        write = 1;


        for (int i = 0; i < 8; i = i + 1) begin
            write_mem(i, $random % 16);
        end

        @(posedge clk);
        write = 0;

        repeat(10) @(posedge clk);

    end
    
    initial begin
        $monitor("sel=%b num=%h | anodes=%b segments=%b", sel, num, anodes, segments);
    end

endmodule