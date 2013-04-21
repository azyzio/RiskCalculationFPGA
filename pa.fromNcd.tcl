
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name RiskCalculationFPGA -dir "D:/Dropbox/NUS/FYP/RiskCalculationFPGA/planAhead_run_1" -part xc6slx45fgg484-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/Dropbox/NUS/FYP/RiskCalculationFPGA/Main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Dropbox/NUS/FYP/RiskCalculationFPGA} {ipcore_dir} }
add_files [list {ipcore_dir/mult_10_18_21.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mult_12_13_18.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mult_18_18_18_core.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mult_18_18_18_muexp.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mult_9_18_18.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "Main.ucf" [current_fileset -constrset]
add_files [list {Main.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/Dropbox/NUS/FYP/RiskCalculationFPGA/Main.ncd"
if {[catch {read_twx -name results_1 -file "D:/Dropbox/NUS/FYP/RiskCalculationFPGA/Main.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/Dropbox/NUS/FYP/RiskCalculationFPGA/Main.twx\": $eInfo"
}
