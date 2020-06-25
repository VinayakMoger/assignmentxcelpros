import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'light_trapezoid.dart';

final animationDuration = const Duration(milliseconds: 500);

class BedroomPage extends StatefulWidget {
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  List<Color> lstColor = [
    Colors.red,
    Colors.green,
    Colors.lightBlueAccent,
    Colors.deepPurple,
    Colors.purpleAccent,
    Colors.yellow
  ];
  int brightness = 9;
  Color _color = Colors.red;
  int alpha = 255;
  String _filter = "Main Light";
  Color activeChipColor = Colors.indigo;
  Color inactiveChipColor = Colors.white;
  int _selectedIndex = 0;

  _selectDifficulty(String s) {
    setState(() {
      _filter = s;
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> colorWidget() {
      List<Widget> allWidgets = new List<Widget>();

      for (int i = 0; i < lstColor.length; i++) {
        allWidgets.add(new GestureDetector(
          onTap: () {
            setState(() {
              _color = lstColor[i];
            });
          },
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lstColor[i],
            ),
          ),
        ));
        allWidgets.add(Spacer());
      }
      return allWidgets;
    }

    return Scaffold(
      body: _selectedIndex==0?
      Column(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(

                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Bed \nRoom',
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            lstColor.length.toString()+" lights",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: 5,
                            height: 40,
                          ),
                          Stack(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: animationDuration,
                                width: 200,
                                height: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _color.withAlpha(alpha),
                                ),
                              ),
                              ClipPath(
                                clipper: LightTrapezoid(),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 200,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 16.0,
                  spacing: 16.0,
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    ActionChip(
                      label: Text("Main Light"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.lightbulb_outline,
                          color: _filter == "Main Light"
                              ? inactiveChipColor
                              : activeChipColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: _filter == "Main Light"
                              ? inactiveChipColor
                              : activeChipColor),
                      backgroundColor: _filter == "Main Light"
                          ? activeChipColor
                          : inactiveChipColor,
                      onPressed: () => _selectDifficulty("Main Light"),
                    ),
                    ActionChip(
                      label: Text("Desk Light"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.brightness_3,
                          color: _filter == "Desk Light"
                              ? inactiveChipColor
                              : activeChipColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: _filter == "Desk Light"
                              ? inactiveChipColor
                              : activeChipColor),
                      backgroundColor: _filter == "Desk Light"
                          ? activeChipColor
                          : inactiveChipColor,
                      onPressed: () => _selectDifficulty("Desk Light"),
                    ),
                    ActionChip(
                      label: Text("Bed"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.airline_seat_flat,
                          color: _filter == "Bed"
                              ? inactiveChipColor
                              : activeChipColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                          color: _filter == "Bed"
                              ? inactiveChipColor
                              : activeChipColor),
                      backgroundColor: _filter == "Bed"
                          ? activeChipColor
                          : inactiveChipColor,
                      onPressed: () => _selectDifficulty("Bed"),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Intensity",
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.lightbulb_outline,
                            ),
                          ),
                          Expanded(
                            child: Slider.adaptive(
                              value: brightness.toDouble(),
                              activeColor: _color,
                              onChanged: (newValue) {
                                setState(() {
                                  brightness = newValue.toInt();
                                  print(brightness);

                                  alpha = 255 - ((10 - brightness) * 25);
                                });
                              },
                              min: 0,
                              max: 9,
                              divisions: 10,
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.lightbulb_outline,
                              color: _color.withAlpha(alpha),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Colors: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: colorWidget(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Scenes: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Spacer(),
                            Chip(
                              label: Text("Birthday"),
                              padding: EdgeInsets.all(15),
                              avatar: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.deepOrange,
                            ),
                            Spacer(),
                            Chip(
                              label: Text(" Party      "),
                              padding: EdgeInsets.all(15),
                              avatar: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.purple,
                            ),
                            Spacer(),
                          ]),
                      SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Spacer(),
                            Chip(
                              label: Text("Relax    "),
                              padding: EdgeInsets.all(15),
                              avatar: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            Spacer(),
                            Chip(
                              label: Text(" Fun       "),
                              padding: EdgeInsets.all(15),
                              avatar: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.green,
                            ),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ):Center(child: Text("Index"+(_selectedIndex+1).toString())),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("ds"),
            icon: Icon(Icons.lightbulb_outline,

            color: Colors.lightBlue,),
          ),
          BottomNavigationBarItem(
            title: Text("ds"),
            icon: Icon(Icons.home,color: Colors.lightBlue,),
          ),
          BottomNavigationBarItem(
            title: Text("ds"),

            icon: Icon(Icons.settings,color: Colors.lightBlue,),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
