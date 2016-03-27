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

## QUESTION 3
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##     which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##     Which have seen increases in emissions from 1999–2008? 
##     Use the ggplot2 plotting system to make a plot answer this question.

## Queston 3
##    Code: R Programming file plot3.R  P
##    Plot: plot3.png

totalYearlyEmissions <- NEI %>% filter(fips=="24510") %>% group_by(type,year) %>% summarise(Emissions=sum(Emissions)) 

png("plot3.png", width=640, height=480)

graph <- ggplot(totalYearlyEmissions, aes(year, Emissions, color=type))
graph <- graph +
         geom_line() + 
         xlab("Year") +
         ylab("Total PM(2.5) Emission") +
         ggtitle("Total PM emission at various years Baltimore City, Maryland (fips==24510)")
print(graph)
dev.off()

## Answer Question 3:
## As you can see from the plot3.png, the following types:
##      NONPOINT has had an overall steady decrease
##      NON-ROAD has had an overall steady decrease
##      ON_ROAD has had a steady decrease
##      POINT  had a increase from 1999 to 2005, however after 2005 there has been a sharper decrease
