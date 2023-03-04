install.packages("dplyr")
library(dplyr)

data("mtcars")
head(mtcars)
mtcars

sum(is.na(mtcars))

summarize(mtcars,mean=mean(mpg))
summarize(mtcars,min=min(am))
summarize(mtcars,max=max(hp))
summarize(mtcars,median=median(disp))

length(mtcars)
dim(mtcars)
str(mtcars)     #str is structure same as df.info() in python pandas
summary(mtcars) # summary is same as df.describe() in python pandas

var(mtcars$disp, na.rm = FALSE)
sd(mtcars$mpg,na.rm=TRUE)
IQR(mtcars$hp)

round(mtcars, digits = 1)

sort(mtcars$mpg)

arrange(mtcars,mpg)

arrange(mtcars,disp)

t<-mtcars%>%arrange(desc(disp))
t

# ADDING NEW COLUMN : YEAR

l1=list()         # mpg<=14:year=2018 , mpg<=17:year=2019 , mpg<=20:year=2020 , mpg>20:year=2021

for (i in (1:length(mtcars$mpg))){
  if (mtcars$mpg[i]<=14){
    l1[i]=2018
  }else if (mtcars$mpg[i]<=17){
    l1[i]=2019
  }else if (mtcars$mpg[i]<=20){
    l1[i]=2020
  }else{
    l1[i]=2021
  }
}

print(l1)

a=unlist(l1)
a

d<-data.frame(year=a)
d

mtcars<- cbind(mtcars,d)
mtcars


# Visualization

library(ggplot2)

ggplot(mtcars, aes(x = year)) + geom_bar(col="red")

ggplot(mtcars, aes(x = hp)) + geom_boxplot()

ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(aes(col=gear), size=5) + xlim(5,35) + ylim(0,6)

ggplot(mtcars, aes(x = disp, y = mpg)) + geom_line(col="red") + xlim(0,500) + ylim(0,35)
