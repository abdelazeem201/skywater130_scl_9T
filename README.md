# SkyWater Educational PDK SKY130              
Educational Design Kit for Synopsys and Cadence Tools with a set of Characterized Standard Cell Library
Preliminary Version - Work in Progress

## Authors ##
* Ahmed Abdelazeem a.abdelazeem201@gmail.com

## Disclaimer
This project does not contain any confidential information. You must contact MOSIS and sign the corresponding NDA to obtain the official PDK. This project is a set of libraries and scripts for use with the synopsys and Cadence tools and the official PDK.

## Structure

	dc : DC Compiler
		the simple.tcl script synthesizes an uart with clock gating, which is then used in ICC
	dc / testcase_dft : 
		another script that uses DFT on an adder to test the scan flip flops
	
	icc : IC Compiler
	icc / uart_example :
		run in bash > icc_shell -gui 
		then in icc_shell: source icc_run.tcl > log.txt (Place & Route of the UART)
	icc / icc_onc5: 
		milkyway db
	icc / io_pads: 
		milkyway db (IO Pads)
	icc / gds : 
		std cells gds format

	libs : Libraries .lib .db characterized using Siliconsmart

	siliconSmart: There are the netlist and the scripts used to characterize the cells
	
	verilogs: Verilog models to simulate the characterized cell


Example IC digital flow:
1) Run the script DC (dc/simple.tcl)

		dc_shell -f simple.tcl 

2) Run the script ICC (source icc_run.tcl)
