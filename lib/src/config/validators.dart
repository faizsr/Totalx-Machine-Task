String? validatePhone(String? value) {
  if (value!.isEmpty) {
    return null;
  }
  if (value.length < 10) {
    return 'Enter A Valid Phone Number';
  }
  return null;
}

String? validateName(String? value) {
  if (value!.length < 3) {
    return 'Enter A Valid Name';
  }
  return null;
}

String? validateAge(String? value) {
  if (value!.isEmpty) {
    return 'Required Field';
  }
  return null;
}
