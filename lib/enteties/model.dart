
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final int userId;
  final String title;

  const TaskEntity({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  String getTitle() {
    return title.toUpperCase();
  }

  @override
  List<Object?> get props => [id, title, userId];
}
