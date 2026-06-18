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

# Key Findings & Interpretation

* **Clinical Efficacy:** Patients on the maintenance chemotherapy regimen stayed in remission for a **median of 31 weeks**—effectively extending remission by an average of **2 months (8 weeks)** compared to the nonmaintenance  group.
* **Understanding the Risk Table:** The **"Number at Risk"** metrics at the bottom of the plot indicate the exact headcount of patients who were still alive, enrolled in the study, and actively "at risk" of experiencing a relapse at each specific milestone.

## Libraries and Functions

### Libraries Reference TAble

| Library Name | Official Definition | Core Function in This Project |
| :--- | :--- | :--- |
| **`survival`** | The R package for survival analysis. It contains all the foundational routines for computing survival curves, managing censoring, and handling time-to-event data. | • Used to build the primary survival object via `Surv()`. <br>• Used to calculate the Kaplan-Meier mathematical model using `survfit()`. |
| **`ggplot2`** | A widely used data visualization package for R based on the *Grammar of Graphics*. | • Used during the exploratory data analysis (EDA) phase to build baseline histograms and bar charts (`geom_histogram()`, `geom_bar()`) to check for missing values and sample distributions. |
| **`survminer`** | A specialized extension package built on top of `ggplot2` designed specifically to facilitate the formatting, customization, and printing of publication-ready survival analysis curves. | • Used to generate the final, business-ready plot using `ggsurvplot()`. <br>• Handled the layout logic for truncating the axis, renaming headers, and perfectly aligning the **Number at Risk** table beneath the chart. |

----

### Functions Reference Table

| Function Name | Package | Purpose & Meaning in Your Code |
| :--- | :--- | :--- |
| **`library()`** | `base` | Loads the specified package into your R environment so you can use its specialized functions (e.g., loading `survival` or `survminer`). |
| **`head()`** | `utils` | Displays the first 6 rows of the dataset (`leukemia`). Quickly inspect column names, data types, and layout. |
| **`ggplot()`** | `ggplot2` | Initializes a canvas for data visualization. Declare the data source and map variables to the axes (`aes()`). |
| **`geom_histogram()`** | `ggplot2` | Adds a histogram layer to the plot to visualize the continuous distribution of tracking times (`time`) and check for missing values. |
| **`geom_bar()`** | `ggplot2` | Adds a bar chart layer to count discrete categories. You used this to check the balance of events (`status`) and treatments (`x`). |
| **`Surv()`** | `survival` | Creates a standardized **Survival Object**. This merges the time-to-event variable (`time`) and censoring indicator (`status`) into a single format that R's survival algorithms can read. |
| **`survfit()`** | `survival` | Fits the actual mathematical survival model. By using the formula `df_surv ~ x`, it calculates the step-down survival probabilities over time separately for each treatment group. |
| **`print()`** | `base` | Outputs a high-level summary of the model object, which is where you extracted the specific **median survival weeks** (31 vs 23) for your business metrics. |
| **`summary()`** | `base` | Generates a detailed, time-by-time breakdown of the survival curves, showing exactly when events occurred and the changing survival probabilities at each interval. |
| **`ggsurvplot()`** | `survminer` | The primary plotting function that combines your survival model and data. It translates the mathematical curves into a customized visual layout tailored for stakeholder reporting. |
| **`c()`** | `base` | A core R function used to combine values into a vector or list. You used it to pass pairs of values to arguments like `xlim = c(0, 50)` and `palette = c("#00AFBB", "#E7B")`. |








# Source

MedlinePlus [Internet]. (2024). Bethesda (MD): National Library of Medicine (US); [updated Jun 24; cited 2020 Jul 1]. Available from: https://medlineplus.gov/ency/article/001299.htm

Statistics Canada. Table 13-10-0963-01 Predicted age-standardized and all ages five-year net survival estimates for selected primary types of cancer, by sex, 2019 to 2021. https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310096301.


Rich, J. T., Neely, J. G., Paniello, R. C., Voelker, C. C., Nussenbaum, B., & Wang, E. W. (2010). A practical guide to understanding Kaplan-Meier curves. Otolaryngology--head and neck surgery : official journal of American Academy of Otolaryngology-Head and Neck Surgery, 143(3), 331–336. https://doi.org/10.1016/j.otohns.2010.05.007 


Yang, Z., Kanniainen, J., Krogerus, T., & Emmert-Streib, F. (2022). Prognostic modeling of predictive maintenance with survival analysis for mobile work equipment. Scientific reports, 12(1), 8529. https://doi.org/10.1038/s41598-022-12572-z 



