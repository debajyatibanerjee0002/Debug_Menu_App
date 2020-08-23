import 'package:flutter/material.dart';

void main() {
  runApp(Menu());
}

class MenuItem extends StatelessWidget {
  const MenuItem(this.icon);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Text(
      icon,
      style: TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}

class MenuItemName extends StatelessWidget {
  final String itemText;
  const MenuItemName(this.itemText);
  @override
  Widget build(BuildContext context) {
    return Text(itemText);
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Menu Demo'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Modify code here
                Example1(),
                Example2(),
                Example3(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Problem 1: Overflow error
class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      shadowColor: Colors.black,
      elevation: 5,
      color: Colors.green[200],
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0, top: 30),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Row(
            children: [
              // add Expanded Widget
              Expanded(
                child: Center(
                  child: Text(
                    'Explore the restaurant\'s delicious menu items below!',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Problem 2: Viewport was given unbounded height error
class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrap listview widget with Expanded widget
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                MenuItem('🍔'),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                MenuItemName('Burger')
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            endIndent: 170,
          ),
          // MenuItem('🌭', 'Hot Dog'),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                MenuItem('🌭'),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                MenuItemName('Hot Dog')
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            endIndent: 170,
          ),
          // MenuItem('🍟', 'Fries'),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                MenuItem('🍟'),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                MenuItemName('Fries')
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            endIndent: 170,
          ),
          // MenuItem('🥤', 'Soda'),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                MenuItem('🥤'),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                MenuItemName('Soda')
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            endIndent: 170,
          ),
          // MenuItem('🍦', 'Ice Cream'),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                MenuItem('🍦'),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
                MenuItemName('Ice Cream')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Problem 3: Invisible VerticalDivider
class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrap row widget with SizedBox widget
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            onPressed: () {
              print('Pickup button pressed.');
            },
            child: Text(
              'Pickup',
            ),
          ),
          // This widget is not shown on screen initially.
          VerticalDivider(
            width: 20.0,
            thickness: 5.0,
          ),
          RaisedButton(
            onPressed: () {
              print('Delivery button pressed.');
            },
            child: Text(
              'Delivery',
            ),
          )
        ],
      ),
    );
  }
}
