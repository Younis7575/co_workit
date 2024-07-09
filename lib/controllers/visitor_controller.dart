

import 'package:co_workit/models/visitor_model.dart';
import 'package:get/get.dart';

class VisitorController extends GetxController {
  var visitors = <Visitor>[].obs;

  @override
  void onInit() {
    fetchVisitors();
    super.onInit();
  }

  void fetchVisitors() {
    // Dummy data for demonstration
    List<Map<String, dynamic>> dummyData = [
      {
        'id': 1,
        'name': 'John Doe',
        'date': '2024-07-06',
        'cnic': '12345-6789012-3',
      },
      {
        'id': 2,
        'name': 'Jane Smith',
        'date': '2024-07-05',
        'cnic': '98765-4321098-7',
      },
      {
        'id': 3,
        'name': 'Alice Brown',
        'date': '2024-07-04',
        'cnic': '24680-1357924-6',
      },
    ];

    List<Visitor> tempList = dummyData.map((json) => Visitor.fromJson(json)).toList();
    visitors.assignAll(tempList);
  }

  void addVisitor(Visitor visitor) {
    visitors.add(visitor);
    update();
  }

  void deleteVisitor(int id) {
    visitors.removeWhere((visitor) => visitor.id == id);
    update();
  }

  void updateVisitor(Visitor updatedVisitor) {
    int index = visitors.indexWhere((visitor) => visitor.id == updatedVisitor.id);
    if (index != -1) {
      visitors[index] = updatedVisitor;
      update();
    }
  }
}
