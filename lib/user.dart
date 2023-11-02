// ignore_for_file: constant_identifier_names, unnecessary_this

class UserData {
  String? name;
  late String phoneNumber;
  late Countries country;
}

extension CountriesNames on String {
  Countries? toCountry() {
    return Countries.values
        .where((element) => element.name.toLowerCase() == this.toLowerCase())
        .firstOrNull;
  }
}

enum Countries implements Comparable<Countries> {
  Afghanistan(
    name: 'Afghanistan',
    phoneCode: 93,
  ),
  Armenia(
    name: 'Armenia',
    phoneCode: 374,
  ),
  Austria(
    name: 'Austria',
    phoneCode: 43,
  ),
  Bermuda(
    name: 'Bermuda',
    phoneCode: 1441,
  ),
  Chad(
    name: 'Chad',
    phoneCode: 235,
  ),
  Comoros(
    name: 'Comoros',
    phoneCode: 269,
  ),
  Croatia(
    name: 'Croatia',
    phoneCode: 385,
  ),
  Cyprus(
    name: 'Cyprus',
    phoneCode: 357,
  ),
  El_Salvador(
    name: 'El_Salvador',
    phoneCode: 503,
  ),
  Eswatini(
    name: 'Eswatini',
    phoneCode: 268,
  ),
  Finland(
    name: 'Finland',
    phoneCode: 358,
  ),
  Gambia(
    name: 'Gambia',
    phoneCode: 220,
  ),
  Greenland(
    name: 'Greenland',
    phoneCode: 299,
  ),
  Guatemala(
    name: 'Guatemala',
    phoneCode: 502,
  ),
  Iceland(
    name: 'Iceland',
    phoneCode: 354,
  );

  const Countries({
    required this.name,
    required this.phoneCode,
  });
  final String name;
  final int phoneCode;

  @override
  int compareTo(Countries other) {
    return name.compareTo(other.name);
  }
}
