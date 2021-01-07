######################################################################
######################################################################
###################       Digital Methods For      ###################
###################            Historians          ###################
###################                                ###################
###################        Troels Dahl Madsen      ###################
######################################################################
######################################################################


#install.packages("readxl")

# I installed the package that helped me to read excel files.

library("readxl")

# After this I ran the library that is able to read excel files in this 
# workspace. After this I download the data from: 
# "https://www.migrationpolicy.org/programs/data-hub/us-immigration-trends"
# The dataset is called "Legal Immigration to the United States 1820-2019
# Now I save the dataset in my current repository

xl_data<- read_excel("MPI-Data-Hub_LPRTrend_1820-2019.xlsx")

# The command above imports my excel data into this workspace under 
# the variable xl_date and reads the file with the command read_excel 
# using the file name. 
 
# Now the dataset is in my workspace under the variable xl_data.

depression_data<-xl_data[106:126,]

# Since the data set is from 1820-2019 I have to remove the observations
# I do not need. I therefore made another data set called depression_data
# which only includes the numbers from 1925-1945. The line of code above
# creates my new variable and i chose to call it depression_data, since 
# it gives me the numbers of new legal residents in the years before and
# after The Great Depression.

depression_data<-transform(depression_data, Year = as.numeric(Year))

# I found out my data in the coloumn "Year" was of the type "chr" or 
# characters. I therefore need to convert it to a numeric type 
# in order for my barplot to work.
# This was done using the transform function. I saved my new numeric variable
# as in the same name as before and that erased the previous variable. 
# I therefore loose the old variable and get a new variable
# with numeric variables.

barplot(
  # I chose a barplot design for my dataset.
  
  height=depression_data$Number.of.Legal.Permanent.Residents,
  # The height of my bars is set to the residents for the 
  # corresponding year. 
  
  names=depression_data$Year,
  # I set the data for my x-axis to years. 
  # I plot the years along the x-axis.
  
  col="orange",
  # changed colour to orange. 
  
  xlab="Years",
  # Set label to x-axis called "Years" 
  
  ylab="Residents",
  # Set label to y-axis called "Residents" 
  
  cex.names=0.7,
  # Changed size on the labels x-axis 
  
  cex.axis =0.7,
  # Changed size on the labels for my y-axis 
  
  main="Annual Number of New Legal Permanent Residents")
# Made the titel on top of the graph 


