import 'package:flutter/material.dart';
import 'package:launch_ele/add_device_info.dart';
import 'package:launch_ele/adding_nodes.dart';

class DiviceIdList extends StatelessWidget {
  const DiviceIdList({
    super.key,
    required this.devidList,
    required this.deviList,
    required this.widget,
  });

  final List devidList;
  final List deviList;
  final AddingNodes widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: devidList.length.compareTo(0),
      // scanedDivice == null ? 00 : scanedDivice!.length,
      itemBuilder: (context, index) {
        return SizedBox(
            height: 50,
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(150),
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: [
                for (String i in deviList)
                  TableRow(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            i,
                            // scanedDivice!.split(" ")[index],
                            // scanedDivice == null
                            //     ? "Loading...."
                            //     : scanedDivice!.split(',')[index],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddDeviceInfo(
                                              snapDeviceId:
                                                  widget.scanedDevice)));
                            },
                            icon: const Icon(
                              Icons.linked_camera_rounded,
                              size: 30,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ]),
              ],
            ));
      },
    );
  }
}
