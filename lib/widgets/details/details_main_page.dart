import 'package:flutter/material.dart';
import 'package:hotel_app/data/imageList.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:provider/provider.dart';

class DetailsMainPage extends StatefulWidget {
  const DetailsMainPage({Key? key}) : super(key: key);

  @override
  State<DetailsMainPage> createState() => _DetailsMainPageState();
}

class _DetailsMainPageState extends State<DetailsMainPage> {
  final List<dynamic> _images = [];

  String? _imageIndex;

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)!.settings.arguments as SelectedData;
    final _roomsData = Provider.of<RoomProvider>(context)
        .roomList
        .where((element) => element.roomId == _args.detailsRoomId);
    _roomsData.forEach((element) {
      for (var item in element.imageList) {
        _images.add(item);
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF8F51),
        title: Text(
          'Room Details',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.9,
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ..._images.map((imagelink) {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _imageIndex = imagelink;
                                    });
                                  },
                                  child: Image(
                                      width: 90,
                                      image: NetworkImage(imagelink)),
                                ),
                              );
                            }).toList()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Image(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: 300,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            _imageIndex == null ? _images[0] : _imageIndex),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Color(0xFF8394FF),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '4.8/5',
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _roomsData.first.title,
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Bed : ${_roomsData.first.bed}'),
                    ),
                    ListTile(
                      title: Text('Window : ${_roomsData.first.windows}'),
                    ),
                    ListTile(
                      title:
                          Text('Floor Style : ${_roomsData.first.floorStyle}'),
                    ),
                    ListTile(
                      title: Text('Table : ${_roomsData.first.withTable}'),
                    ),
                    ListTile(
                      title: Text('A C : ${_roomsData.first.ac}'),
                    ),
                    ListTile(
                      title: Text('Balcony : ${_roomsData.first.balcony}'),
                    ),
                    ListTile(
                      title: Text('Room Size : ${_roomsData.first.size}'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(140, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0))),
                  child: Text(
                    'BOOKING',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed('/checkout');
                    Navigator.pushNamed(context, '/checkout',
                        arguments: SelectedData(roomId: _args.detailsRoomId));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
