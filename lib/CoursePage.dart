import 'package:flutter/material.dart';
class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String chosenImg;
  String chosenTitle;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xffe1eaff),
          ),
          child: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2657ce),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$chosenTitle', style: TextStyle(
              color: Color(0xff2657ce),
              fontSize: 27,
            ),),
            Text('Sarah Parknson', style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 20
            ),),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xffff5954),
              ),
              child: Hero(
                tag: '$chosenImg',
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage('assets/image/$chosenImg.png'),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Course', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffd3defa),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 35,
                        child: IconButton(
                          icon: Icon(
                            Icons.timer,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text("3 Hours, 20 Min", style: TextStyle(
                        color: Colors.black.withOpacity(0.7)
                      ),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    productListing('Introduction', 'Introduction of the course', 'active'),
                    productListing('Language of Color', 'Learn about the language of..', 'inactive'),
                    productListing('Psychology of Color', 'Learn about the psychology of..', 'inactive'),
                    productListing('Language of Color', 'Learn about the language of..', 'inactive')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Column productListing(String title, String info, String activeOrInactive)
  {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Container(
              width: 50,
                height: 50,
              decoration: BoxDecoration(
                color: (activeOrInactive == 'active') ? Color(0xff2657ce) : Color(0xffd3defa),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: (activeOrInactive == 'active') ? Colors.white : Color(0xff2657ce),
                ),
              ),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title', style: TextStyle(
                  fontSize: 20,
                ),),
                Text('$info', style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),)
              ],
            )
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width*0.85,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
