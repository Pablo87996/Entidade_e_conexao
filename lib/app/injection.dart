import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:primeiro_app/app/database/firestore/contact_DAO_firestore.dart';
import 'package:primeiro_app/app/domain/interfaces/contact_dao.dart';
import 'package:primeiro_app/app/domain/services/contact_service.dart';

setupinjection()async{
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<ContactDAO>(ContactDAOFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}