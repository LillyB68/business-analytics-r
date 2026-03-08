students <- data.frame(
  id = c(1,2,3,4,5,6,7,8),
  name = c("Alice", "Bob", "Charlie","David","Eva","Frank","Grace","Helen"),
  age = c(19,22,21,23,20,22,21,24),
  gender = c("F","M","M","M","F","M","F","F"),
  city = c("CPT","JHB","JHB","CPT","CPT","JHB","CPT","JHB"),
  marks = c(65,78,45,88,92,55,70,NA)
)

#R fundamentals
scores <- seq(1:10)
scores[3:7]
rev(scores)

#Matrix
m <- matrix(1:9, nrow = 3, ncol = 3)
m
m[,3]
t(m) #transposing. Making the rows the cols, and the cols the rows

#List
school_data <- list(students, scores,m)
school_data
school_data[[2]]

#Logical conditions
passed <- ifelse(students["marks"] >= 50, "passed", "failed")
passed

#Data cleaning 
library(tidyverse)
mean_marks <- mean(students$marks, na.rm = TRUE)
mean_marks
students <- students %>% mutate(marks = ifelse(is.na(marks), mean_marks, marks))
students

#dplyr data manipulation
library(dplyr)
#select function
students %>% select(name, city, marks)
#filter function
students %>% filter(marks > 70)
#using mutate to create a new column
students <- students %>% mutate(grade = ifelse(marks >= 75, "Distinction", ifelse(marks < 50, "fail", "pass")))
students

#Aggregation
avg_marks <- students %>% group_by(city) %>% summarise(mean(marks))
avg_marks

#Sorting
students_sorted <- students %>% arrange(desc(marks))
students_sorted
students_sorted <- students %>% arrange(marks)
students_sorted

#Joins

courses <- data.frame(
  id = c(1,2,3,4,5,6,7,8),
  course = c("Math","Stats","Stats","AI","Math","AI","Stats","Math")
)
#joining students y id using left join
joined_data <- left_join(students, courses, by="id")
joined_data

#Loops
#for loop
for (i in 1:nrow(students)){
  print(paste(students$name[i], "scored",  students$marks[i]))
}
#while loop
count = 0
i = 1
while (i <= nrow(students)){
  if (students$marks[i] >= 70){
    count = count + 1
  }
  i = i+1
}
print(count)

#plotting
#bar chart