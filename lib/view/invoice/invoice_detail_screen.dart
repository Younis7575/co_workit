import 'package:co_workit/models/invoice_model.dart';
import 'package:flutter/material.dart';

class InvoiceDetailScreen extends StatelessWidget {
  final InvoiceModel invoice;

  InvoiceDetailScreen({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Invoice ID: ${invoice.id}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Issue Date: ${invoice.issueDate}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Due Date: ${invoice.dueDate}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Due Amount: ${invoice.dueAmount}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Status: ${invoice.status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            // Add more detailed view here if needed, like the image shown
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Invoice #', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 40),
                          Text('Products', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 70),
                          Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 90),
                          Text('Rate', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 50),
                          Text('Discount', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 60),
                          Text('Tax', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 40),
                                Text(invoice.detailId.toString()),
                                SizedBox(width: 60),
                                Text(invoice.product),
                                SizedBox(width: 60),
                                Text(invoice.quantity),
                                SizedBox(width: 80),
                                Text(invoice.rate),
                                SizedBox(width: 70),
                                Text(invoice.discount),
                                SizedBox(width: 60),
                                Text(invoice.tax),
                                SizedBox(width: 60),
                                Text(invoice.description),
                                SizedBox(width: 60),
                                Text(invoice.price), 
                                SizedBox(width: 20),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
