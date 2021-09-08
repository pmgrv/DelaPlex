###########################################################
# Copyright 2021, Tryon Solutions, Inc.
# All rights reserved.  Proprietary and confidential.
#
# This file is subject to the license terms found at 
# https://www.cycleautomation.com/end-user-license-agreement/
#
# The methods and techniques described herein are considered
# confidential and/or trade secrets. 
# No part of this file may be copied, modified, propagated,
# or distributed except as authorized by the license.
###########################################################
# Name: Pravinkumar A. Raut
# Date: 27-8-21
# Description: Stepping Through Cycle
############################################################ 
Feature: My Feature
Background:
# When I assign 1 to variable "home_size"
# And I assign 4 to variable "office_size"
# And I assign 12 to variable "hotel_size"

# And I assign 12 to variable "steps"
# And I assign 4 to variable "floors"

When I import scenarios from "Utilities\Stepping Through Cycle Utilities.feature"
@instructions @1
Scenario: Setting up Feature File
When I "update the Feature File Header with my name and the current date"
And I "update the description in the header as I become familiar with the exercise"
And I "change the Feature Declaration to match the file name (Stepping Through Cycle)"

@instructions @2
Scenario: Scenario Setup
############################################################ 
# A Scenario is a list of settings, actions, and/or 
#  validations ("Steps") used to perform a test or task.
############################################################ 

Given I "locate the @exercise tag at the bottom of this file"

When I "declare a scenario beneath the @exercise tag"
And I "name it 'Count the Steps'"

@instructions @3
Scenario: Taking our First Steps
############################################################ 
# A Step is an individual setting, action, or validation.
# A Scenario consists of a set of Steps. Steps start with 
#  one of the defined CycleScript keywords such as Given, 
#  And, When and Then.
############################################################ 

When I "add the following step to the scenario 'Count the Steps'"
	Given I "know a flight of stairs has 12 steps"
    
And I "add the following step to the scenario 'Count the Steps'"
	When I "have a building that has 3 stories"
    
And I "add the following step to the scenario 'Count the Steps'"
	Then I "know that building has 36 steps"

@instructions @3
Scenario: Stepping it Up
############################################################ 
# Backgrounds are similar to regular Scenarios except 
#  the Background is executed before each Scenario is 
#  executed in the Feature File. Backgrounds are often 
#  suited for data loading and/or cleanup
# Variables are used to store information to be referenced 
#  and manipulated by Cycle. They can designated with a $
#  such as $example or $home_size
############################################################ 

Given I "add a background scenario"
And I "add variables to track the number of floors a building has"

When I "add a variable to the background named home_size and I give it the value of 1"
And I "add a variable to the background named office_size and I give it the value of 4"
And I "add a variable to the background named hotel_size and I give it the value of 12"

Then I "replace the second and third line of the 'Count the Steps' scenario with the following:"
	When I multiply variable "home_size" by 12
    Then I echo "My home has " $home_size "stairs!"
    
And I "run the test to see the results"

@instructions @4
Scenario: Taking a Step Back
############################################################ 
# The import functionality allows you to create "utility" 
#  Feature Files that contain reusable, oft-used Scenarios. 
#  Typical uses for a Utility Feature File would be opening or 
#  closing a browser, connecting to a database, or performing
# a common business process.
############################################################

When I "import the utility file Stepping Through Cycle Utilities"
	Given I "add the following step to my Background"
    	Given I import scenarios from "Stepping Through Cycle\Utilities\Stepping Through Cycle Utilities.feature"
	
    And I "look at that file to see how the utility scenarios in there work"

And I "add the variable steps to the Test Case Inputs CSV and set it to 12"

And I "replace the line 'When I multiply variable floorNum by 12' in my main scenario with the following line"
	Given I execute scenario "Calculating Number of Stairs"

@exercise
Scenario: Count the Steps
############################################################ 
# Begin your CycleScript in this scenario!
############################################################
Given I execute scenario "Calculating Number of Stairs"
Then I echo "My home has " $total_steps "stairs!"

@Scenario_Outline_With_CSV
Scenario Outline: Scenario Outline with CSV Example
CSV Examples:Test Case Inputs/raw_Stepping_Through_Cycle.csv
Given I assign all chevron variables to dollar variables
Given I execute scenario "Calculating Number of Stairs"
Then I echo "My " <stairType> " has " $total_steps " stairs!"