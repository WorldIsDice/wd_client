import 'package:flutter/material.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/theme/theme.dart';

class UserProfile extends StatefulWidget {
  UserProfile({
    required this.navigationservice,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationservice;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Bye",
                      style: Theme.of(context).appTheme.fontStyle.hero,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
