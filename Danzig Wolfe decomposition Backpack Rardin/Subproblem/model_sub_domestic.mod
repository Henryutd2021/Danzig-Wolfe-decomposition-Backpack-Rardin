set MODE;
set LINKING; # refers to linking constraints and just apply to the dual variables and the A matrix mentioned in objective function 
set CON; # refers to the particular subproblem constraints

param dual_var{LINKING};
param profit_c{MODE};
param q_dual_convex;
param A{LINKING,MODE};
param T{CON, MODE};
param t{CON};

var x{MODE} >=0 ;

maximize Total_Price:   sum {i in MODE} (profit_c[i] -  sum{r in LINKING} dual_var[r] * A[r,i]) * x[i] - q_dual_convex; 

subject to Site_con:  sum {i in MODE} T["site_contract",i] * x[i] >= t["site_contract"];
subject to Site_mode1_limit: sum {i in MODE} T["site_mode_1", i] * x[i] <= t["site_mode_1"];
subject to Site_mode2_limit: sum {i in MODE} T["site_mode_2", i] * x[i] <= t["site_mode_2"];
