import 'package:buzzly/pages/home_page.dart';
import 'package:buzzly/pages/profile_page.dart';
import 'package:buzzly/pages/users_page.dart';
import 'package:buzzly/services/auth/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Notifies when auth state changes so GoRouter re-runs redirect after login/logout.
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((_) => notifyListeners());
  }
}

final _authRefresh = _AuthRefreshNotifier();

final GoRouter router = GoRouter(
  refreshListenable: _authRefresh,
  initialLocation: '/',
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isOnLogin = state.matchedLocation == '/login';

    if (!isLoggedIn && !isOnLogin) return '/login';
    if (isLoggedIn && isOnLogin) return '/';
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginOrRegisterPage(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/users', builder: (context, state) => const UsersPage()),
  ],
);
