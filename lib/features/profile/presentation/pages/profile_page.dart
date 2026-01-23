
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
           clipBehavior: Clip.none,
            
            children: [
              Container(
                height: 200,
               
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ECommerceAppTheme.secondary,
                    ECommerceAppTheme.accent,
                  ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                bottom: -25,
                right: 0,
                left: 0,
                child: Container(
                  height: 100,
                  width:200,
                  decoration: BoxDecoration(
                    color: ECommerceAppTheme.surface,
                    borderRadius: BorderRadius.circular(ECommerceAppTheme.radiusMd)
                  ),
                ),
                )
              // Positioned(
              //   bottom: 0,
              //   left: 16,
              //   child: CircleAvatar(
              //     radius: 50,
              //     backgroundColor: Colors.white,
              //     child: CircleAvatar(
              //       radius: 46,
              //       backgroundImage: NetworkImage(
              //           'https://wallpapers.com/images/hd/pretty-profile-pictures-k1qebyviiyl0wx0x.jpg'),
              //     ),
              //   ),
              // ),
              //),
            ],
          ),
          
        ],
      ),
    );
  }
}