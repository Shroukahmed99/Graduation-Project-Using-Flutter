import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart'; // تأكد من استيراد CacheHelper

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  void selectJob(String job) async {
    await CacheHelper.saveData(key: 'job', value: job); // حفظ الوظيفة باستخدام key "job"
    emit(JobSelected(selectedJob: job));
  }

  Future<void> loadSelectedJob() async {
    String? savedJob = await CacheHelper.getData(key: 'job'); // استرجاع الوظيفة باستخدام نفس key
    if (savedJob != null) {
      emit(JobSelected(selectedJob: savedJob));
    }
  }
}
