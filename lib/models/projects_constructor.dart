class ProjectsProperties {
  final String projectID;
  final String projectName;
  final String projectDescription;
  final String projectStartDate;
  final String customerUID;
  final String status;
  final List employeesUID;
  ProjectsProperties({
    required this.projectID,
    required this.status,
    required this.projectName,
    required this.projectDescription,
    required this.projectStartDate,
    required this.customerUID,
    required this.employeesUID,
  });
}
