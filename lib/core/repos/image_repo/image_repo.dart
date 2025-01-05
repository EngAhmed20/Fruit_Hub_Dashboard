import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/failure.dart';
abstract class ImageRepo{
  Future<Either<Failure,String>> uploadImage(File image);
}