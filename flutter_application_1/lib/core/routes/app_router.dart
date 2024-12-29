
import 'package:flutter_application_1/features/home/presentation/views/home_view.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_application_1/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter_application_1/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/profile/presentation/views/edit_profile.dart';
import '../../features/profile/presentation/views/profile_view.dart';




final GoRouter router = GoRouter(routes:[
    GoRoute(
      path: "/",  
      builder: (context, state) => const SplashView(),
      ),

    GoRoute(
      path: "/onBoarding",  
      builder: (context, state) => const OnBoardingView(),
      ), 
    GoRoute(
      path: "/signUp",  
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
        ),
      ),
    GoRoute(
      path: "/signIn",  
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
        ),
      ),

    GoRoute(
      path: "/homeNavBar",  
      builder: (context, state) => const HomeNavBarWidget(),
      ),
    GoRoute(
      path: "/home",  
      builder: (context, state) => const HomeView(),
      ),
    GoRoute(
      path: "/editProfile",
      builder: (context, state) => const EditProfileView(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const ProfileView(),
    )
  ],

);