String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r'^[\w-\.]+@gmail\.com$').hasMatch(value)) {
    return 'Please enter a valid email ending with @gmail.com';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  if (!RegExp(r'^\d{11}$').hasMatch(value)) {
    return 'Phone number must be exactly 11 digits';
  }
  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full name is required';
  }
  if (!value.contains(' ')) {
    return 'Please enter at least first and last name';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Age is required';
  }
  final intValue = int.tryParse(value);
  if (intValue == null) {
    return 'Please enter a valid number';
  }
  if (intValue <= 0 || intValue > 120) {
    return 'Please enter a valid age between 1 and 120';
  }
  return null;
}

String? validateWeight(String? value) {
  if (value == null || value.isEmpty) {
    return 'Weight is required';
  }
  final doubleValue = double.tryParse(value);
  if (doubleValue == null) {
    return 'Please enter a valid number';
  }
  if (doubleValue <= 0 || doubleValue > 500) {
    return 'Please enter a weight between 1 and 500 kg';
  }
  return null;
}

String? validateHeight(String? value) {
  if (value == null || value.isEmpty) {
    return 'Height is required';
  }
  final doubleValue = double.tryParse(value);
  if (doubleValue == null) {
    return 'Please enter a valid number';
  }
  if (doubleValue < 30 || doubleValue > 300) {
    return 'Please enter a height between 30 and 300 cm';
  }
  return null;
}
