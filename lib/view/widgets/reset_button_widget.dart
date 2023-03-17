import 'package:zoomable_screen/core/viewmodels/floorplan_model.dart';
import 'package:zoomable_screen/view/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetButtonWidget extends StatelessWidget {
  const ResetButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<FloorPlanModel>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            model.reset();
          },
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          label: Text(
            'Reset',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 10.0,
            primary: Colors.blue,
          ),
        ),
      ),
    );
  }
}
