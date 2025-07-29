// user = buyer : by default
enum UserRoles {
  superAdmin,
  organizationAdmin,
  supervisor,
  manager,
  client,
  staff
  ;

  static UserRoles toUserRole(String str) {
    return UserRoles.values.firstWhere((element) => element.name == str);
  }
}
