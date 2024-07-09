import 'package:co_workit/models/mailing_model.dart';
import 'package:get/get.dart'; 

class MailingController extends GetxController {
  var mailings = <MailingModel>[
    MailingModel(
      id: 1,
      name: 'John Doe',
      date: '2024-07-08T12:00:00Z',
      price: '250',
    ),
    MailingModel(
      id: 2,
      name: 'Jane Smith',
      date: '2024-07-07T15:30:00Z',
      price: '725',
    ),
    MailingModel(
      id: 3,
      name: 'John Cane',
      date: '2024-07-08T12:00:00Z',
      price: '240',
    ),
  ].obs;

  void addMailing(MailingModel mailing) {
    mailings.add(mailing);
  }

  void updateMailing(MailingModel updatedMailing) {
    var index = mailings.indexWhere((m) => m.id == updatedMailing.id);
    if (index != -1) {
      mailings[index] = updatedMailing;
    }
  }

  void deleteMailing(int id) {
    mailings.removeWhere((mailing) => mailing.id == id);
  }
}
