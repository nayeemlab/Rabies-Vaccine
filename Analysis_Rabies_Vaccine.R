#library
library(forecast)
library(MASS)
library(tseries)
library(forecast)
library(lubridate)
library(ggplot2)
library(zoo)
library(Rcpp)
library(prophet)
library(data.table)
library(dplyr)
library(ggplot2)
options(scipen = 999) ## To disable scientific notation

setwd('E:\\ResearchProject\\Sumon Bhai\\Rabies Vaccine')
rabiesdata <- read.csv("Rabies_Data.csv")


#dependent
#fully vaccinated
rabiesdata$Completion_vaccine_bin <- factor(rabiesdata$Completion_vaccine,levels=c(1,2,3,4,5),labels = c('No',
                                                                                                         'No',
                                                                                                         'Yes',
                                                                                                         'Yes',
                                                                                                         'No'))

rabiesdata$Completion_vaccine_bin
summary(rabiesdata$Completion_vaccine_bin)
x <- table(rabiesdata$Completion_vaccine_bin)
x
prop.table(x)
# Patient ID
##ID


# Name of the patient
##Patient_name


# Age in years
##Age


# Age category
##Age_category
rabiesdata$Age_cat <- factor(rabiesdata$Age_category,levels=c(1,2,3,4,5,6),labels = c('1-17 yrs',
                                                                                      '1-17 yrs',
                                                                                      '1-17 yrs',
                                                                                      '18 or above yrs',
                                                                                      '18 or above yrs',
                                                                                      '18 or above yrs'))

rabiesdata$Age_cat

