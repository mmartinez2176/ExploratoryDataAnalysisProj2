#######################################
# Exploratory Data Analysis
# Project 2
# Author Martin Martinez

# This R Script contains the resolution for the Exploratory Data Analysis 
# This script is broken into smaller section

#######################################
## Section A. load Library
library(data.table)
library(dplyr)
library(ggplot2)

#######################################
## Section B. getting the data

## set the working dir.  
myWorkingDir <- "/home/mmartine/Documents/Education/Coursera/04.  Exploratory-Data-Analysis/Course Project/Project 2"
if(!file.exists(myWorkingDir)){
    print("Cannot find the project directory")
    stop()
}

## validate the working directory exist 
setwd(myWorkingDir)

## Validate the the files do exist.
if(!file.exists("summarySCC_PM25.rds")){
    print("Cannot find summarySCC_PM25 file")
    stop()
}

## Validate the the files do exist.
if(!file.exists("Source_Classification_Code.rds")){
    print("Cannot find Source_Classification_Code file")
    stop()
}

## Using Dir as recommended to validate the file exist. 
if (!"summarySCC_PM25.rds" %in% dir()){
    print("Cannot find summarySCC_PM25 file")
    stop()
}

## Using Dir as recommended to validate the file exist. 
if (!"Source_Classification_Code.rds" %in% dir()){
    print("Cannot find Source_Classification_Code file")
    stop()
}

##get the Data set loading the file.
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Assignment
##You must address the following questions and tasks in your exploratory analysis. 
##    For each question/task you will need to make a single plot. Unless specified,
##    you can use any plotting system in R to make your plot.


## QUESTION 4
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Queston 4
##    Code: R Programming file plot4.R  
##    Plot: plot4.png

## To build the association with the two tables we'll need to merge them first.
mergedData <- merge(NEI, SCC, by="SCC")

totalYearlyEmissions <- mergedData %>% 
                        filter(grepl("coal",Short.Name,ignore.case=TRUE)) %>% 
                        group_by(year) %>% 
                        summarise(Emissions=sum(Emissions))  

png("plot4.png", width=640, height=480)

graph <- ggplot(totalYearlyEmissions, aes(factor(year), Emissions))
graph <- graph +
    geom_bar(stat="identity") + 
    xlab("Year") +
    ylab("Total PM(2.5) Emission") +
    ggtitle("Total PM emission from Coal Combustion-related 1998-2008")
print(graph)
dev.off()

## Answer Question 4:
## As you can see from the plot4.png, coal combustion related PM25 have decreased from 1998-2008
