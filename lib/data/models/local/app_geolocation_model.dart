class AppLocationModel {
  final double lat;
  final double long;

  const AppLocationModel({
    required this.lat,
    required this.long,
  });
}

class SaratovLocation extends AppLocationModel {
  const SaratovLocation({
    super.lat = 51.5406,
    super.long = 46.0086,
  });
}
