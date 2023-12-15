
library(ggplot2)

purchase_data<-data.frame(
  customerID=c(101,102,103,104,105,106,107,108),
  purchaseamount=c(150,200,120,300,80,50,210,500)
)

mean_purchase<-mean(purchase_data$purchaseamount)
median_purchase<-median(purchase_data$purchaseamount)
sd_purchase<-sd(purchase_data$purchaseamount)
q1_purchase<-quantile(purchase_data$purchaseamount,probs=0.25)
q3_purchase<-quantile(purchase_data$purchaseamount,probs=0.75)

cat("mean purchase amount:",mean_purchase,"\n")
cat("median purchase amount:",median_purchase,"\n")
cat("standard deviation purchase amount:",sd_purchase,"\n")
cat("1st quantile purchase amount:",q1_purchase,"\n")
cat("3nd quantile purchase amount:",q3_purchase,"\n")

ggplot(purchase_data,aes(x=purchaseamount))+
  geom_histogram(binwidth=45,fill="orange",color="black")+
  labs(title="distribution of purchase amounts",x="purchase amount",y="frequency")


