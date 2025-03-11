part of 'job_cubit.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobSelected extends JobState {
  final String selectedJob;

  JobSelected({required this.selectedJob});
}
