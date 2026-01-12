import 'package:bastogah_app/features/user_feature/profile/data/model/profile_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/local_storage_data/local_storage_data.dart';
import '../../domain/repo/profile_repo.dart';
import '../data_source/profile_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource profileDataSource;
  ProfileRepoImpl({required this.profileDataSource});
  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      var body = await profileDataSource.getProfile();
      await _saveProfileDataLocally(body);
      return right(ProfileModel.fromJson(body));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure.defaultFailure(e.toString()));
    }
  }

  Future<void> _saveProfileDataLocally(Map<String, dynamic> body) async {
    LocalStorageData.setProfile(body);
  }
}
