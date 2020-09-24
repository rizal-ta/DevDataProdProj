library(shiny)
library(shinyWidgets)
source("run.R")
shinyUI(fluidPage(
            navbarPage("IMDB Filter",
                   tabPanel("Filter",
                     sidebarLayout(
                       sidebarPanel(
                        numericInput("num", 
                                     "Choose the number of movies to display",
                                    value = 10,
                                    min = 0),
                        numericInput("vote", 
                                     "Choose the minimum number of votes needed",
                                     value = 500,
                                     min = 99,
                                     max = 2278845),
                        sliderInput("year",     
                                    "Choose the year range: ",
                                    min = 1894,
                                    max = 2020,
                                    value = c(1894, 2020)
                                    ),
                        sliderInput("duration",
                                    "Choose duration range: ",
                                    min = 41,
                                    max = 808,
                                    value = c(41,808)
                                    ),
                        pickerInput("country",
                                    "Choose countries: ", 
                                    choices = country,
                                    multiple = TRUE,
                                    options = list('actions-box' = TRUE),
                                    selected = country
                                    ),
                        pickerInput("genre",
                                    "Choose genres: ",
                                    choices = genre,
                                    multiple = TRUE,
                                    options = list('actions-box' = TRUE),
                                    selected = "Any"
                                    ),
                        submitButton("Filter")
                    ),
                    mainPanel(
                        h3(textOutput("txt")),
                        dataTableOutput("imdbTable")
                        )
                   )
                ),
                tabPanel("How to use",
                         sidebarLayout(
                           sidebarPanel(
                             h4("Links"),
                             hr(),
                             a("IMDB",
                               href = "https://www.imdb.com/",
                               target = "_blank"),
                             br(),
                             a("Dataset used",
                               href = "https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset",
                               target = "_blank"),
                             br(),
                             a("Github repo for this app",
                               href = "https://github.com/rizal-ta/DevDataProdProj",
                               target = "_blank"
                               )
                             ),
                           mainPanel(
                             h3("How to use : "),
                             "This app lets you filter movies from IMDB which has 
                             more than 100 user ratings as of 01/01/2020. It will 
                             let you filter with a range of year and duration. 
                             You can also select which countries and genres 
                             should be considered. Countries selected will be on
                             OR logic and genre on AND logic. The resultant data 
                             table will be sorted according to rating."
                         )
                  )
              )
          )
      )
)
