* Encoding: UTF-8.

FREQUENCIES VARIABLES=Age Family_income Residence_IDH_kilometer Travel_cost Time_gap_Hospital_visit_day Time_gap_bit_washing_day Cost_medicine 
  /STATISTICS= MINIMUM MAXIMUM MEAN STDDEV  
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Age_cat
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Age_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Age_cat
  /CONTRAST (Age_cat)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Gender
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Gender BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Gender
  /CONTRAST (Gender)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Profession_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Profession_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Profession_cat
  /CONTRAST (Profession_cat)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Family_income_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Family_income_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Family_income_cat
  /CONTRAST (Family_income_cat)=Indicator (2)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Edu_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Edu_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Edu_cat
  /CONTRAST (Edu_cat)=Indicator (4)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).




FREQUENCIES VARIABLES=City_Corporation
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=City_Corporation BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER City_Corporation
  /CONTRAST (City_Corporation)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Resi_IDH_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Resi_IDH_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Resi_IDH_cat
  /CONTRAST (Resi_IDH_cat)=Indicator (2)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Where_hear_Rab
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Where_hear_Rab BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Where_hear_Rab
  /CONTRAST (Where_hear_Rab)=Indicator (4)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Know_about_Hospital
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Know_about_Hospital BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Know_about_Hospital
  /CONTRAST (Know_about_Hospital)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Animal_bite_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Animal_bite_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Animal_bite_cat
  /CONTRAST (Animal_bite_cat)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Type_Exposure
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Type_Exposure BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Type_Exposure
  /CONTRAST (Type_Exposure)=Indicator (2)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

FREQUENCIES VARIABLES=Number_bites_cat
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Number_bites_cat BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Number_bites_cat
  /CONTRAST (Number_bites_cat)=Indicator (2)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Type_animal_bites
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Type_animal_bites BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Type_animal_bites
  /CONTRAST (Type_animal_bites)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


//
FREQUENCIES VARIABLES=Status_biting
  /ORDER=ANALYSIS.
//
CROSSTABS 
  /TABLES=Status_biting BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.
//
LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Status_biting
  /CONTRAST (Status_biting)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


FREQUENCIES VARIABLES=Reason_bite
  /ORDER=ANALYSIS.


CROSSTABS 
  /TABLES=Reason_bite BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Reason_bite
  /CONTRAST (Reason_bite)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

FREQUENCIES VARIABLES=Category_wound
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Category_wound BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Category_wound
  /CONTRAST (Category_wound)=Indicator (3)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



FREQUENCIES VARIABLES=Measures_animal_bite
  /ORDER=ANALYSIS.

CROSSTABS 
  /TABLES=Measures_animal_bite BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Measures_animal_bite
  /CONTRAST (Measures_animal_bite)=Indicator (4)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).




CROSSTABS 
  /TABLES=Why_1stDose_miss BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

FREQUENCIES VARIABLES=Why_1stDose_miss
  /ORDER=ANALYSIS.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Why_1stDose_miss
  /CONTRAST (Why_1stDose_miss)=Indicator (4)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


CROSSTABS 
  /TABLES=Completion_vaccine BY Vaccine_Appr 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

FREQUENCIES VARIABLES=Completion_vaccine
  /ORDER=ANALYSIS.

LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Completion_vaccine
  /CONTRAST (Completion_vaccine)=Indicator (4)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).





LOGISTIC REGRESSION VARIABLES Vaccine_Appr
  /METHOD=ENTER Age_cat Gender Profession_cat Family_income_cat Edu_cat City_Corporation Resi_IDH_cat Where_hear_Rab Know_about_Hospital Animal_bite_cat Type_Exposure Number_bites_cat  Type_animal_bites Reason_bite Category_wound Measures_animal_bite
  /CONTRAST (Age_cat)=Indicator (1)
  /CONTRAST (Gender)=Indicator (1)
  /CONTRAST (Profession_cat)=Indicator (1)
  /CONTRAST (Family_income_cat)=Indicator (2)
  /CONTRAST (Edu_cat)=Indicator (4)
  /CONTRAST (City_Corporation)=Indicator (1)
  /CONTRAST (Resi_IDH_cat)=Indicator (2)
  /CONTRAST (Where_hear_Rab)=Indicator (4)
  /CONTRAST (Know_about_Hospital)=Indicator (1)
  /CONTRAST (Animal_bite_cat)=Indicator (1)
  /CONTRAST (Type_Exposure)=Indicator (2)
  /CONTRAST (Number_bites_cat)=Indicator (2)
  /CONTRAST (Type_animal_bites)=Indicator (1)  
  /CONTRAST (Reason_bite)=Indicator (1)
  /CONTRAST (Category_wound)=Indicator (3)
  /CONTRAST (Measures_animal_bite)=Indicator (4)
  /SAVE=PRED
  /CLASSPLOT
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


ROC PRE_1 BY Vaccine_Appr (1)
  /PLOT=CURVE(REFERENCE)
  /PRINT= COORDINATES
  /CRITERIA=CUTOFF(INCLUDE) TESTPOS(LARGE) DISTRIBUTION(FREE) CI(95)
  /MISSING=EXCLUDE.


