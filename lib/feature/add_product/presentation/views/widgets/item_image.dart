import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/utilis/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemImage extends StatefulWidget {
  const ItemImage({super.key, required this.onFileChanged});
  final ValueChanged<File?>onFileChanged;

  @override
  State<ItemImage> createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  bool isLoading=false;
   File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: ()async{
          isLoading=true;
          setState(() {

          });
          await pickImage();
          isLoading=false;
          setState(() {

          });

        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:fileImage!=null?ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(fileImage!)): const Icon(
                Icons.image_outlined,color: AppColors.primaryColor,
            
                size: 100,
              ),
            ),
            Visibility(
              visible: fileImage!=null,
              child: IconButton(onPressed: (){
                fileImage=null;
                widget.onFileChanged(fileImage);
                setState(() {
                });

              }, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
       try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      fileImage= File(image!.path);
      widget.onFileChanged(fileImage);
    } on Exception catch (e) {
      // TODO
    }
  }
}
