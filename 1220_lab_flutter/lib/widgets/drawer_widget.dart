import 'package:flutter/material.dart';
import 'package:flutter_lab_app/utils/utils.dart';


class DrawerWidget {

  static Widget getDrawerWidget(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Hannah"),
            accountEmail: Text("hannah@webcomm.com.tw"),
            currentAccountPicture: new CircleAvatar(
              radius: 50.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage:
              NetworkImage("http://tineye.com/images/widgets/mona.jpg"),
            ),
          ),

          DrawerItemWidget(Icons.search, ValueUtil.searchName, RouteUtil.casereqSearchRoute),
          DrawerItemWidget(Icons.note_add, ValueUtil.createName, RouteUtil.casereqCreateRoute),
        ],
      ),
    );
  }

}

class DrawerItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String routeName;

  DrawerItemWidget(this.icon, this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
