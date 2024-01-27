import 'package:get/get.dart';

class VehicleController extends GetxController {
  int page = 1;
  List vehicles = [
    {
      'name': 'Avanza',
      'number': 'G 123 H',
      'image':
          'https://imgcdn.oto.com/large/gallery/exterior/38/1654/toyota-avanza-front-angle-low-view-844132.jpg'
    },
    {
      'name': 'Xenia',
      'number': 'G 124 H',
      'image':
          'https://cdn.antaranews.com/cache/1200x800/2021/01/19/Xenia-sebagai-Sahabat-Keluarga-setia-menemani-masyarakat-Indonesia-seja.jpg'
    },
    {
      'name': 'Ayla',
      'number': 'G 125 H',
      'image':
          'https://imgcdn.oto.com/large/gallery/exterior/7/1731/daihatsu-ayla-front-angle-low-view-269225.jpg'
    },
    {
      'name': 'L300',
      'number': 'G 126 H',
      'image':
          'https://awsimages.detik.net.id/visual/2022/12/30/mitsubishi_169.jpeg?w=650'
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
