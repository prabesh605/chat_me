import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_chat_me/core/theme.dart';
import 'package:new_chat_me/features/auth/data/repositories/auth_repository_impl.dart';

import 'package:new_chat_me/features/auth/domain/usecases/login_usecase.dart';
import 'package:new_chat_me/features/auth/domain/usecases/register_usecase.dart';
import 'package:new_chat_me/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:new_chat_me/features/auth/presentation/pages/login_page.dart';

import 'package:new_chat_me/features/auth/presentation/pages/register_page.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';

void main() {
  final authRepository =
      AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
  runApp(
    MyApp(
      authRepository: authRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            registerUseCase: RegisterUseCase(repository: authRepository),
            loginUseCase: LoginUseCase(repository: authRepository),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const RegisterPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage()
        },
      ),
    );
  }
}
