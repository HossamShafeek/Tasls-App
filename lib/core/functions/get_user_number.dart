int getUserNumber({required String userType}) {
  if (userType == 'admin') {
    return 0;
  } else if (userType == 'manager') {
    return 1;
  } else {
    return 2;
  }
}