x <- table(rabiesdata$Age_cat, rabiesdata$Days_animal_Exposure_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y


logit1 <- (glm(relevel(factor(Days_animal_Exposure_cat), ref = "1") ~ relevel(factor(Age_cat), ref = "18 or above yrs"), 
               family=quasibinomial(link=logit), data=rabiesdata, na.action = na.omit))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci


# Patient Gender
##Gender

rabiesdata$Gender_cat <- factor(rabiesdata$Gender,levels=c(0,1),labels = c('Female',
                                                                           'Male'))

rabiesdata$Gender_cat

x <- table(rabiesdata$Gender_cat, rabiesdata$Days_animal_Exposure_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

# Father’s/Husbands name
##Father_Hus_name


# Name of the patient attendant (if applicable)
##Attendant_name


# Phone number of patient
##Patient_phone


# Phone number of patient’s family member (adult)
##Family_phone


# House No
##House_No


# Village/Para/Rd
##Village_para_Rd


# Ward No
##Ward


# City Corporation
##City_Corporation

rabiesdata$CC_cat <- factor(rabiesdata$City_Corporation,levels=c(1,2),labels = c('North',
                                                                           'South'))

rabiesdata$CC_cat

x <- table(rabiesdata$CC_cat, rabiesdata$Days_animal_Exposure_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

# Permanent address
##Permanent_address


# Upazila/Thana name
##Upzila_Thana


# District name
##District


# District code
##District_code
rabiesdata$Distric_cat <- factor(rabiesdata$District_code,levels=c(1,2),labels = c('Dhaka',
                                                                                 'Outside Dhaka'))

rabiesdata$Distric_cat

# Occupation of the patient
##Patient_Occupation


# Profession
##Profession
rabiesdata$Profession_cat <- factor(rabiesdata$Profession,levels=c(1,2,3,4,5,6),labels = c('Student/Housewife',
                                                                                           'Job/Business',
                                                                                           'Student/Housewife',
                                                                                           'Job/Business',
                                                                                           'Children/Others',
                                                                                           'Children/Others'))

rabiesdata$Profession_cat

x <- table(rabiesdata$Profession_cat, rabiesdata$Maintain_vaccine_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

# Monthly family income BDT
##Family_income
median(rabiesdata$Family_income)


# Income category
##Income_cat
rabiesdata$Family_Income_cat <- factor(rabiesdata$Income_cat,levels=c(1,2,3,4),labels = c('<30000',
                                                                                      '<30000',
                                                                                      '30000 or above',
                                                                                      '30000 or above'))

rabiesdata$Family_Income_cat

x <- table(rabiesdata$Family_Income_cat, rabiesdata$Maintain_vaccine_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

# Education level/category of patient
##Patient_Education

rabiesdata$Education_cat <- factor(rabiesdata$Patient_Education,levels=c(0,1,2,3,4),labels = c('No Education',
                                                                                          '1-5',
                                                                                          '6-10',
                                                                                          '11-12',
                                                                                          '13 or 13+'))

rabiesdata$Education_cat


# Distance from patient residence to IDH (kilometer)
##Residence_IDH_kilometer

mean(rabiesdata$Residence_IDH_kilometer)

rabiesdata$Residence_IDH_km_cat <- ifelse(rabiesdata$Residence_IDH_kilometer<10,0,1)
rabiesdata$Residence_IDH_km_cat <- factor(rabiesdata$Residence_IDH_km_cat,levels=c(0,1),labels = c('Near','Long'))
rabiesdata$Residence_IDH_km_cat

x <- table(rabiesdata$Residence_IDH_km_cat, rabiesdata$Days_animal_Exposure_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

logit1 <- (glm(relevel(factor(Maintain_vaccine_cat), ref = "Received doses appropriately") ~ relevel(factor(Residence_IDH_km_cat), ref = "Long"), 
               family=quasibinomial(link=logit), data=rabiesdata, na.action = na.omit))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci

# Travel cost to visit hospital
##Travel_cost


# Time required to visit hospital
##Time_required


# From where/whom you hear about the rabies vaccination center
##Where_about_Rabies


# Do you know about the hospital earlier for providing rabies vaccine
##Know_about_Hospital
rabiesdata$Know_Hosp_cat <- factor(rabiesdata$Know_about_Hospital,levels=c(0,1),labels = c('No',
                                                                                               'Yes'))

rabiesdata$Know_Hosp_cat


# Date of the interview
##Date_Interview


# Time gap between bite and hospital visit Day
##Time_gap_Hospital_visit_day


# Time gap between bite and hospital visit Hours
##Time_gap_Hospital_Visit_hours


# Animal species name
##Animal_species
rabiesdata$Animal_species_cat <- factor(rabiesdata$Animal_species,levels=c(1,2,3,4,5),labels = c('Dog',
                                                                                               'Cat',
                                                                                               'Fox',
                                                                                               'Jakal/Mongoose/Monkey',
                                                                                               'Others'))

rabiesdata$Animal_species_cat


# Animal species name others
##Animal_species_others


# Type of exposure
##Type_Exposure



# Number of bites
##Number_bites


# Type of animal who bites
##Type_animal_bites


# Site of bite
##Site_bite


# Status of biting animals
##Status_biting


# Reason of bite
##Reason_bite


# Category of wound (WHO Category)
##Category_wound


# Measures taken following animal bite
##Measures_animal_bite


# Measures taken following animal bite others
##Measures_others


# Time gap between bite and wound washing- day
##Time_gap_bit_washing_day



# Time gap between bite and wound washing- Hours
##Time_gap_bit_washing_Hours


# Time gap between bite and wound washing- Minutes
##Time_gap_bit_washing_Minutes

# Fate of biting animal
##Fate_biting_animal
rabiesdata$Fate_animal_cat <- factor(rabiesdata$Fate_biting_animal,levels=c(1,2,3,4,5,6),labels = c('Died',
                                                                                                 'Killed by people',
                                                                                                 'Still alive',
                                                                                                 'Not found',
                                                                                                 'Run away',
                                                                                                 'Dont Know'))

rabiesdata$Fate_animal_cat

# Vaccination status of biting animal against rabies
##Vaccination_status
rabiesdata$Vaccination_status_cat <- factor(rabiesdata$Vaccination_status,levels=c(1,2,3,4),labels = c('Not vaccinated',
                                                                                                    'Anually vaccinated',
                                                                                                    'Once vaccinated',
                                                                                                    'Not known vaccinated'))

rabiesdata$Vaccination_status_cat


# Have you received any treatment before coming IDH
##Have_received_treatment_IDH
rabiesdata$treatment_IDH_cat <- factor(rabiesdata$Have_received_treatment_IDH,levels=c(0,1),labels = c('No',
                                                                                                       'Yes'))

rabiesdata$treatment_IDH_cat


# Type of treatment received
##Type_treatment_received
rabiesdata$treatment_types_cat <- factor(rabiesdata$Type_treatment_received,levels=c(1,2,3,4,5,6,7),labels = c('Washing',
                                                                                                       'Bite dressing',
                                                                                                       'Antibiotics',
                                                                                                       'Pain Killer',
                                                                                                       'RIG',
                                                                                                       'ATS',
                                                                                                       'Others'))

rabiesdata$treatment_types_cat

# Who treated
##Who_treated
rabiesdata$Who_treated_cat <- factor(rabiesdata$Who_treated,levels=c(1,2,3,4,5),labels = c('Registered physician',
                                                                                           'Traditional healers',
                                                                                           'Kabiraj',
                                                                                           'Pharmacy',
                                                                                           'Others'))

rabiesdata$Who_treated_cat


# If Yes Type
##If_Yes
rabiesdata$kabiraj_treatment_cat <- factor(rabiesdata$If_Yes,levels=c(1,2,3,4),labels = c('Thala Pora',
                                                                                           'Pani Pora',
                                                                                           'Kola Pora',
                                                                                           'Others'))

rabiesdata$Who_treated_cat


# If Yes Type Others
##If_Yes_others


# Type of post exposure prophylaxis
##Type_post_exposure
rabiesdata$Type_post_exposure_cat <- factor(rabiesdata$Type_post_exposure,levels=c(1,2,3),labels = c('Vaccine',
                                                                                          'RIG',
                                                                                          'Both'))

rabiesdata$Type_post_exposure_cat


# Recommended vaccine schedule Days
##Recommended_Vacc_achedule_0


# Recommended vaccine schedule Days  Others
##Recommended_Vacc_achedule_3


# Name of the vaccine
##Name_vaccine


# Name of the RIG
##Name_RIG


# Date of 1st dose vaccine
##First_dose_Vaccine


# Date of 2nd dose vaccine
##Second_dose_Vaccine


# Date of 3rd dose vaccine
##Third_dose_vaccine


# Date of 4th dose vaccine
##Fourth_dose_vaccine


# Vaccine route
##Vaccine_route
rabiesdata$Vaccine_route_cat <- factor(rabiesdata$Vaccine_route,levels=c(1,2),labels = c('Intra-mascular',
                                                                                         'Intra-dermal'))

rabiesdata$Vaccine_route_cat


# Completion of vaccine by 30 days of first dose vaccine
##Completion_vaccine
rabiesdata$Completion_vaccine_cat <- factor(rabiesdata$Completion_vaccine,levels=c(1,2,3,4,5),labels = c('1st dose',
                                                                                         '2nd dose',
                                                                                         '3rd dose',
                                                                                         '4th dose',
                                                                                         '5th dose'))

rabiesdata$Completion_vaccine_cat
summary(rabiesdata$Completion_vaccine_cat)

#fully vaccinated
rabiesdata$Completion_vaccine_bin <- factor(rabiesdata$Completion_vaccine,levels=c(1,2,3,4,5),labels = c('No',
                                                                                                         'No',
                                                                                                         'Yes',
                                                                                                         'Yes',
                                                                                                         'No'))

rabiesdata$Completion_vaccine_bin
summary(rabiesdata$Completion_vaccine_bin)

# Maintain vaccine schedule appropriately
##Maintain_vaccine
rabiesdata$Maintain_vaccine_cat <- factor(rabiesdata$Maintain_vaccine,levels=c(1,2,3,4,5),labels = c('Received 4 doses appropriately',
                                                                                                         'Received 4 doses but not appropriately',
                                                                                                         'Received 3 doses appropriately',
                                                                                                         'Received 3 doses  but not appropriately',
                                                                                                         'Not received at all'))

rabiesdata$Maintain_vaccine_cat 

# Was the victim previously vaccinated against rabies
##Was_victim_previously_vaccinated
rabiesdata$Maintain_vaccine_cat <- factor(rabiesdata$Maintain_vaccine,levels=c(1,2,3,4),labels = c('Received doses appropriately',
                                                                                                     'Received but not appropriately',
                                                                                                     'Received doses appropriately',
                                                                                                     'Received but not appropriately'))

rabiesdata$Maintain_vaccine_cat

x <- table(rabiesdata$first_dose_late_dist, rabiesdata$Maintain_vaccine_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

logit1 <- (glm(relevel(factor(first_dose_late_dist), ref = "No") ~ Maintain_vaccine_cat, 
               family=quasibinomial(link=logit), data=rabiesdata, na.action = na.omit))
summary(logit1) #sig

model.or <- cbind(exp(coef(logit1)),exp(confint(logit1)))
colnames(model.or) <- c('odds ratio','ci(2.5%)','ci(97.5%)')
model.or #for odds ratio and ci

# Date(s) of Previous Rabies Vaccination
##Date_previous_Rabies
rabiesdata$Date_previous_Rabies_cat <- factor(rabiesdata$Date_previous_Rabies,levels=c(1,2),labels = c('Date',
                                                                                                     'Dont know'))

rabiesdata$Date_previous_Rabies_cat


# Date If yes
##Date_if_yes


# Do you face any side effects after being vaccinated
##Do_face_side_effects
rabiesdata$side_effects_cat <- factor(rabiesdata$Do_face_side_effects,levels=c(0,1),labels = c('No',
                                                                                       'Yes'))

rabiesdata$side_effects_cat


# What are the side effects
##What_side_effects
rabiesdata$What_side_effects_cat <- factor(rabiesdata$What_side_effects,levels=c(1,2,3,4),labels = c('Pain',
                                                                                               'Fever',
                                                                                               'Boths',
                                                                                               'others'))

rabiesdata$What_side_effects_cat


# Days from animal exposure to presentation (hospital visit)
##Days_animal_Exposure
rabiesdata$Days_animal_Exposure_cat <- factor(rabiesdata$Days_animal_Exposure,levels=c(1,2,3,4,5),labels = c('Day of exposure',
                                                                                                     '1 day after exposure',
                                                                                                     '2 day after exposure',
                                                                                                     '3 day after exposure',
                                                                                                     '4 day after exposure'))

rabiesdata$Days_animal_Exposure_cat

rabiesdata$Days_animal_Exposure_cat <- ifelse(rabiesdata$Days_animal_Exposure==1,0,1)
rabiesdata$Days_animal_Exposure_cat <- factor(rabiesdata$Days_animal_Exposure_cat,levels=c(0,1),labels = c('0','1'))
rabiesdata$Days_animal_Exposure_cat
summary(rabiesdata$Days_animal_Exposure_cat)


x <- table(rabiesdata$first_dose_late_dist, rabiesdata$Days_animal_Exposure_cat)
x
fisher.test(x)
y <- prop.table(x,1)*100
y


# Time gap between animal bite and first dose vaccination_Hour
##Time_gap_animal_bit_hours


# Time gap between animal bite and first dose vaccination_Minutes
##Time_gap_animal_bit_Minutes


# Do you know about the date of first dose vaccination
##Do_you_first_vaccination
rabiesdata$first_vaccination_cat <- factor(rabiesdata$Do_you_first_vaccination,levels=c(0,1),labels = c('No',
                                                                                               'Yes'))


# Date of bite
##Date_bite


# When taken first dose
##When_first_dose


# Time gap between animal bite and first dose vaccination_day
##Time_gap_animal_bit_day


# Why you came late to take first dose
##Why_you_first_dose
rabiesdata$first_dose_late <- factor(rabiesdata$Why_you_first_dose,levels=c(1,2,3,4,5,6,7,8,9),labels = c('Don’t know about vaccine schedule',
                                                                                                        'Busy with other works',
                                                                                                        'Took time to find IDH',
                                                                                                        'Bad weather',
                                                                                                        'No money to travel hospital',
                                                                                                        'Unable to come on day 0 because of bite induced suffering',
                                                                                                        'Sickness',
                                                                                                        'Distance',
                                                                                                        'Record exact causes'))

rabiesdata$first_dose_late

summary(rabiesdata$first_dose_late)

#first dose late for distance

rabiesdata$first_dose_late_dist <- factor(rabiesdata$Why_you_first_dose,levels=c(1,2,3,4,5,6,7,8,9),labels = c('No',
                                                                                                          'No',
                                                                                                          'No',
                                                                                                          'No',
                                                                                                          'No',
                                                                                                          'No',
                                                                                                          'No',
                                                                                                          'Yes',
                                                                                                          'No'))

rabiesdata$first_dose_late_dist
summary(rabiesdata$first_dose_late_dist)

x <- table(rabiesdata$first_dose_late_dist, rabiesdata$Days_animal_Exposure)
x
fisher.test(x)
y <- prop.table(x,1)*100
y

# Record exact causes
##Record_exact_causes


# Travle cost for hospital visit
##Travle_cost_hospital


# Travel cost for visiting other healthcare before coming IDH
##Travle_cost_IDH


# Cost for getting treatment from other sources (e.g. traditional healer)
##Cost_treament_other_source


# Working hour loss (if employed)__________equivalent_______taka
##Working_hour_loss


# Cost for vaccine
##Cost_vaccine


# Cost for other medicine
##Cost_medicine


# Other relevant cost
##Other_cost


# Outcome during follow up
##Follow_up

rabiesdata$Follow_up_cat <- factor(rabiesdata$Follow_up,levels=c(1,2),labels = c('Alive',
                                                                                 'Dead'))

rabiesdata$Follow_up_cat

