class TaskModel {
  final String dateRange;
  final String priority;
  final String title;
  final String description;
  final String assignedTo;
  final String contact;

  TaskModel({
    required this.dateRange,
    required this.priority,
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.contact,
  });
}
