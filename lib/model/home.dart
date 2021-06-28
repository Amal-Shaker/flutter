import 'package:flutter/material.dart';

Widget rowScroller({String imagepath, String produectName}) {
  return Container(
    width: 200,
    height: 200,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(25)),
    child: Center(
      child: Text(
        produectName,
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ),
  );
}

// ignore: must_be_immutable
class ColumnScallor extends StatefulWidget {
  String price;
  String imagepath;
  String produectName;
  static List<String> ll = [];
  ColumnScallor({this.imagepath, this.price, this.produectName});
  @override
  _ColumnScallorState createState() => _ColumnScallorState();
}

class _ColumnScallorState extends State<ColumnScallor> {
  Color favColor;
  @override
  void initState() {
    super.initState();
    ColumnScallor.ll = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          color: Colors.blueAccent[100]),
      child: ListTile(
        subtitle: Text('${widget.price} \$'),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(widget.imagepath),
        ),
        title: Text(widget.produectName),
        trailing: IconButton(
            icon: Icon(
              Icons.favorite,
              color: favColor,
            ),
            onPressed: () {
              setState(() {
                favColor = Colors.red;
                ColumnScallor.ll.add(widget.imagepath);
              });
            }),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  rowScroller(
                      imagepath: 'assets/images/image1.jpg',
                      produectName: 'Produect 1'),
                  rowScroller(
                      imagepath: 'assets/images/image2.jpg',
                      produectName: 'Produect 2'),
                  rowScroller(
                      imagepath: 'assets/images/image3.jpg',
                      produectName: 'Produect 3'),
                ],
              ),
            )),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                ColumnScallor(
                    imagepath: 'assets/images/image1.jpg',
                    produectName: 'produect 1',
                    price: '200'),
                ColumnScallor(
                    imagepath: 'assets/images/image2.jpg',
                    produectName: 'produect 2',
                    price: '530'),
                ColumnScallor(
                    imagepath: 'assets/images/image3.jpg',
                    produectName: 'produect 3',
                    price: '3000')
              ],
            ))
      ],
    );
  }
}

class Faviorte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: ColumnScallor.ll.map((e) {
          return rowFav(imagepath: e);
        }).toList(),
        // children: [
        //   Container(
        //     child: Image.asset('assets/images/image1.jpg'),
        //   ),
        //   Container(
        //     child: Image.asset('assets/images/image2.jpg'),
        //   ),
        //   Container(
        //     child: Image.asset('assets/images/image3.jpg'),
        //   )
        // ],
      ),
    );
  }
}

Widget rowFav({String imagepath}) {
  return Container(
    width: 200,
    height: 200,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(25)),
    child: Center(
      child: Text('fa'),
    ),
  );
}
