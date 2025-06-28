import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/const.dart';

class UploadImage extends StatelessWidget {
  final InsertDataCubit cubit;
  final String? initialImageUrl;

  const UploadImage({
    Key? key,
    required this.cubit,
    this.initialImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cubit.pickCVFile,
      child: Center(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 320.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    // إذا كان يوجد صورة تم اختيارها من الجهاز
    if (cubit.selectedFile != null) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.file(
              cubit.selectedFile!,
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.red, size: 24.sp),
            onPressed: () {
              cubit.selectedFile = null;
              cubit.emit(InsertDataLoaded());
            },
          ),
        ],
      );
    } 
    // إذا كان يوجد رابط للصورة من الإنترنت
    else if (initialImageUrl != null && initialImageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.network(
          initialImageUrl!,
          width: double.infinity,
          height: 150.h,
          fit: BoxFit.cover,
        ),
      );
    } 
    // إذا لم يكن هناك أي صورة تم تحميلها أو رابط
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload, size: 50.sp, color: kPrimaryColor),
          SizedBox(height: 10.h),
          Text(
            "Certificate or Medical license",
            style: TextStyle(fontSize: 16.sp, color: kPrimaryColor),
          ),
        ],
      );
    }
  }
}
