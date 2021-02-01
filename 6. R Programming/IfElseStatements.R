ham <- 10
cheese <- 10
report <- 'blank'

if (ham >= 10 & cheese >= 10){
  report <- 'Strong sales of both ham and cheese'
}else if (ham == 0 & cheese == 0){
  report <- 'No sales today!'
}else{
  report <- 'We sold something today!'
}

print(report)
