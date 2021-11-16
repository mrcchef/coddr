# Coddr
 - Coddr is an android application which aims to make the journey of excelling Data Structure and Algorithm(DSA)skills more profitable and satisfying.
 
 - It helps users to participate in coding contests in various platforms like Codeforces, Codechef, etc  and compete in the curated contest.
 - The winners in the curated contest will get coins according to their rank and they can redeem various rewards by using the coins.
 - The app helps user create contests by the user so that a group of friends can compete among themselves by using specific password.

## Features

- Authentication
- Edit Profile
- Email Verification
- Coding Handles Verification
- Create Curated Contest
- Directing to website
- Redeem Rewards

## 🛠 Technologies and Framework Used
- Figma(to design UI)
- Flutter Framework(Dart language)
- Firebase(for Authentication And Storing Data)
- Bloc(for state management)
- Clean Architecture
- API(Get data from The coding platforms)

## Usage/Examples

```javascript
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//MyApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
    Widget build(BuildContext context) {
        return MaterialApp();
}
```
## Demo
![](Coddr.gif)

## Images
 
### SignUp page:
#### Page for the registration of users.The Authentication is done using firebase.
<img src="app_images/SignUp.jpg"
     alt="SignUpPage" width="250" height="500"/>
 
 ### Home page:
#### This will be the first landing page of the app when user will login to the application and have multiple options of coding platforms as shown in the picture.
<img src="app_images/homepage.jpg"
     alt="HomePage" width="250" height="500"/>
     
### Profile page:
#### User’s profile page which contains the essential information of the user and it’s past records in the platforms.
<img src="app_images/profilepage.jpg"
     alt="ProfilePage" width="250" height="500"/>

### Edit Profile page:
#### User can edit his profile in this page accept some critical details.
<img src="app_images/editprofile.jpg"
     alt="EditProfilePage" width="250" height="500"/>
     
### Upcoming Contest page:
#### These are the list of contest available on the chosen coding platforms.This list is fetched from API of particular coding platform.
<img src="app_images/contestlist.jpg"
     alt="ContestListPage" width="250" height="500"/>
     
### Curated Contest page:
#### Curated Contests will be created both platform admins and users, independent of the platform where user is participating.
<img src="app_images/curatedcontest.jpg"
     alt="CuratedContestListPage" width="250" height="500"/>
     
### Curated Contest Details Page:
#### The page contains all the details of the curated contest that the user has participated in.It has the feature of redirecting to the platform's website.
<img src="app_images/RankListPage.jpg"
     alt="CuratedContestDetailsPage" width="250" height="500"/>
     
### Contest Creation page:
#### Page to create the curated contest by filling the details such as contest name,password,size and entry fee.
<img src="app_images/contestcreate.jpg"
     alt="ContestCreationpage" width="250" height="500"/>
     
     
### Participated Contest page:
#### It shows the list of past participated contests of a particular user.
<img src="app_images/participatedcontest.jpg"
     alt="ParticipatedContestpage" width="250" height="500"/>     
 
      
### Rewards page:
#### User can redeem the reward based on there coin balance.
<img src="app_images/rewardspage.jpg"
     alt="Rewardspage" width="250" height="500"/>

## Contributing
Contributions are always welcome!
If you have a suggestion that would make this better, please fork the repo and create a pull request. Don't forget to give the project a star! Thanks again!
- Fork the Project
- Create your Feature Branch (```bash git checkout -b feature/AmazingFeature```)
- Commit your Changes (```bash git commit -m 'Add some AmazingFeature'```)
- Push to the Branch (```bash git push origin feature/AmazingFeature```)
- Open a Pull Request 

## Contributors ✨
<table>
<tr>
<td align="center"><img height="180" width="180" src="Contributorimages/abhishekS.jpeg"><a href="https://github.com/abhisheksahu121">Abhishek Sahu</a></td>
<td align="center"><img height="180" width="180" src="Contributorimages/abhijeet.jpg"><a href="https://github.com/mrcchef">Abhijeet Tamrakar</a></td>
<td align="center"><img height="180" width="180" src="Contributorimages/kshittiz.jpg"><a href="https://github.com/Kshittiz21">Kshittiz Bhardwaj</a></td>
<td align="center"><img height="180" width="180" src="Contributorimages/SahilPP.jpg"><a href="https://github.com/sahilpotdukhe">Sahil Potdukhe</a></td>
</tr>
