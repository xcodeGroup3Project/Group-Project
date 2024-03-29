# Fitn3ss

Submitted by: Katelyn Norton, Ethan Mendoza, Efren Siguenza, Samuel Pellot

Time spent: > 30 hours spent in total

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that is focused on fitness and it has features like meal plans, calorie tracker, and list of workouts.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Health & Fitness
- **Mobile:** This app will be primariy developed for ios devices. 
- **Story:** Allows users to track several different aspects of their heath to increase overall well being or fitness. 
- **Market:** Anyone could choose to use this app. 
- **Habit:** Users would most likely use this app every day or on just the days they work out. 
- **Scope:** The app would first start out by focusing on workout planning and food or water consumption but it could be expanded to track other health aspects. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] Users can track a workout plan
- [x] Users can record their meal plans
- [x] Users document their sleep

**Optional Nice-to-have Stories**

* Users have a calorie counter
* Users have a way to track their water consumption
* Users are able to setup a timer for workouts
* Users record their running distance and time
- [x] Users are able to calculate their BMI

### 2. Screen Archetypes

* Login
* Register - user registers for an account
   * With Downloading/Opening the appplication, the application will prompt the user to create an account to access all functions 
* Workout Screen
   * User is given option to hit 'Log Workout' button and will be directed to another screen
   * User is given option to hit 'Create Custom Workout' button and will be directed to another screen
   * Calander will be shown with the correct day of the month selected
* Log Workout
   * User will input the date, exercise name, duration, intensity, and workout notes
* Create Custom Workout
    * User will input workout name, estimated calories burned per minute, target area
* Sleep Screen
    * User inputs time in bed, HH:Min
    * User inputs date, MM/DD/YYYY
    * User is shown blogs, articles and more on sleeping to become an expert on sleep
* Diet Screen
    * User is able to add what they ate for Breakfast
    * User is able to add what they ate for Lunch
    * User is able to add what they ate for Dinner
    * Goal Calories will be subtracted by Calories consumed for the day, exercise will be added as well
* Food Diary Screen
    * User will be able to track calories consumed/burned here
    * User will be shown pie graph with total percntage of fats, protien, and carbs consumed
    * User will be shown total Calories eaten/burned
    * User will be shown date
    * User will have another way to add breakfast, lunch, and dinner

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Sleep
* Diet
* Workout

**Flow Navigation** (Screen to Screen)

* Log-in/Registration -> Log-in to account or create one 
* Sleep -> Jumps to Sleep Screen
* Diet -> Jumps to Diet Screen 
* Workout -> Jumps to workout screen

## Wireframes

![](wireframes.jpeg)

## Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='https://github.com/xcodeGroup3Project/Group-Project/blob/main/WalkThru.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with ... LICEcap - https://www.cockos.com/licecap/

## Notes
The most challenging part of this project was trying to get the collection view to segue to the detail view. But it doesn't even look like that is required?

## License
Copyright 2023 Fitn3ss

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


