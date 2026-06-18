# Kaplan-meier-curve

# Introduction

Leukemia is a cancer of the blood and bone marrow, where blood cells are made. It causes the body to produce abnormal white blood cells that crowd out normal blood cells and can impair immunity, oxygen delivery, and clotting. (MedlinePlus, 2024). 

Life expectancy varies a lot by type of leukemia, age, overall health, and how well it responds to treatment. Some forms are highly treatable and people can live many years; others, especially acute forms, can be life-threatening without prompt treatment. Chronic lymphocytic leukemia (CLL) often has a better prognosis; one Canadian source reports about 86% 5-year net survival. (Statistics Canada, n.d.)

As advantages of using Kaplan-Meier curve is immediate visualization of life-cycle patients, it requires no assumptions about the underlying distribution of the data, and includes subjects that haven’t reached the event of interest by the end of the study. Also, the gold standard for clinical trials, showing the difference between treatments.(Rich, 2010; Yang, 2022).

# Objective
Clinical Data Re-Engineering for Executive Stakeholders.
The goal of this project was to bridge the gap between complex survival analysis and business intelligence. Standard Kaplan-Meier plots in R are often cluttered with academic features—such as wide, overlapping confidence intervals, excessive time horizons, and statistical jargon—that hinder rapid decision-making in a business scenario. By stripping away visual noise, optimizing the axis bounds, and translating statistical parameters into clear business metrics (such as a headline-driven median survival takeaway), I transformed a raw scientific graphic into an executive-ready visual asset without sacrificing data integrity.

# Result

<img width="2530" height="1660" alt="image" src="https://github.com/user-attachments/assets/9553c9d2-f601-457c-9b78-b5e500d55330" />

### Key Findings & Interpretation

* **Clinical Efficacy:** Patients on the maintenance chemotherapy regimen stayed in remission for a **median of 31 weeks**—effectively extending remission by an average of **2 months (8 weeks)** compared to the nonmaintenance  group.
* **Understanding the Risk Table:** The **"Number at Risk"** metrics at the bottom of the plot indicate the exact headcount of patients who were still alive, enrolled in the study, and actively "at risk" of experiencing a relapse at each specific milestone.





# Source

MedlinePlus [Internet]. (2024). Bethesda (MD): National Library of Medicine (US); [updated Jun 24; cited 2020 Jul 1]. Available from: https://medlineplus.gov/ency/article/001299.htm

Statistics Canada. Table 13-10-0963-01 Predicted age-standardized and all ages five-year net survival estimates for selected primary types of cancer, by sex, 2019 to 2021. https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310096301.


Rich, J. T., Neely, J. G., Paniello, R. C., Voelker, C. C., Nussenbaum, B., & Wang, E. W. (2010). A practical guide to understanding Kaplan-Meier curves. Otolaryngology--head and neck surgery : official journal of American Academy of Otolaryngology-Head and Neck Surgery, 143(3), 331–336. https://doi.org/10.1016/j.otohns.2010.05.007 


Yang, Z., Kanniainen, J., Krogerus, T., & Emmert-Streib, F. (2022). Prognostic modeling of predictive maintenance with survival analysis for mobile work equipment. Scientific reports, 12(1), 8529. https://doi.org/10.1038/s41598-022-12572-z 



