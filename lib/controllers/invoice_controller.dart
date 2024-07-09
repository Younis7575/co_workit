// import 'package:co_workit/models/invoice_model.dart';
// import 'package:get/get.dart';

// class InvoiceController extends GetxController {
//   List<InvoiceModel> invoices = [
//     InvoiceModel(
//       id: 00001,
//       issueDate: '2023-01-01',
//       dueDate: '2023-02-01',
//       dueAmount: '100.00',
//       status: 'Unpaid',
//     ),
//     InvoiceModel(
//       id: 00002,
//       issueDate: '2023-03-01',
//       dueDate: '2023-04-01',
//       dueAmount: '200.00',
//       status: 'Paid',
//     ),
//     InvoiceModel(
//       id: 00003,
//       issueDate: '2023-03-01',
//       dueDate: '2023-04-01',
//       dueAmount: '200.00',
//       status: 'Paid',

//     ),
//     InvoiceModel(
//       id: 0005,
//       issueDate: '2023-03-01',
//       dueDate: '2023-04-01',
//       dueAmount: '200.00',
//       status: 'Paid',
//     ),
//     InvoiceModel(
//       id: 00005,
//       issueDate: '2023-03-01',
//       dueDate: '2023-04-01',
//       dueAmount: '200.00',
//       status: 'Unpaid',
//     ),
//     // Add more sample data as needed
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     update();
//   }
// }

import 'package:co_workit/models/invoice_model.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  List<InvoiceModel> invoices = [
    InvoiceModel(
      id: 00001,
      issueDate: '2023-01-01',
      dueDate: '2023-02-01',
      dueAmount: '100.00',
      status: 'Unpaid',

      // product Summary
      detailId: 1,
      product: 'space 2',
      quantity: '1',
      rate: 'Rs25,000.00',
      discount: 'Rs0.00',
      tax: '20% (10%)	Rs2,500.00',
      description: 'Bulk invoice generate',
      price: 'Rs27,500.00',
    ),
    InvoiceModel(
      id: 00002,
      issueDate: '2023-03-01',
      dueDate: '2023-04-01',
      dueAmount: '200.00',
      status: 'Paid',
       // product Summary
      detailId: 2,
      product: 'Services',
      quantity: '1',
      rate: 'Rs25,000.00',
      discount: 'Rs0.00',
      tax: '20% (10%)	Rs2,500.00',
      description: 'Bulk invoice generate',
      price: 'Rs2,504.40',
    ),
    InvoiceModel(
      id: 00003,
      issueDate: '2023-03-01',
      dueDate: '2023-04-01',
      dueAmount: '200.00',
      status: 'Paid',
       // product Summary
      detailId: 3,
      product: 'Security Deposit',
      quantity: '1',
      rate: 'Rs25,000.00',
      discount: 'Rs0.00',
      tax: '20% (10%)	Rs2,500.00',
      description: 'Bulk invoice generate',
      price: 'Rs27,500.00',
    ),
    InvoiceModel(
      id: 0004,
      issueDate: '2023-03-01',
      dueDate: '2023-04-01',
      dueAmount: '200.00',
      status: 'Paid',
       // product Summary
      detailId: 4,
      product: 'space 2',
      quantity: '1',
      rate: 'Rs25,000.00',
      discount: 'Rs0.00',
      tax: '20% (10%)	Rs2,500.00',
      description: 'Bulk invoice generate',
      price: 'Rs27,500.00',
    ),
    InvoiceModel(
      id: 00005,
      issueDate: '2023-03-01',
      dueDate: '2023-04-01',
      dueAmount: '200.00',
      status: 'Unpaid',
       // product Summary
      detailId: 5,
      product: 'space 2',
      quantity: '1',
      rate: 'Rs25,000.00',
      discount: 'Rs0.00',
      tax: '20% (10%)	Rs2,500.00',
      description: 'Bulk invoice generate',
      price: 'Rs27,500.00',
    ),
    // Add more sample data as needed
  ];

  @override
  void onInit() {
    super.onInit();
    update();
  }
}
