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
Build a Quiz app that allows the user to create quizzes. Created quizzes should be persisted to the documents directory. The user will then be able to use those quizzes as flash cards. 

## Gif 

### Profile Creation
In this gif the app is showing an empty state as the user hasn't created any quizzes. When the user navigates to the "Create" tab an alert is shown because the user hasn't set up their profile. The user is able to create a profile including username and image from the photo library. Persist the User model to the documents directory along with their Quizzes. 

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-1.gif)    

### Adding a Quiz from the Search tab
Here the user is searching for a quiz and succesfully adds it to their Quiz collection. The user is able to click on a Quiz in their collection and view it using a transition view animation. The Quiz first shows the title then when the user taps on the Quiz it transitions with an animation to show the (fact) description. 

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-2.gif)    

### Creating a Quiz 
This screen is showing the Quiz creation process. Make sure to handle all required fields appropriately with alerts to the user. e.g "Title is required" alert, or "The Quiz requires two facts" alert. **All fields are required**   

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-3.gif)    


### Deleting a Quiz
This screen shows the user deleting a Quiz from their collection.   

![Quizzes Gif](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit4-Final-Quizzes/blob/master/Images/quizzes-app-4.gif)    


## Below highlights the process of creating a quiz in the Create Quiz View Controller

1. Enter the title of the quiz. e.g Quick Sort 
2. Enter the first term (description) for the quiz. e.g Uses divide and conquer and splits the array into three parts based on a "pivot" variable.
3. Enter the second term (description) for the quiz e.g Picks an element as pivot and partitions the given array around the picked pivot
4. After all required fields are filled in by the user, the user then taps on the "Create" button.  
5. The Quiz should now be visible in the Quizzes tab.

## Requirements - Rubric 

| Criteria | Points |
|:-----:|:------:|
| Use MVC principles and Swift best practices | 4 |
| The user can add a profile photo from the photo library | 4 |
| Persist the User model to the documents directory along with their Quizzes | 4|
| The photo persists through launches of the app | 4 |
| The user can create a quiz, **the title and two facts are required** | 4 |
| The user can delete a quiz | 4 |
| The user can view all created quizzes in a collection view | 4 |
| Sort created quizzes by most recently added date | 4 |
| The user can change their profile photo, required to persist | 4 |
| The user can search for an online quiz in the search tab and add to the quiz collection | 4 |
| The user can view the facts of the quiz on the detail view in collection cells using a transition animation | 4 |
| Handle not creating duplicate quizzes | 4 |
| Show an alert when the user is not logged in and attempting to create a quiz | 4 |
| Show alert errors and empty states as appropriate e.g "no quizzes added" if quizzes haven't been created | 4 |
| Sort online quizzes by name | 4 |

Total Points (MVP) 56 Points

## Architecture 

The app has four tabs hosted by a Tab Bar Controller (storyboard can be used to create this): 

- First tab: Quizzes Tab (this is a collection view of all your quizzes). 
- Second tab: Search Quizzes Online Tab (collection view) (here you can add quizzes to your list from the Quizzes API). 
- Third tab: Create Tab (the user can create a quiz here), consist of a UITextField and two UITextViews. 
- Fourth tab: Profile Tab (shows the user's profile image and username (make the username a UIButton if in case you are attempting the extra credit portion). The user can use the photo library to change their profile image.


## AutoLayout Requirements 

| Programmatic | Required |
|:------:|:-------|
| QuizCell | Yes |
| QuizDetailView | Yes |
| SearchCell | Yes |
| SearchQuizzesView | Yes |

## Endpoint - Search Tab

Quizzes API

```GET http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes```

## Project Resources 

Feel free to use the provided resources below, but you are also okay to use your own utility classes (e.g NetworkHelper or URLSession directly) and assets from icons8 for example. 

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
| The user can also use the camera to take a profile photo if available and save to the camera roll | 5 |
| The app is able to switch between user profiles (hint: use the user's username for the name of the .plist file) | 5 |
| Create View Controller presents modally [Present a View Controller modally when tab is Pressed](https://www.hackingwithswift.com/example-code/uikit/how-do-you-show-a-modal-view-controller-when-a-uitabbarcontroller-tab-is-tapped) | 5 |
| Use a search bar for searching the user's quiz collection and online quizzes | 5 |
 
Extra Credit Points 20 Points




