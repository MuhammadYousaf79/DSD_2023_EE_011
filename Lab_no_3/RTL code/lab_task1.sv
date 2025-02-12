module lab_task1(
	input a,b,c,
	output x,y);

	assign x = (~c ^ (a|b));
	assign y1 = ~(a&b) ^ (a|b);
	assign y = (a|b) & y1;

endmodule