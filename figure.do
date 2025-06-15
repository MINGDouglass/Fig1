*ssc install blindschemes

**********100m_SE*********
clear 
import excel "100m_SE.xlsx", sheet("Sheet1") firstrow  

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

sort x
label define xlabel   ///
	1 "0 " ///
    2 "100" ///
	3 "200 " ///
	4 "300 " ///
	5 "400 " ///
	6 "500 " ///
	
label values x xlabel

graph twoway (connected estimate x , msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle("Distance from historic districts (m)",size(3.8)) ytitle("Effect on Street Space Quality (%)",size(4)) ///
	xscale(range(0.8 6.2)) ///
	yscale(range(-40 110)) ///
	xlabel( 1 " " 1/6,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-40 (20) 110., format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3) )  graphregion(margin(0.5) fcolor(white) lcolor(white))

graph export "100m_SE.eps", as(eps) name("Graph") preview(off) replace

	
	


	

	