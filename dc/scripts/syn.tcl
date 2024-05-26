analyze -library work -format verilog ../src/${design}.v
elaborate $design -lib work
current_design 
uniquify

check_design
source ./cons/cons.tcl
link
compile -map_effort medium
optimize_registers
compile_ultra

report_area > ./report/synth_area.rpt
report_cell > ./report/synth_cells.rpt
report_qor  > ./report/synth_qor.rpt
report_resources > ./report/synth_resources.rpt
report_timing -max_paths 10 > ./report/synth_timing.rpt 
 
write_sdc  output/${design}.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output/${design}.v 
write -f ddc -hierarchy -output output/${design}.ddc   
write_sdf -version 2.1 -context verilog output/${design}.sdf
exit
