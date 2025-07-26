import 'package:equatable/equatable.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

// تعريف الحالة الأساسية (sealed class)
sealed class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object?> get props => [];
}

class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamSuccess extends ExamState {
 final String selectedRoute ;
  const ExamSuccess({
    required this.selectedRoute,
  });
}
