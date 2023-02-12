
import 'package:flutter/material.dart';

import 'package:routemaster/routemaster.dart';
import 'package:share_ideas/features/community/screens/add_mods_screen.dart';
import 'package:share_ideas/features/community/screens/community_screen.dart';
import 'package:share_ideas/features/community/screens/create-community_screen.dart';
import 'package:share_ideas/features/community/screens/edit_community_screen.dart';
import 'package:share_ideas/features/community/screens/mod_tools_screen.dart';
import 'package:share_ideas/features/home/screens/home_screen.dart';
import 'package:share_ideas/features/post/screens/add_post_screen.dart';
import 'package:share_ideas/features/post/screens/add_post_type_screen.dart';
import 'package:share_ideas/features/post/screens/comment_screen.dart';
import 'package:share_ideas/features/user_profile/screen/edit_user_profile_screen.dart';
import 'package:share_ideas/features/user_profile/screen/user_profie_screen.dart';

import 'features/auth/screen/login_screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community': (_) => const MaterialPage(child: CreateCommunityScreen()),
    '/i/:name': (route) => MaterialPage(
      child: CommunityScreen(
        name: route.pathParameters['name']!,
      ),
    ),
    '/mod-tools/:name': (routeData) => MaterialPage(
      child: ModToolsScreen(
        name: routeData.pathParameters['name']!,
      ),
    ),
    '/edit-community/:name': (routeData) => MaterialPage(
      child: EditCommunityScreen(
        name: routeData.pathParameters['name']!,
      ),
    ),
    '/add-mods/:name': (routeData) => MaterialPage(
      child: AddModsScreen(
        name: routeData.pathParameters['name']!,
      ),
    ),
    '/u/:uid': (routeData) => MaterialPage(
      child: UserProfileScreen(
        uid: routeData.pathParameters['uid']!,
      ),
    ),
    '/edit-profile/:uid': (routeData) => MaterialPage(
      child: EditProfileScreen(
        uid: routeData.pathParameters['uid']!,
      ),
    ),
    '/add-post/:type': (routeData) => MaterialPage(
      child: AddPostTypeScreen(
        type: routeData.pathParameters['type']!,
      ),
    ),
    '/post/:postId/comments': (route) => MaterialPage(
      child: CommentsScreen(
        postId: route.pathParameters['postId']!,
      ),
    ),
    '/add-post': (routeData) => const MaterialPage(
      child: AddPostScreen(),
    ),
  },
);