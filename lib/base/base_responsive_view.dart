import '../utils/exports.dart';

abstract class BaseGetResponsiveView<T extends BaseGetxController> extends GetResponsiveView<T> {
  BaseGetResponsiveView({Key? key}) : super(key: key);

  Widget buildPhoneWidget();

  Widget buildTabletWidget();

  Widget buildDesktopWidget();

  String? getTag();

  @override
  T get controller {
    return Get.find<T>(tag: getTag());
  }

  void showLoader({required bool value}) {
    controller.showLoader(value: value);
  }

  void showSnackBar({required String value}) {
    controller.showSnackBar(value: value);
  }

  C getController<C extends GetxController>({String? tag}) {
    return Get.find<C>(tag: tag);
  }

  S getService<S extends GetxService>({String? tag}) {
    return Get.find<S>(tag: tag);
  }

  @override
  Widget desktop() {
    return buildDesktopWidget();
  }

  @override
  Widget phone() {
    return buildPhoneWidget();
  }

  @override
  Widget tablet() {
    return buildTabletWidget();
  }
}
