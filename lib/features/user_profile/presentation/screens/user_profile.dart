import 'package:flutter/widgets.dart';
import 'package:login/features/user_profile/presentation/screens/widgets/user_profile_view_body.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  static const routeName = "userprofile";
  @override
  Widget build(BuildContext context) {
    return const UserProfileViewBody();
  }
}

