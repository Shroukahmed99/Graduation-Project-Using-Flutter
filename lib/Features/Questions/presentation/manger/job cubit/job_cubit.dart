import 'package:bloc/bloc.dart';
 part 'job_state.dart'; // تأكد من استيراد JobState هنا


class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial()); 
  void selectJob(String job) {
    emit(JobSelected(selectedJob: job)); 
  }
}
