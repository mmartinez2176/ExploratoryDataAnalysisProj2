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

## QUESTION 5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##Compare emissions from motor vehicle sources in Baltimore City with emissions
##     from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
##     Which city has seen greater changes over time in motor vehicle emissions?

## Queston 5
##    Code: R Programming file plot5.R  
##    Plot: plot5.png

totalYearlyEmissions <- NEI %>% 
                        filter(fips=="24510" | fips=="06037", type=="ON-ROAD") %>% 
                        group_by(year,fips) %>% 
                        summarise(Emissions=sum(Emissions)) %>%
                        mutate(fips=replace(fips, fips=="24510","Baltimore City")) %>%
                        mutate(fips=replace(fips, fips=="06037","Los Angeles County"))

png("plot5.png", width=640, height=480)

graph <- ggplot(totalYearlyEmissions, aes(year, Emissions, color=fips))
graph <- graph +
    geom_line() + 
    xlab("Year") +
    ylab("Total PM(2.5) Emission") +
    ggtitle("Total PM emission at various years for Baltimore & Los Angeles (ON-ROAD)")
print(graph)
dev.off()

## Answer Question 5:
## As you can see from the plot5.png, Baltimore has consistently decreased PM2.5 from
##      1998 through 2008(ON-ROAD).  However, Los Angeles County from 1998 to 2005 was steadly increasing
##      the PM2.5 values, after 2005 the has been a steady decrease.

