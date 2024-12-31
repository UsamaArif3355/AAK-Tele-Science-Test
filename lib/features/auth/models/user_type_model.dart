class UserTypeModel {
  final String title;
  final String subTitle;
  final String key;

  UserTypeModel(
      {required this.title, required this.subTitle, required this.key});
}

final List<UserTypeModel> userTypes = [
  UserTypeModel(
      title: 'Researcher',
      subTitle: 'Personal account to manage all your activities.',
      key: 'researcher'),
  UserTypeModel(
      title: 'Institution',
      subTitle: 'Own or belongs to a company, this is for you.',
      key: 'institution_staff'),
  UserTypeModel(
      title: 'Venture capitalist / Accredited Investor',
      subTitle: 'Own or belongs to a company, this is for you.',
      key: 'investor'),
  UserTypeModel(
      title: 'Service Provider',
      subTitle: 'Own or belongs to a company, this is for you.',
      key: 'service_provider'),
];
