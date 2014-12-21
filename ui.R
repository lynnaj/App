library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Would you be happier living in San Jose?"),
  sidebarPanel(
    h3('Tell us about your city'),
    textInput('city_label', 'Name of your city:', value=''),
    br(),
    br(),
    selectInput('criteriaONE', 'Text input:',
                c('Excellent' = 'Excellent',
                  'Good' = 'Good',
                  'Fair' = 'Fair',
                  'Poor' = 'Poor')),
    selectInput('criteriaTWO', 'Text input:',
                c('Excellent' = 'Excellent',
                  'Good' = 'Good',
                  'Fair' = 'Fair',
                  'Poor' = 'Poor')),
    selectInput('criteriaTHREE', 'Text input:',
                c('Excellent' = 'Excellent',
                  'Good' = 'Good',
                  'Fair' = 'Fair',
                  'Poor' = 'Poor')),
    selectInput('criteriaFOUR', 'Text input:',
                c('Excellent' = 'Excellent',
                  'Good' = 'Good',
                  'Fair' = 'Fair',
                  'Poor' = 'Poor')),
    selectInput('criteriaFIVE', 'Text input:',
                c('Excellent' = 'Excellent',
                  'Good' = 'Good',
                  'Fair' = 'Fair',
                  'Poor' = 'Poor')),
    actionButton("submitButton", "Submit")
    ),
  mainPanel(
    h3('Our prediction'),
    h4('You entered'),
    verbatimTextOutput('criteriaONEans'),
    verbatimTextOutput('criteriaTWOans'),
    verbatimTextOutput('criteriaTHREEans'),
    verbatimTextOutput('criteriaFOURans'),
    verbatimTextOutput('criteriaFIVEans'),
    br(),
    "Based on the answers you've given about your city, a score is then calculated.  This score can be considered as a satisfaction score for your city. 
    We then compared this score against the one we've calculated for San Jose, which was based on 2014 National Citizens Survey.  The score is out of 4 (being the best).",
    br(),
    br(),
    h4("Your city's score"),
    verbatimTextOutput('userScore'),
    br(),
    h4("Our conclusion"),
    verbatimTextOutput('conclusion')
    
    )
  )
)