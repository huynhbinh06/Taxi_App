import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_location_black.png"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_close.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        "230 Phan Văn Hân, phường 17, quận Bình Thạnh",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff323643),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_location_blue.png"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_close.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        "99 Phan Văn Hân, phường 17, quận Bình Thạnh",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff323643),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
