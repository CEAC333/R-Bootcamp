# If, else, and else if Statements

x <- 13
if(x == 10){
  print('x is equal to 10')
}else if (x==12){
  print('x equal to 12')
}else{
  print('x was not equal to 10 or 12')
}


hot <- TRUE
temp <- 100

if(temp > 80){
  # Execute if condition was true
  print('Temp is greater than 80')
}
print(hot)

temp <-30

if (temp>80){
  print('Hot Outside!')
}else{
  print( 'Temp is not greater than 80')
}


if (temp <= 80 & temp >=50){
    print('Nice Outside!')
}else{
   print("It's less than 50 degrees outside")
}    



ham <- 10
cheese <- 10
report <- 'blank'

if(ham >=10 & cheese >=10){
  report <- "Strong sales of both ham and cheese"
}else if(ham == 0 & cheese == 0){
  report <- "No sales today!"
}else{
  report <- "We sold something today!"
}

print(report)

# 5
ham <- 5
cheese <- 5
report <- 'blank'

if(ham >=10 & cheese >=10){
  report <- "Strong sales of both ham and cheese"
}else if(ham == 0 & cheese == 0){
  report <- "No sales today!"
}else{
  report <- "We sold something today!"
}

print(report)