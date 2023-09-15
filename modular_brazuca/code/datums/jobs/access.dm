get_paygrades(paygrade, size, gender)
	if(!paygrade)
		return
	switch(paygrade)
		if("C")
			. = size ? "" : "Civilian"
		if("CD")
			. = size ? "Dr." : "Doctor"
		if("PROF")
			. = size ? "Prof." : "Professor"
		if("RES")
			. = size ? "RES" : "Medical Resident"
		if("MD")
			. = size ? "MD" : "Medical Doctor"
		if("CHO")
			. = size ? "CHO" : "Chief Health Officer"
		if("CMO")
			. = size ? "CMO" : "Chief Medical Officer"
		if("CMN")
			. = size ? "CMN" : "Crewman"
		if("PMC1")
			. = size ? "PMC" : "PM Contractor"
		if("PMC2")
			. = size ? "PMSC" : "PM Senior Contractor"
		if("PMC3")
			. = size ? "PMSC" : "PM Senior Contractor"
		if("PMC4")
			. = size ? "PMTL" : "PM Team Leader"
		if("PMCDS")
			. = size ? "APS" : "Assets Protection Specialist"
		if("PMCDSL")
			. = size ? "APTL" : "Assets Protection Team Leader"
		if("NT1")
			. = size ? "INT" : "Corporate Intern"
		if("NT2")
			. = size ? "ASSOC" : "Corporate Associate"
		if("NT3")
			. = size ? "PTNR" : "Corporate Partner"
		if("NT4")
			. = size ? "ANLST" : "Corporate Analyst"
		if("NT5")
			. = size ? "SPVR" : "Corporate Supervisor"
		//PATENTES DO EXERCITO BRASILEIRO
		if("E1")
			. = size ? "SD" : "Soldado"
		if("E2")
			. = size ? "SD1" : "Soldado de Primeira Classe"
		if("E3")
			. = size ? "CB" : "Cabo"
		if("E4")
			. = size ? "3SG" : "Terceiro Sargento"
		if("E5")
			. = size ? "2SG" : "Segundo Sargento"
		if("E6")
			. = size ? "1SG" : "Primeiro Sargento"
		if("E7")
			. = size ? "ST" : "Subtenente"
		if("O1")
			. = size ? "ASP" : "Aspirante a Oficial"
		if("O2")
			. = size ? "TEN" : "Tenente"
		if("O3")
			. = size ? "CAP" : "Capitão"
		if("O5")
			. = size ? "MAJ" : "Major"
		if("O6")
			. = size ? "TC" : "Tenente-Coronel"
		if("O7")
			. = size ? "CEL" : "Coronel"
		if("O8")
			. = size ? "GEN" : "General"
		if("O9")
			. = size ? "VADM" : "Vice Admiral"
		if("10")
			. = size ? "ADM" : "Admiral"
		if("11")
			. = size ? "FADM" : "Fleet Admiral"
		if("WO")
			. = size ? "WO" : "Warrant Officer"
		if("CWO")
			. = size ? "CWO" : "Chief Warrant Officer"
		if("PO3")
			. = size ? "PO3" : "Petty Officer Third Class"
		if("PO2")
			. = size ? "PO2" : "Petty Officer Second Class"
		if("PO1")
			. = size ? "PO1" : "Petty Officer First Class"
		if("CPO")
			. = size ? "CPO" : "Chief Petty Officer"
		if("MO4")
			. = size ? "MAJ" : "Major"
		if("MO5")
			. = size ? "LtCol" : "Lieutenant Colonel"
		if("UPP1")
			. = size ? "UGNR" : "USL Gunner"
		if("UPP2")
			. = size ? "USUR" : "USL Surgeon"
		if("UPP3")
			. = size ? "UPOM" : "USL Powder Monkey"
		if("UPP4")
			. = size ? "UCPT" : "USL Captain"
		if("UPP5")
			. = size ? "UQM" : "USL Quartermaster"
		if("UPP6")
			. = size ? "USSGT" : "USL Staff Sergeant"
		if("UPP7")
			. = size ? "UENS" : "USL Ensign"
		if("UPP8")
			. = size ? "ULT" : "USL Lieutenant"
		if("UPP9")
			. = size ? "ULCDR" : "USL Lieutenant Commander"
		if("UPP10")
			. = size ? "UCDR" : "USL Commander"
		if("UPP11")
			. = size ? "UADM" : "USL Admiral"
		if("UPPC1")
			. = size ? "UEPM" : "USL Elite Powder Monkey"
		if("UPPC2")
			. = size ? "UESUR" : "USL Elite Surgeon"
		if("UPPC3")
			. = size ? "UECPT" : "USL Elite Captain"
		if("FRE1")
			. = size ? "FRE" : "Freelancer Standard"
		if("FRE2")
			. = size ? "FRE" : "Freelancer Medic"
		if("FRE3")
			. = size ? "FRE" : "Freelancer Veteran"
		if("FRE4")
			. = size ? "FRE" : "Freelancer Leader"
		if("CLF1")
			. = size ? "CLF" : "CLF Standard"
		if("CLF2")
			. = size ? "CLF" : "CLF Medic"
		if("CLF3")
			. = size ? "CLF" : "CLF Leader"
		if("SOM_E1")
			. = size ? "PTE" : "SOM Private"
		if("SOM_E2")
			. = size ? "PFC" : "SOM Private First Class"
		if("SOM_E3")
			. = size ? "LCP" : "SOM Lance Corporal"
		if("SOM_E4")
			. = size ? "CPL" : "SOM Corporal"
		if("SOM_E5")
			. = size ? "CFC" : "SOM Corporal First Class"
		if("SOM_S1")
			. = size ? "3SG" : "SOM Third Sergeant"
		if("SOM_S2")
			. = size ? "2SG" : "SOM Second Sergeant"
		if("SOM_S3")
			. = size ? "1SG" : "SOM First Sergeant"
		if("SOM_S4")
			. = size ? "SSG" : "SOM Staff Sergeant"
		if("SOM_S5")
			. = size ? "MSG" : "SOM Master Sergeant"
		if("SOM_W1")
			. = size ? "3WO" : "SOM Third Warrant Officer"
		if("SOM_W2")
			. = size ? "2WO" : "SOM Second Warrant Officer"
		if("SOM_W3")
			. = size ? "1WWO" : "SOM First Warrant Officer"
		if("SOM_W4")
			. = size ? "MWO" : "SOM Master Warrant Officer"
		if("SOM_W5")
			. = size ? "SWO" : "SOM Senior Warrant Officer"
		if("SOM_W6")
			. = size ? "CWO" : "SOM Chief Warrant Officer"
		if("SOM_O1")
			. = size ? "2LT" : "SOM Second Lieutenant"
		if("SOM_O2")
			. = size ? "LTA" : "SOM Lieutenant"
		if("SOM_O3")
			. = size ? "CPT" : "SOM Captain"
		if("SOM_O4")
			. = size ? "MAJ" : "SOM Major"
		if("SOM_O5")
			. = size ? "LTC" : "SOM Lieutenant-Colonel"
		if("SOM_O6")
			. = size ? "SLTC" : "SOM Senior Lieutenant-Colonel"
		if("SOM_O7")
			. = size ? "COL" : "SOM Colonel"
		if("SOM_G1")
			. = size ? "BG" : "SOM Brigadier-General"
		if("SOM_G2")
			. = size ? "MG" : "SOM Major-General"
		if("SOM_G3")
			. = size ? "LG" : "SOM Lieutenant-General"
		if("SOM_G4")
			. = size ? "GEN" : "SOM General"
		if("SOM_A1")
			. = size ? "RADM(1)" : "SOM Rear-Admiral"
		if("SOM_A2")
			. = size ? "RADM(2)" : "SOM Rear-Admiral"
		if("SOM_A3")
			. = size ? "VADM" : "SOM Vice-Admiral"
		if("SOM_A4")
			. = size ? "ADM" : "SOM Admiral"
		if("ICC1")
			. = size ? "ICC" : "ICC Standard"
		if("ICC2")
			. = size ? "ICC" : "ICC Medic"
		if("ICC3")
			. = size ? "ICCG" : "ICC Guard"
		if("ICC4")
			. = size ? "ICCL" : "ICC Leader"
		if("MRC1")
			. = size ? "MERC" : "MERC Heavy"
		if("MRC2")
			. = size ? "MERC" : "MERC Miner"
		if("MRC3")
			. = size ? "MERC" : "MERC Engineer"
		if("VM")
			. = size ? "VAT" : "VatGrown Marine"
		if("Mk.III")
			. = size ? "Mk.III" : "Mark III"
		if("Mk.II")
			. = size ? "Mk.II" : "Mark II"
		if("Mk.I")
			. = size ? "Mk.I" : "Mark I"
		else
			. = paygrade //custom paygrade
