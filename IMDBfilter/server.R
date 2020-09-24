library(shiny)
library(dplyr)
source("run.R")
shinyServer(function(input, output, session) {
    tab <- reactive({
        yearIn      <- input$year
        durationIn  <- input$duration
        countryIn   <- input$country
        genreIn     <- input$genre
        numIn       <- input$num
        voteIn      <- input$vote
        out <- dat
        gind <- 1:nrow(out)
        if(!("Any" %in% genreIn)){
        for(i in seq_along(genreIn)){
                gind <- intersect(gind, grep(genreIn[i], out$Genre))
            }
        out <- out[gind,]
        }
        cind <- numeric()
        for(i in seq_along(countryIn)){
                cind <- union(cind, grep(countryIn[i], out$Country))
            }
        out <- out[cind,]
        out <- out %>%
            filter(Year >= yearIn[1] & Year <= yearIn[2]) %>%
            filter(Duration >= durationIn[1] & Duration <= durationIn[2]) %>%
            filter(Votes >= voteIn) %>%
            arrange(desc(Rating), desc(Votes))
        head(out, numIn)
    })
    output$txt <- renderText({
        ifelse(nrow(tab()) == 0, 
               "No movies match your input",
               paste("Top", input$num, "Movies based on your selection"))
        }) 
    output$imdbTable <- renderDataTable({
        tab()
        }, escape = FALSE)

})
