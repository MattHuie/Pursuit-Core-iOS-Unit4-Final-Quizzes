# Unit 4 Final - Quizzes


## Github Instructions
- Fork this repository.
- Clone it to your machine
- Complete the sections below
- Commit ofter as we will also be monitoring your commit history while grading
- Add, commit and push your changes
- Create a pull request from your fork back to the original repo here
- Paste the link of your fork into Canvas

## App Description
Build a Quiz app that allows the user to create quizzes. Created quizzes should be persisted to the documents directory. The user will then able to use those quizzes as flash cards. 

## Gif 

### Profile Creation
Here app is showing empty state as the user hasn't create any quizzes. When the user navigates to the "Create" tab is has not logged in an alert is presented. The user is able to create a profile including username and image from the photo library.

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-1.gif)    

### Adding a Quiz from the Search tab
Here the user is search for a quiz and succesfully adds it to their Quiz collection. The user is able to click on a Quiz in their collection and view it using a transition view animation. The Quiz first shows the title then when the user taps on the Quiz it transitions to the description. 

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-2.gif)    

### Creating a Quiz 
This screen is show the Quiz creation process. Make sure to handle all required fields appropriately with alerts to the user. e.g "Title is required" alert, or "The Quiz required two facts" alert.

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-3.gif)    


### Deleting a Quiz
This screen shows that the user is able to delete a Quiz from their collection.   

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-4.gif)    


## The process of creating a quiz in the Create Quiz View Controller

1. Enter the title of the quiz. e.g Quick Sort 
2. Enter the first term (description) for the quiz. e.g Uses divide and conquer and splits the array into three parts based on a "pivot" variable.
3. Enter the second term (description) for the quiz e.g Picks an element as pivot and partitions the given array around the picked pivot
4. After all required fields are filled the quiz will be created using the "Create" button item.  

## Requirements - Rubric 

| Criteria | Points |
|:-----:|:------:|
| Use MVC principles and Swift best practices | 4 |
| The user can add a profile photo from the photo library | 4 |
| The photo persists through launches of the app | 4 |
| The user can create a quiz, required to persist | 4 |
| The user can delete a quiz, required to persist | 4 |
| The user can view all created quizzes in a collection view | 4 |
| Sort created quizzes by most recently added date | 4 |
| The user can change their profile photo, required to persist | 4 |
| The user can add an online quiz their quiz collection | 4 |
| The user can view the facts of the quiz on the detail view in collection cells using a transition animation | 4 |
| Handle not creating duplicate quizzes | 4 |
| Show alert when user is not logged in and attempting to create a quiz | 4 |
| Show alert errors and empty states as appropriate e.g "no quizzes" if quizzes haven't been created | 4 |
| Sort online quizzes by name | 4 |

Total Points (MVP) 56 Points

## Architecture 

The app has four tabs hosted by a Tab Bar Controller: 

- First tab: Quizzes Tab (this is a collection view of all your quizzes). 
- Second tab: Search Quizzes Online Tab (here you can add quizzes to your list from the Quizzes API). 
- Third tab: Create Tab (the user can create a quiz here). 
- Fourth tab: Profile Tab (shows the user's profile image and username). The user can use the photo library to change their profile image.


## AutoLayout Requirements 

| Programmatic | Required |
|:------:|:-------|
| QuizCell | Yes |
| QuizDetailView | Yes |
| OnlineQuizCell | Yes |
| SearchQuizzesView | Yes |

## Endpoint - Search Tab

Quizzes API

```GET http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes```

## Project Resources 

Feel free to use the provided resources, but you are also okay to use your own utility classes (e.g NetworkHelper or URLSession directly) and assets. 

Assets 
- add icon collection view search cell 
- create icon for tab bar 
- placeholder image for profile view 
- quiz icon for tab bar 
- profile icon for tab bar 
- use the system search icon 

Utility Files 
- AppError 
- NetworkHelper 
- DataPersistenceManager 
- Date+Extensions
- String+DateExtensions

## Extra Credit - Bonus

| Criteria | Points |
|:-----:|:------:|
| The user can also use the camera to take a profile photo if available | 5 |
| The app is able to switch between user profiles (hint: use the user's username for the name of the .plist file) | 5 |
| Create View Controller presents modally [Present a View Controller modally when tab is Pressed](https://www.hackingwithswift.com/example-code/uikit/how-do-you-show-a-modal-view-controller-when-a-uitabbarcontroller-tab-is-tapped) | 5 |
| Use a search bar for searching the user's quiz collection or online quizzes | 5 |
 
Extra Credit Points 20 Points




