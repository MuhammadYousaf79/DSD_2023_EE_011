module segt_tb;


    logic [3:0] num;
    logic [2:0] sel;
    logic [6:0] seg;
    logic [7:0] an;


    beha uut (
        .num(num),
        .sel(sel),
        .seg(seg),
        .an(an)
    );


    task display_status();
        $display("num=%h | sel=%b | seg=%b | an=%b", num, sel, seg, an);
    endtask

    initial begin

        for (int display = 0; display < 8; display++) begin
            for (int value = 0; value < 16; value++) begin
                num = value[3:0];
                sel = display[2:0];
                #10;
                display_status();
            end
        end

        $display("Test Completed");
        $finish;
    end

endmodule
