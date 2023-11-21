
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomePage();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           name: RouteConstant.details,
//           builder: (BuildContext context, GoRouterState state) {
//             return const DetailPage();
//           },
//         ),
//         GoRoute(
//           path: 'chat',
//           name: RouteConstant.chat,
//           builder: (BuildContext context, GoRouterState state) {
//             return const ChatPage();
//           },
//         ),
//         GoRoute(
//           path: 'profile/:name',
//           name: RouteConstant.profile,
//           builder: (BuildContext context, GoRouterState state) {
//             // final String? name = state.pathParameters['name'];
//             return ProfilePage(
//               name: state.pathParameters['name']!,
//             );
//           },
//         ),
//         GoRoute(
//           path: 'info',
//           name: RouteConstant.info,
//           builder: (BuildContext context, GoRouterState state) {
//             return const ChatPage();
//           },
//         ),
//       ],
//     ),
//   ],
// );


// class RouteConstant{

// }

// later on work
