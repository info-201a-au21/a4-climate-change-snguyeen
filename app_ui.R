#Scarlett Nguyen
library("shiny")
library("plotly")
source("app_server.R")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    h1("CO2 Emissions"),
    p("To be Updated")
  )
)

plot_sidebar <- sidebarPanel(
  selectInput(
    inputId = "y_axis_input",
    label = "Y-axis",
    choices = list("CO2 Emission per Capita from Coal", 
                   "CO2 Emission per Capita from Cement",
                   "CO2 Emission per Capita from Oil"),
    selected = "CO2 Emission per Capital from Oil"),
)

plot_main <- mainPanel(
  plotlyOutput(outputId = "CO2emissionsplot")
)

plot_tab <- tabPanel(
  "Interactive Visualisation",
  h2("CO2 Emissions per Capita"),
  sidebarLayout(
    plot_sidebar,
    plot_main
  ),
  radioButtons(
    inputId = "radioinput", 
    label = "Color Options", 
    choices = list("Red" , "Blue", "Green")),
  p("To be Updated")
)

ui <- navbarPage(
  "CO2 Emissions", 
  intro_tab, 
  plot_tab,
)




