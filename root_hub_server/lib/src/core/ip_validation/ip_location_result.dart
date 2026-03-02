class IpLocationResult {
  const IpLocationResult({
    required this.ipAddress,
    this.countryCode,
    this.countryName,
    this.city,
    this.isFallback = false,
  });

  final String ipAddress;
  final String? countryCode;
  final String? countryName;
  final String? city;
  final bool isFallback;

  bool get hasLocation =>
      (countryCode?.isNotEmpty ?? false) ||
      (countryName?.isNotEmpty ?? false) ||
      (city?.isNotEmpty ?? false);

  factory IpLocationResult.unknown({required String ipAddress}) {
    return IpLocationResult(
      ipAddress: ipAddress,
      isFallback: true,
    );
  }
}
