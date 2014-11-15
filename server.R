library(shiny)
library(ElemStatLearn)
library(caret)
data(SAheart)

inTrain <- createDataPartition(y=SAheart$chd, p=0.7, list=FALSE)
training <- SAheart[inTrain,]
testing <-  SAheart[-inTrain,]
fitModel <- train(chd ~., method="glm", family="binomial", data=SAheart)

calc <- function(df) {
  pred <- predict(fitModel, df)
  
   if( pred[1] < 0.5) "You are probably healthy"
  else "Watch out, you probably have heart disease"
}

shinyServer(function(input, output) {
  
  output$summary <- renderPrint({input$famhist})
  output$sbp <- renderPrint({input$sbp})
  
  output$attemptCount <- renderText( {
    if( input$goButton == 0 ) "You have not hit the go button yet"
    else {
      paste ("Calculation #", input$goButton)
    }
  })
  
  output$result  <- renderText( {
    input$goButton
    
    if( input$goButton != 0) {
    isolate(
      calc( data.frame(sbp=input$sbp,
                       tobacco=input$tobacco,
                       ldl=input$ldl,
                       famhist=factor(as.character(input$famhist), levels=c("FALSE","TRUE"), labels=c("Absent", "Present")),
                       adiposity=input$adiposity,
                       obesity=input$obesity,
                       typea= input$typea,
                       alcohol= input$alcohol,
                       age= input$age)
            )
      )
     
    }
  })
  
})