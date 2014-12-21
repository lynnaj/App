library(shiny)
shinyServer(
  function(input, output, session) {
    observe({
      c_label <- input$city_label
      
      updateTextInput(session, "criteriaONE",
                      label = paste(c_label, "as a place to live"))
      
      updateTextInput(session, "criteriaTWO",
                      label = paste(c_label, "as a place to work"))
      
      updateTextInput(session, "criteriaTHREE",
                      label = paste("Quality of overall natural environment in", c_label))
      
      updateTextInput(session, "criteriaFOUR",
                      label = paste("Overall economic health of", c_label))
      
      updateTextInput(session, "criteriaFIVE",
                      label = paste("Sense of community in", c_label))
      
    })
    
    
    output$criteriaONEans <- renderText({
      input$submitButton
      isolate(paste(input$criteriaONE))})
    output$criteriaTWOans <- renderText({
      input$submitButton
      isolate(paste(input$criteriaTWO))})
    output$criteriaTHREEans <- renderText({
      input$submitButton
      isolate(paste(input$criteriaTHREE))})
    output$criteriaFOURans <- renderText({
      input$submitButton
      isolate(paste(input$criteriaFOUR))})
    output$criteriaFIVEans <- renderText({
      input$submitButton
      isolate(paste(input$criteriaFIVE))})
    
    answerScore <- reactive({
      criteriaONE <- input$criteriaONE
      criteriaTWO <- input$criteriaTWO
      criteriaTHREE <- input$criteriaTHREE
      criteriaFOUR <- input$criteriaFOUR
      criteriaFIVE <- input$criteriaFIVE
      
      allANSWERS <- c(criteriaONE, criteriaTWO, criteriaTHREE, criteriaFOUR, criteriaFIVE)
      
        
      assignScore <- function(x, y){
          if(x == "Excellent"){
            y = 4
          }else if(x == "Good"){
            y = 3
          }else if(x == "Fair"){
            y = 2
          }else if(x == "Poor"){
            y = 1
          }
      }
      
      scoreList <- sapply(allANSWERS, assignScore)
      
      avgAnswers <- mean(scoreList)
      
      print(avgAnswers)
    })
    
    
    finalconclusion <- reactive({
   
      answerScore <- answerScore()
      sanJoseScore <- 2.578
      
      if(answerScore > sanJoseScore){
        text <- "You would most likely not be happy in San Jose.  You are probably better off living where you are now!"
      }else if(answerScore < sanJoseScore){
        text <- "We predict that you would be happier living in San Jose."
      }else(text <- "Based on your input, we are not able to predict if where you'd be happier.")
      
      print(text)
      
    })
    
    output$userScore <- renderText({
      input$submitButton
      isolate(paste(answerScore()))})
    
    output$conclusion <- renderText({
      input$submitButton
      isolate(paste(finalconclusion()))})          
  }
)