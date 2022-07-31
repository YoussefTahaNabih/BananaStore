import 'package:app/data/network/failure.dart';
import 'package:app/domain/repository/repository.dart';
import 'package:app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgetPassUseCase implements BaseUseCase<String, String> {
  final Repository _reposotpry;
  ForgetPassUseCase(this._reposotpry);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _reposotpry.forgotPassword(input);
  }
}
