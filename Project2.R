
library(caTools)

regressor=lm(formula=sales~., 
             data=Sales_dataset_csv)
replot(regressor)
par(mfrow=c(2,2)) plot(regressor)

summary(regressor)$coeff
anova(regressor)
AIC(regressor)
BIC(regressor)

regressor_new=lm(formula=sales~advertise+plays, 
             data=Sales_dataset_csv)
replot(regressor_new)
par(mfrow=c(2,2)) plot(regressor_new)

summary(regressor_new)$coeff
anova(regressor_new)

library(MASS)
step <-stepAIC(regressor,
               direction="both")
summary(step)
y_pred=predict(regressor,
               newdata=Sales_dataset_csv)
head(y_pred)
