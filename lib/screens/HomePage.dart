import 'package:event_managemnet/screens/add_event_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _listItem = [
    'images/item_one.png',
    'images/item_one.png',
    'images/item_one.png',
    'images/item_one.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          onChange: (val){
            print(val);
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                MaterialButton(
                  elevation: 16.0,
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Image.asset(
                    "images/menu_icon.png",
                    height: 36.0,
                    width: 36.0,
                  ),
                  padding: EdgeInsets.all(14),
                  shape: CircleBorder(),
                ),
                /* RawMaterialButton(
                  padding: EdgeInsets.all(14.0),
                  onPressed: () {},
                  elevation: 12.0,
                  fillColor: Colors.white,
                  child: Image.asset(
                    "images/menu_icon.png",
                  ),

                  shape: CircleBorder(),
                ),*/

                Center(
                    child: Text(
                  "Event Management",
                  style: TextStyle(fontSize: 18.0),
                )),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(24.0),
                  children: _listItem
                      .map((item) => Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                      image: AssetImage(item),
                                      fit: BoxFit.cover)),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Past Events"),
                Text("See More"),
                //TODO List
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  CustomBottomNavBar({this.defaultSelectedIndex=0,@required this.onChange});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(iconData: Icons.home, isIcon: true, index: 0),
          _bottomNavItem(
              iconData: Icons.event_outlined, isIcon: true, index: 1),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width/5,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEventPage()),
                );
              },
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.red.withOpacity(0.9),
                size: 42,
              ),
            ),
          ),
          _bottomNavItem(
              index: 2, iconData: Icons.notifications_outlined, isIcon: true),
          _bottomNavItem(iconData: Icons.person, isIcon: true, index: 3),
          // navItem(isIcon :false,
          //     isActive: true, imageName: 'images/icons_male_user.png', ),
        ],
      ),
    );
  }

  Widget _bottomNavItem(
      {@required int index,
      IconData iconData,
      @required bool isIcon,
      String imageName}) {
    return InkWell(

      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width/5,
          child: isIcon
              ? Icon(
                  iconData,
                  color: index == _selectedIndex ? Colors.black : Colors.grey,
                )
              : Image.asset(
                  imageName,
                  color: index == _selectedIndex ? Colors.black : Colors.grey,
                )),
    );
  }
}
