class User {
  final String imagePath;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String mrn;
  final String about;
  final String dob;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.gender,
    required this.phone,
    required this.mrn,
    required this.dob,
    required this.isDarkMode,
  });
}
