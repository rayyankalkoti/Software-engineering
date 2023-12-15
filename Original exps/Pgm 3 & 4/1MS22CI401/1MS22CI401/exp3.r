calculate_fine<-function(days_overdue){
  if(days_overdue<=7){
    
    fine<-0
  }else if (days_overdue>=8 && days_overdue<=15){
    
    fine_per_day<-2
    fine<-(days_overdue-7)*fine_per_day
    
  }else if (days_overdue>=16 && days_overdue<=30){
      
      fine_per_day<-3
      fine<-8*2+(days_overdue-15)*fine_per_day 
      
  }else if (days_overdue>=31 && days_overdue<=50){
    
    fine_per_day<-5
    fine<-8*2+15*3+(days_overdue-30)*fine_per_day 
    
  }else if (days_overdue > 50){
    print("contact library")
  }
  return(fine)
}
days_overdue<-as.integer(readline("Enter the number of days the book is overdue:"))

fine_amount<-calculate_fine(days_overdue)

cat("Fine Amount:",fine_amount,"\n")

if(fine_amount==0){
  
  cat("No fine.Thank you for returning the book on time!\n")

}else{
  if(days_overdue>50){
    cat("Please pay the fine within the specified period.\n")
  }
}