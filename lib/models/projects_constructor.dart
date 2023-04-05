class ProjectsProperties {
  ProjectsProperties({
    required this.projectName,
    required this.projectDescription,
    required this.projectStartDate,
    required this.customerUID,
    required this.employeesUID,
  });

  final String projectName;
  final String projectDescription;
  final String projectStartDate;
  final String customerUID;
  final List<String> employeesUID;
}
