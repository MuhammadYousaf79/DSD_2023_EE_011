module led_circuit_comb(
	input logic [1:0]a,
	input logic [1:0]b,
	output logic r, g, be
);

assign r = (a[0]&a[1]) | ((~b[0])&(~b[1])) | (a[0]&(~a[1])&(~b[0])) | (a[0]&b[0]&(~b[1])) | (a[1]&(~b[0]));

assign g = ((~a[0])&(~a[1])) | (b[0]&b[1]) | ((~a[0])&(~b[0])&b[1]) | ((~a[0])&b[0]&(~b[1])) | (a[0]&b[0]&(~a[1]));

assign be = ((~a[0])&b[0]) | (a[0]&(~b[0])) | ((~a[0])&(~a[1])&b[1]) | (a[0]&(~a[1])&b[1]) | (a[1]&(~b[0])&(~b[1])) | (a[1]&b[0]&(~b[1]));

endmodule