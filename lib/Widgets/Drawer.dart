import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("Assets/Images/Me.png"),
                ),
                accountName: Text("Vishal Singh"),
                accountEmail: Text("vishal5657singh5657@gmail.com"),
              ),
            ),
            ListTile(

              onTap: (){

                Navigator.pop(context);
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text("Settings",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Account",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
