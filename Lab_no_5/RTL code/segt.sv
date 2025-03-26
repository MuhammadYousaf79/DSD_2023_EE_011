module segt(
	input logic [3:0]num,
	input logic [2:0]sel,
	output logic sega, segb, segc, segd, sege, segf, segg,
	output logic anode0, anode1, anode2, anode3, anode4, anode5, anode6, anode7
);

assign anode0 = ~((~sel[0])&(~sel[1])&(~sel[2]));
assign anode1 = ~((~sel[0])&(~sel[1])&sel[2]);
assign anode2 = ~((~sel[0])&sel[1]&(~sel[2]));
assign anode3 = ~((~sel[0])&sel[1]&sel[2]);
assign anode4 = ~(sel[0]&(~sel[1])&(~sel[2]));
assign anode5 = ~(sel[0]&(~sel[1])&sel[2]);
assign anode6 = ~(sel[0]&sel[1]&(~sel[2]));
assign anode7 = ~(sel[0]&sel[1]&sel[2]);

assign sega = ((~num[0])&(~num[1])&(~num[2])&num[3]) | ((~num[0])&num[1]&(~num[2])&(~num[3])) | (num[0]&num[1]&(~num[2])&num[3]) | (num[0]&(~num[1])&num[2]&num[3]);
assign segb = ((~num[0])&num[1]&(~num[2])&num[3]) | (num[0]&num[1]&(~num[3])) | (num[0]&num[2]&num[3]) | (num[1]&num[2]&(~num[3]));
assign segc = ((~num[0])&(~num[1])&num[2]&(~num[3])) | (num[0]&num[1]&(~num[3])) | (num[0]&num[1]&num[2]);
assign segd = ((~num[0])&(~num[1])&(~num[2])&num[3]) | ((~num[0])&num[1]&(~num[2])&(~num[3])) | (num[1]&num[2]&num[3]) | (num[0]&(~num[1])&num[2]&(~num[3]));
assign sege = ((~num[0])&num[3]) | ((~num[0])&num[1]&(~num[2])) | ((~num[1])&(~num[2])&num[3]);
assign segf = (num[0]&num[1]&(~num[2])&num[3]) | ((~num[0])&(~num[1])&num[2]) | ((~num[0])&(~num[1])&num[3]) | ((~num[0])&num[2]&num[3]);
assign segg = ((~num[0])&(~num[1])&(~num[2])) | ((~num[0])&num[1]&num[2]&num[3]) | (num[0]&num[1]&(~num[2])&(~num[3]));

endmodule