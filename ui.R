library(shiny)



shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Do you have heart disease?"),
  
  sidebarPanel(
    
    sliderInput("sbp", "Systolic blood pressure", 50, 300, 120 ),
    
    sliderInput("tobacco", "Tobacco consumed (kg)", 0, 50, 0 ),
    
    sliderInput("ldl", "Blood ldl", 0.50, 18.0, 2.0),
    
    sliderInput("adiposity", "Adiposity", 5.0, 45.0, 18.0),
    
    sliderInput("obesity", "Obesity", 10.0, 50.0, 20.0),
    
    checkboxInput("famhist", "Family history", value=FALSE),
    
    sliderInput("typea", "Type A personality (scale 100)", 10.0, 100.0, 50.0),
    
    sliderInput("alcohol", "Alcohol consumption (cc)", 0.0, 200.0, 0.0),
    
    sliderInput("age", "Age", 15, 100, 50),
    
    actionButton("goButton", "Go!")
    
  ),
  
  
  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
    h3(textOutput("caption")),
    
    p("Just enter your info with the sliders and checkbox on the left, hit the go button and we will give a prediction on whether 
      you have heart disease. This is based on the SAheart dataset in the ElemStatLearn package.  It uses the glm method
      of the caret package"),
    
    
    h3("Attempt number:"),
    verbatimTextOutput("attemptCount"), 
    h3("Our prediction:"),
    verbatimTextOutput("result"),
    
    tableOutput("view")
  )
))
