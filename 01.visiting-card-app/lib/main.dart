import 'package:flutter/material.dart';

void main() {
  //Executes the MyApp class that is extending the StatelessWidget(From Line no.9)
  runApp(MyApp());
}

//Shortcut fot statelesswidget boiler plate is to type stless
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Returns the whole material app
    return MaterialApp(
      //Creating the scaffold to draw on the screen like painters paint in the white paper
      home: Scaffold(
        //Setting the white paper as teal color paper ,I mean setting app background color as teal
        //Accessing Colors class
        //The colors provided by Colors Class follows Material UI principles
        backgroundColor: Colors.teal,
        //SafeArea is the area bordered so that widgets doesn't get out of the good visibility areas
        body: SafeArea(
          //Creating Column
          //By Default Column are drawn from top to bottom
          child: Column(
            //Centering the whole column to center
            //As it is in column mode so centering does happen in vertical alignment
            mainAxisAlignment: MainAxisAlignment.center,
            //Widgets have child if it contains single layout style
            //Widgets have children if it contains multi layout style
            children: <Widget>[
              //Creating CircleAvatar widget to show the user profile image
              CircleAvatar(
                //Setting radius of the Circle Frame to hold photo
                radius: 50.0,
                //backgroundImage is the property of the CircleAvatar to set the image for CircleAvatar Widget
                backgroundImage: AssetImage('images/my_photo.jpg'),
              ),
              Text(
                'Rodan Ramdam',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    //Pacifico is the custom font which was added from resources folder fonts and the assets
                    //contd. are included using the pubspec.yaml configuration file
                    fontFamily: 'Pacifico',
                    color: Colors.white),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                  color: Colors.teal.shade100,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox is used as separator to separate or to create space between widgets
              SizedBox(
                height: 10.0,
                width: 150.0,
                //Divider generates the horizontal line
                //Since the Divider is child of SizedBox so the divider covers the area covered by the SizedBox widget
                child: Divider(color: Colors.teal.shade100),
              ),
              //Card helps to create slightly rounded and shadows effect
              //I replaced container with Card by just renaming and removing the padding property to get the card look.
              Card(
                  //using margin property to create some spacing between the widgets and screen
                  //using symmetric so that vertical and horizontal margin can be set separately
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  //Color of the card is white because I like white cards hehe
                  color: Colors.white,
                  //ListTile widget is a single fixed height row that combines text and its trailing icon
                  //ListTile is perfect to use in scenario like this
                  //Having padding with card didn't do the job to create a more area and center effect the text
                  //contd. inside the card so better to use ListTile
                  child: ListTile(
                    //Setting the Icon for the first ListTile
                    leading: Icon(
                      //Icon can the searched in the material ui icons browser and can directly accessed like this
                      //contd. for phone icons we have accessed the phone icon using Icons.phone
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    //Setting the Text for the first ListTile in the same row
                    title: Text(
                      '+977 123 4567 8901',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0),
                    ),
                  )),
              //Creating another card for email part card show like above card
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                      size: 20.0,
                    ),
                    title: Text(
                      'rodan@email.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceSansPro',
                        color: Colors.teal.shade900,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
