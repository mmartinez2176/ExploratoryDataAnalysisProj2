################################################################################
## QUESTION 1 
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##     Using the base plotting system, make a plot showing the total PM2.5 emission 
##     from all sources for each of the years 1999, 2002, 2005, and 2008.

## Answer Question 1:
## As you can see from the plot1.png, as year progress the yearly summation of the 
##   PM2.5 decreases



################################################################################
## QUESTION 2
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##     Use the base plotting system to make a plot answering this question.

## Answer Question 2:
## As you can see from the plot2.png, as year progress the yearly summation of the 
##   PM2.5 decreases for the area of Baltimore City, Maryland.  Though in 2005 there was an
##   upward spike, the 2008 decreased significantly.  Overall the answer to the question is that
##   PM2.5 has decreased in Baltimore from 1999-2008

 

################################################################################
## QUESTION 3
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##     which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##     Which have seen increases in emissions from 1999–2008? 
##     Use the ggplot2 plotting system to make a plot answer this question.

## Answer Question 3:
## As you can see from the plot3.png, that within Baltimore City the following types:
##      NONPOINT has had an overall steady decrease
##      NON-ROAD has had an overall steady decrease
##      ON_ROAD has had a steady decrease
##      POINT  had a increase from 1999 to 2005, however after 2005 there has been a sharper decrease



################################################################################
## QUESTION 4
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Answer Question 4:
## As you can see from the plot4.png, coal combustion related PM25 have decreased from 1998-2008



################################################################################
## QUESTION 5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##Compare emissions from motor vehicle sources in Baltimore City with emissions
##     from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
##     Which city has seen greater changes over time in motor vehicle emissions?

## Answer Question 5:
## As you can see from the plot5.png, Baltimore has consistently decreased PM2.5 from
##      1998 through 2008(ON-ROAD).  However, Los Angeles County from 1998 to 2005 was steadly increasing
##      the PM2.5 values, after 2005 the has been a steady decrease.