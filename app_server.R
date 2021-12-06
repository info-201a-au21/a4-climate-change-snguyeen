#Scarlett Nguyen
library("dplyr")
library("ggplot2")
library("shiny")
library("plotly")

c02_dts <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

#View(c02_dts)

server <- function(input, output) {
  
  output$CO2emissionsplot <- renderPlotly({
    new_dts <- c02_dts %>%
    select(year, coal_co2_per_capita, oil_co2_per_capita, cement_co2_per_capita)
    colnames(new_dts) <- c("Year", "C02 Emission per Capita from Coal", "C02 Emission per Capita from Oil",
                           "CO2 Emission per Capita from Cement")
    plot1 <- ggplot(data = new_dts) + 
      geom_point(mapping = aes(x = Year, y = !!as.name(input$y_axis_input)), col = input$radioinput)
    
    plotly_plot <- ggplotly(plot1)
    
    return(plotly_plot)
  })
}

#First variable: What is the average C02 per capita in each country?
avg_c02_per_capita_by_country <- c02_dts %>%
  group_by(country) %>%
  summarize(avg_c02_per_capita = mean(co2_per_capita, na.rm = TRUE))
  avg_c02_per_capita_by_country

#Second variable: Which country has the highest average C02 per capita?
highest_avg_c02_per_capita_country <- max(avg_c02_per_capita_by_country, na.rm = TRUE) %>%
  pull(country)
          
#Which country has the lowest average C02 per capita?
lowest_avg_c02_per_capita_country <- filter(avg_c02_per_capita_by_country, 
      avg_c02_per_capita_by_country == min(avg_c02_per_capita_by_country, na.rm = TRUE)) %>%
      select(country)

#Third variable: Which year has the highest AVERAGE C02 per capita? (Unsure if syntax is correct)
highest_c02_per_capita_year <- c02_dts %>%
  filter(co2_per_capita == max(co2_per_capita, na.rm = T)) %>%
  pull(year)
#Fourth variable: Which country has the highest cumulative C02 emission?
#groupby country, sum cumulative_co2 by country 



#Fifth variable: Which country has the highest C02 per GDP? 

