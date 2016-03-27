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

## QUESTION 1 
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##     Using the base plotting system, make a plot showing the total PM2.5 emission 
##     from all sources for each of the years 1999, 2002, 2005, and 2008.

## Queston 1
##    Code: R Programming file plot1.R  P
##    Plot: plot1.png

totalYearlyEmissions <-  NEI %>% 
                         group_by(year) %>% 
                         summarise(Emissions=sum(Emissions)) 

png("plot1.png")
barplot(height=totalYearlyEmissions$Emissions,
        xlab="Years",
        ylab=expression('Total PM(2.5) Emission'),
        names.arg=totalYearlyEmissions$year,
        main="Total PM emission at various years")
dev.off()

## Answer Question 1:
## As you can see from the plot1.png, as year progress the yearly summation of the 
##   PM2.5 decreases