import 'package:zoomable_screen/core/models/models.dart';
import 'package:zoomable_screen/core/viewmodels/floorplan_model.dart';
import 'package:zoomable_screen/view/shared/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final model = Provider.of<FloorPlanModel>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        int currentTile = index + 1;
        List<Light> tileLights =
            model.lights.where((item) => item.tile == currentTile).toList();

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Global.blue,
              child: Image.asset(
                'images/tile_0$currentTile.png',
              ),
            ),
            model.isScaled
                ? Stack(
                    children: List.generate(
                      tileLights.length,
                      (idx) {
                        return Transform.translate(
                          offset: Offset(
                            size.width * tileLights[idx].position[0],
                            size.width * tileLights[idx].position[1],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Table 1'),
                                        content: Text('This is Table 1.'),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: tileLights[idx].status
                                      ? Colors.greenAccent
                                      : Colors.white,
                                  radius: 5.0,
                                  child: Center(
                                    child: Icon(
                                      Icons.lightbulb_outline,
                                      color: Global.blue,
                                      size: 7,
                                    ),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.identity()..translate(18.0),
                                child: Text(
                                  tileLights[idx].name,
                                  style: TextStyle(
                                    fontSize: 6.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      '${tileLights.length}',
                      style: TextStyle(
                        color: Global.blue,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
