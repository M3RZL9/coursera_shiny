library(shiny)

shinyUI(navbarPage("Iris Explorer",
                   tabPanel("App",
                            fluidPage(
                              titlePanel("Iris Dataset Explorer"),
                              
                              sidebarLayout(
                                sidebarPanel(
                                  selectInput("species", "Select Species:",
                                              choices = unique(iris$Species)),
                                  selectInput("xvar", "X-axis variable:", 
                                              choices = names(iris)[1:4]),
                                  selectInput("yvar", "Y-axis variable:", 
                                              choices = names(iris)[1:4]),
                                  radioButtons("plotType", "Plot Type:",
                                               choices = list("Scatter" = "scatter", 
                                                              "Boxplot" = "boxplot"))
                                ),
                                mainPanel(
                                  plotOutput("mainPlot")
                                )
                              )
                            )),
                   tabPanel("Help",
                            fluidPage(
                              h3("How to Use"),
                              p("Choose a flower species, select variables for X and Y axes, and pick a plot type.")
                            ))
))
