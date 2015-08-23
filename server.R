palette(c("cadetblue", "chartreuse4", "coral4", "deepskyblue3", "darkorchid1"))
# Load pottery data set
library(HSAUR)
library(tools)
data(pottery)

shinyServer(function(input, output, session) 
{    
    # Create new data frame based on X and Y selection
    data <- reactive({pottery[, c(input$xcol, input$ycol)]})

    clusters <- reactive({kmeans(data(), input$clusters, nstart=200)})

    output$plot <- renderPlot({
        par(mar = c(2, 2, 2, 2))
        plot(data(), axes=TRUE,
             col = clusters()$cluster,
             pch = 20, cex = 5)
        points(clusters()$centers, pch = 5, cex = 5, lwd = 5)
    })
})