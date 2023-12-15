num_students<-5
num_courses<-5

student_names<-c("Arun Rahul","Bheem Kumar","Raj Kumar","Jahal A R","Suresh")

course_marks<-matrix(c(
  85,92,78,88,95,
  75,80,85,70,60,
  100,78,56,34,56,
  78,45,67,89,90,
  89,80,67,78,90
),nrow=num_students,byrow=TRUE)

print(course_marks)

student_records<-list()
for(student_index in 1:num_students)
{
  student_name<-student_names[student_index]
  
  total_marks<-sum(course_marks[student_index,])
  average_marks<-total_marks/num_courses
  
  grade<-ifelse(average_marks>=90,"A",
          ifelse(average_marks>=80,"B",
                ifelse(average_marks>=70,"C",
                       ifelse(average_marks>=60,"D","F"))))
  
  student_record<-list(name=student_name,marks=course_marks[student_index,],
                       total=total_marks,average=average_marks,grade=grade)
  
  student_records<-append(student_records,list(student_record))
}
  ("\nstudent grade report:\n")
for(record in student_records)
{
  cat("Name:",record$name,"\n")
  cat("Marks:",record$marks,"\n")
  cat("Total Marks:",record$total,"\n")
  cat("Average Marks:",record$average,"\n")
  cat("Grade:",record$grade,"\n")

}
