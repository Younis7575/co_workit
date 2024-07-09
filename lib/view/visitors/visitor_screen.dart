
import 'package:co_workit/controllers/visitor_controller.dart';
import 'package:co_workit/models/visitor_model.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 

import 'package:co_workit/controllers/visitor_controller.dart';
import 'package:co_workit/models/visitor_model.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 

class VisitorScreen extends StatelessWidget {
  final VisitorController visitorController = Get.put(VisitorController());

  VisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return VisitorDialog(visitorController: visitorController);
                },
              );
            },
            icon: const Icon(Icons.add, color: Colors.red),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<VisitorController>(
          builder: (controller) => GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.visitors.length,
            itemBuilder: (context, index) {
              Visitor visitor = controller.visitors[index];
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Text("Visitor Name", style: TextStyle(fontWeight: FontWeight.bold)),
                         Text(visitor.name),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Text("Visitor CNIC", style: TextStyle(fontWeight: FontWeight.bold)),
                         Text(visitor.cnic),
                        ],
                      ), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           const Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                         Text(visitor.date),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return VisitorDialog(
                                    visitorController: visitorController,
                                    visitor: visitor,
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,color: Colors.red,),
                            onPressed: () {
                              visitorController.deleteVisitor(visitor.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class VisitorScreen extends StatelessWidget {
//   final VisitorController visitorController = Get.put(VisitorController());

//     VisitorScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return VisitorDialog(visitorController: visitorController);
//                 },
//               );
//             },
//             icon: const Icon(Icons.add, color: Colors.red),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: GetBuilder<VisitorController>(
//           builder: (controller) => SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
//                       SizedBox(width: 100),
//                       Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
//                       SizedBox(width: 120),
//                       Text('CNIC', style: TextStyle(fontWeight: FontWeight.bold)),
//                       SizedBox(width: 160),
//                       Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//                 const Divider(),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: SizedBox(
//                       width: 600,
//                       child: ListView.builder(
//                         itemCount: controller.visitors.length,
//                         itemBuilder: (context, index) {
//                           Visitor visitor = controller.visitors[index];
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Expanded(child: Text(visitor.name)),
//                                     Expanded(child: Text(visitor.date)),
//                                     Expanded(child: Text(visitor.cnic)),
//                                     Expanded(
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           IconButton(
//                                             icon: Icon(Icons.edit),
//                                             onPressed: () {
//                                               showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return VisitorDialog(
//                                                     visitorController: visitorController,
//                                                     visitor: visitor,
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                           ),
//                                           IconButton(
//                                             icon: Icon(Icons.delete),
//                                             onPressed: () {
//                                               visitorController.deleteVisitor(visitor.id);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





class VisitorDialog extends StatefulWidget {
  final VisitorController visitorController;
  final Visitor? visitor;

  VisitorDialog({required this.visitorController, this.visitor});

  @override
  _VisitorDialogState createState() => _VisitorDialogState();
}

class _VisitorDialogState extends State<VisitorDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _cnicController;
  late DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.visitor?.name?? '');
    _cnicController = TextEditingController(text: widget.visitor?.cnic?? '');
    if (widget.visitor!= null) {
      _dateTime = DateTime.parse(widget.visitor!.date);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cnicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.visitor == null? 'Add Visitor' : 'Update Visitor'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: _dateTime,
                      lastDate: DateTime(2100),
                    );
                    if (date!= null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_dateTime),
                      );
                      setState(() {
                        _dateTime = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time!.hour,
                          time.minute,
                        );
                      });
                    }
                  },
                  child: Text('Date and Time'),
                ),
                Text(_dateTime.toString()),
              ],
            ),
            TextFormField(
              controller: _cnicController,
              decoration: InputDecoration(labelText: 'CNIC'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a CNIC';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate()?? false) {
              if (widget.visitor == null) {
                widget.visitorController.addVisitor(
                  Visitor(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: _nameController.text,
                    date: _dateTime.toIso8601String(),
                    cnic: _cnicController.text,
                  ),
                );
              } else {
                widget.visitorController.updateVisitor(
                  widget.visitor!.copyWith(
                    name: _nameController.text,
                    date: _dateTime.toIso8601String(),
                    cnic: _cnicController.text,
                  ),
                );
              }
              Navigator.of(context).pop();
            }
          },
          child: Text(widget.visitor == null? 'Add' : 'Update'),
        ),
      ],
    );
  }
}