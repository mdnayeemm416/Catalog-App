import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imgurl =
      'https://cdn.pixabay.com/photo/2016/10/10/16/32/pinup-1729057_1280.png';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purpleAccent),
                accountName: Text('Md Nayeem'),
                accountEmail: Text('mdnayeemdewann@gmail.com'),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imgurl),),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text('Home'),
            trailing: Icon(CupertinoIcons.link),
          )
        ],
      ),
    );
  }
}
