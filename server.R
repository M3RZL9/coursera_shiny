library(shiny)

shinyServer(function(input, output) {
  
  filteredData <- reactive({
    iris[iris$Species == input$species, ]
  })
  
  output$mainPlot <- renderPlot({
    data <- filteredData()
    
    if(input$plotType == "scatter") {
      plot(data[[input$xvar]], data[[input$yvar]], 
           xlab = input$xvar, ylab = input$yvar, 
           main = paste("Scatterplot of", input$yvar, "vs", input$xvar),
           col = data$Species)
    } else if(input$plotType == "boxplot") {
      boxplot(data[[input$yvar]] ~ data[[input$xvar]], 
              xlab = input$xvar, ylab = input$yvar, 
              main = paste("Boxplot of", input$yvar, "by", input$xvar),
              col = "lightblue")
    }
  })
})


