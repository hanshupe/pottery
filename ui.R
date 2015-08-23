library(HSAUR)
library(tools)
data(pottery)

shinyUI(
    pageWithSidebar(
    headerPanel('Chemical composition of Romano-British pottery clustering'),
    sidebarPanel(
        selectInput('xcol', 'X', names(pottery)),
        selectInput('ycol', 'Y', names(pottery),
                    selected=names(pottery)[[2]]),
        sliderInput('clusters', label='Cluster number (1-5)', value=3, min = 1, max = 5)
    ),
    
    
    
    mainPanel(
        p("The following shiny app is an basic example developed for the coursera data science course."),
        p("\n"),
        p("The pottery dataset (Chemical composition of Romano-British pottery) was used to demonstrate some interactive elements to perform 2-dimensional clustering on this dataset."),
        p("\n"),
        p("Therefore you can select any variables from the pottery dataset as X or Y axis and chose the desired number of clusters."),
        p("The kmeans clustering algorithm will assign each datapoint to one cluster. The result is shown in the graph below with each cluster center highlighted."),
        plotOutput('plot')
    )
))


