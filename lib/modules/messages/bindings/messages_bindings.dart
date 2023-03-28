import '../../../utils/exports.dart';

class MessagesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MessagesController(), tag: (MessagesPage).toString());
  }
}