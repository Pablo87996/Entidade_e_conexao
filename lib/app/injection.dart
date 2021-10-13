import 'package:get_it/get_it.dart';
import 'package:primeiro_app/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:primeiro_app/app/domain/interfaces/contact_dao.dart';
import 'package:primeiro_app/app/domain/services/contact_service.dart';

setupinjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}