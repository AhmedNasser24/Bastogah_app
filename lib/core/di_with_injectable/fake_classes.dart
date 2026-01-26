import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:injectable/injectable.dart';

abstract class DataSource {}

@LazySingleton(as: DataSource)
class RemoteDataSource implements DataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSource(this.apiConsumer);
}

abstract class Repo {}

@LazySingleton(as: Repo)
class RepoImpl implements Repo {
  final DataSource dataSource;

  RepoImpl(this.dataSource);
}

@Injectable()
class Cubit {
  final Repo repo;

  Cubit(this.repo);
}
