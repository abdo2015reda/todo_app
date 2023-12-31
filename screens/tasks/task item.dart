import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/Edit_screen.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';
import 'package:todo/shared/style/colors/app_color.dart';

class Task_item extends StatelessWidget {
  Task_model task_model;

  Task_item(this.task_model);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 2, top: 6, right: 10, left: 10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Slidable(
        startActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              Firebase_function.deleteData(task_model.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, Edit_screen.routeName);
            },
            backgroundColor: primarycolor,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: AppLocalizations.of(context)!.edit,
          ),
        ]),
        child: Container(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  color: Colors.blue,
                  height: 60,
                  width: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(task_model.tittle),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                        color: task_model.isdond ? Colors.green : Colors.blue,
                        borderRadius: BorderRadius.circular(7)),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
