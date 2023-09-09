import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  Rx<Position?> currentLocation = Rx<Position?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
  }

  void fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLocation.value = position;
    } catch (e) {
      // Handle location fetch errors here.
    print('Error fetching location: $e');
    }
  }
}
