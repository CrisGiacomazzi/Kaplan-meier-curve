# Load the required library
library(survival)
library(ggplot2)
#install.packages("survminer")
library(survminer)

# Exploratory 

  # Inspect the dataset
head(leukemia)

#time: Survival or response time in weeks.
#status: Censoring status (0 = censored, 1 = dead/relapsed).
#x: Treatment. Maintenance chemotherapy indicator (Maintained vs Nonmaintained).

  # Distribution
ggplot(leukemia, aes(x=time))+
  geom_histogram()
  # Obs: missings

ggplot(leukemia, aes(y=status))+
  geom_bar()
  # Obs: more deads

ggplot(leukemia, aes(x=x))+
  geom_bar()
  # Obs: more Nonmaintained

####################### Kaplan-Meyer curve #####################################

# Create the Survival Object (Time, Status)
# status: 1 = dead, 0 = censored
df_surv <- Surv(time = leukemia$time, event = leukemia$status)

# Fit the Kaplan-Meier Curve based on Treatment Group
km_leukemia_fit <- survfit(df_surv ~ x, data = leukemia)

# Summary
print(km_leukemia_fit) #here calculate the diff week between treatments
summary(km_leukemia_fit)

# Plots ----
  #A drop in the Kaplan–Meier curve indicates the time of death due to any cause
  # General
ggsurvplot(
  km_leukemia_fit, 
  data = leukemia, 
  pval = TRUE,               # Log-Rank test p-value
  conf.int = FALSE,           # 95% Confidence intervals (noise in the plot)
  risk.table = TRUE,         # "Number at Risk" table at the bottom
  xlim = c(0, 50),          # Truncates the X-axis plot window (it was too long)
  break.time.by = 10,        # shows x-axis every 10 weeks 
  legend.title = "Treatment Regimen",
  legend.labs = c("Maintained", "Nonmaintained"),
  palette = c("#00AFBB", "#E7B"),
  xlab = "Time in Weeks",    
  title = "Maintenance Therapy Delays Leukemia Relapse by 8 Weeks",
  subtitle = "Trend favoring maintenance therapy (p = 0.065)"
)
#Number at risk" means the exact number of patients who are still alive, 
  #still enrolled in the study, and are "at risk" of experiencing the event.
# Number of patients alive at each timepoint
#Patients on the maintenance regimen stayed in remission for a median of 31 weeks—extending remission 
  #by an average of 2 months (8 weeks) compared to the observation group.

# Separated 
  # Create 2 datasets

# Dataset 1- 'Nonmaintained'
data_non <- subset(aml, x == "Nonmaintained")
fit_non  <- survfit(Surv(time, status) ~ 1, data = data_non)

plot_non <- ggsurvplot(
  fit_non, 
  data = data_non, 
  conf.int = TRUE, 
  risk.table = TRUE,
  palette = "#E7B", 
  xlab = "Time in Weeks",
  title = "Nonmaintained Treatment Group"
)

# Dataset 2- 'Maintained'
data_maint <- subset(aml, x == "Maintained")
fit_maint  <- survfit(Surv(time, status) ~ 1, data = data_maint)

plot_maint <- ggsurvplot(
  fit_maint, 
  data = data_maint, 
  conf.int = TRUE, 
  risk.table = TRUE,
  palette = "#00AFBB", 
  xlab = "Time in Weeks",
  title = "Maintained Treatment Group"
)

# Plot side-by-side (R open a native, external pop-up window)
arrange_ggsurvplots(
  list(plot_non, plot_maint), 
  print = TRUE, 
  ncol = 2, 
  nrow = 1
)