module ACC(
	input 		clk,
	input 		rst_n,
	input 		Load,
	input 	[7:0] 	Data_In,

	output 		Done,
	output 	[7:0]	ACC_Out
	);

wire [4:0]	ACC_Ctrl;
wire 		count_eq_z;

ControlPath ControlPath(
	.clk 				(clk),
	.rst_n 				(rst_n),
	.Load 				(Load),
	.count_eq_z 	(count_eq_z),

	.Done 				(Done),
	.ACC_Ctrl 			(ACC_Ctrl)
	);

Data_Path Data_Path(
	.Data_In 			(Data_In),
	.clk 				(clk),
	.rst_n 				(rst_n),
	.ACC_Ctrl 			(ACC_Ctrl),

	.ACC_Out 			(ACC_Out),
	.count_eq_z 	(count_eq_z)
	);

endmodule