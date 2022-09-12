import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:button_navigation_bar/button_navigation_expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/DefaultButtonCostumeColor.dart';
import 'package:flutter_app/Controllers/Authentication.dart';
import 'package:flutter_app/Screen/Welcome/Login/LoginScreen.dart';
import 'package:flutter_app/constants.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;
  bool _isSigningOut = false;
  int selectedIndex = 0;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      Text('Beer List'),
      Text('Add new beer'),
      Text('Favourites'),
    ];

    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('SANJAYA Stationery'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: kPrimaryLightColor.withOpacity(0.3),
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: kPrimaryLightColor.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: kPrimaryLightColor,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),
              Text(
                'Hello',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
                style: TextStyle(
                    color: kThirdColor.withOpacity(0.8),
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              SizedBox(height: 16.0),
              _isSigningOut
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : DefaultButtonCustomeColor(
                      color: kPrimaryColor,
                      press: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      text: 'Sign Out',
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonNavigationBar(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        children: [
          ButtonNavigationItem(
              icon: Icon(Icons.map_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }),
          ButtonNavigationItem(icon: Icon(Icons.add), onPressed: () {}),
          ButtonNavigationItem.expandable(
              expandableSpacing: 48.0,
              verticalOffset: 56.0,
              icon: Icon(Icons.expand_less),
              collapseButton: ButtonNavigationItem(
                  onPressed: () {},
                  color: Colors.blueGrey,
                  icon: Icon(Icons.close)),
              children: [
                ButtonNavigationExpandable(
                  onPressed: () {},
                  label: "Option 1",
                  height: 40,
                  width: 128,
                  icon: Icon(Icons.info),
                ),
                ButtonNavigationExpandable(
                    onPressed: () {}, height: 40, width: 96, label: "Option 2"),
              ]),
          ButtonNavigationItem(icon: Icon(Icons.remove), onPressed: () {}),
          ButtonNavigationItem(
              icon: Icon(Icons.view_stream_sharp), onPressed: () {}),
        ],
      ),
    );
  }

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

}