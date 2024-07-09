import 'package:co_workit/controllers/mailing_controller.dart';
import 'package:co_workit/models/mailing_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class MailingScreen extends StatelessWidget {
  final MailingController mailingController = Get.put(MailingController());

  MailingScreen({Key? key}) : super(key: key);

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
                  return MailingDialog(mailingController: mailingController);
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<MailingController>(
          builder: (controller) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 100),
                      Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 160),
                      Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 160),
                      Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 600,
                      child: ListView.builder(
                        itemCount: controller.mailings.length,
                        itemBuilder: (context, index) {
                          MailingModel mailing = controller.mailings[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(child: Text(mailing.name)),
                                    Expanded(child: Text(mailing.date)),
                                    SizedBox(width: 70,),
                                    Expanded(child: Text(mailing.price)),
                             
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return MailingDialog(
                                                    mailingController: mailingController,
                                                    mailing: mailing,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              mailingController.deleteMailing(mailing.id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MailingDialog extends StatefulWidget {
  final MailingController mailingController;
  final MailingModel? mailing;

  MailingDialog({required this.mailingController, this.mailing});

  @override
  _MailingDialogState createState() => _MailingDialogState();
}

class _MailingDialogState extends State<MailingDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.mailing?.name ?? '');
    _priceController =
        TextEditingController(text: widget.mailing?.price ?? '');
    if (widget.mailing != null) {
      _dateTime = DateTime.parse(widget.mailing!.date);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.mailing == null ? 'Add Mailing' : 'Update Mailing'),
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
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Price';
                    }
                    return null;
                  },
                ),
              ],
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
            if (_formKey.currentState?.validate() ?? false) {
              if (widget.mailing == null) {
                widget.mailingController.addMailing(
                  MailingModel(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: _nameController.text,
                    date: _dateTime.toIso8601String(),
                    price: _priceController.text,
                  ),
                );
              } else {
                widget.mailingController.updateMailing(
                  MailingModel(
                    id: widget.mailing!.id,
                    name: _nameController.text,
                    date: _dateTime.toIso8601String(),
                    price: _priceController.text,
                  ),
                );
              }
              Navigator.of(context).pop();
            }
          },
          child: Text(widget.mailing == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }
}
