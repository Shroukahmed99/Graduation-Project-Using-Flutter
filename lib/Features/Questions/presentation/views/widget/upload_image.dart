import 'package:flutter/material.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/const.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
    required this.cubit,
  });

  final InsertDataCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cubit.pickCVFile,
      child: Center(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 320,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: cubit.selectedFile == null
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload, size: 50, color: kPrimaryColor),
                      SizedBox(height: 10),
                      Text(
                        "Certificate or Medical license",
                        style: TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                    ],
                  )
                : Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          cubit.selectedFile!,
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.red),
                        onPressed: () {
                          cubit.selectedFile = null;
                          cubit.emit(InsertDataLoaded()); // تحديث الواجهة
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
