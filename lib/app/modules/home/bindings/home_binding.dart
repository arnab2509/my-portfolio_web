import 'package:get/get.dart';
import 'package:portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio_web/app/modules/home/controllers/contact_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Clear any existing instances first
    Get.delete<HomeController>(force: true);
    Get.delete<ContactController>(force: true);
    
    // Initialize controllers
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
    
    Get.put<ContactController>(
      ContactController(),
      permanent: true,
    );
  }
} 