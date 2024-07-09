import 'package:co_workit/controllers/invoice_controller.dart';
import 'package:co_workit/models/invoice_model.dart';
import 'package:co_workit/view/invoice/invoice_detail_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceScreen extends StatelessWidget {
  final InvoiceController invoiceController = Get.put(InvoiceController());

  InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<InvoiceController>(
          builder: (controller) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Invoice Id',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 40),
                      Text('Issue Date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 70),
                      Text('Due Date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 90),
                      Text('Due Amount',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 50),
                      Text('Status',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 60),
                      Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 700,
                      child: ListView.builder(
                        itemCount: controller.invoices.length,
                        itemBuilder: (context, index) {
                          InvoiceModel invoice = controller.invoices[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                     const SizedBox(width: 40),
                                      Text(invoice.id.toString()),
                                     const SizedBox(width: 60),
                                      Text(invoice.issueDate),
                                     const SizedBox(width: 60),
                                      Text(invoice.dueDate),
                                      const SizedBox(width: 80),
                                      Text(invoice.dueAmount), 
                                     const SizedBox(width: 70),
                                      Text(invoice.status), 
                                    const  SizedBox(width: 60),
                                      IconButton(onPressed: ()
                                      { 
                                          Get.to(() => InvoiceDetailScreen(invoice: controller.invoices[index]));
                                      }, icon: const Icon(Icons.remove_red_eye)),
                                     const SizedBox(width: 20),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
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
