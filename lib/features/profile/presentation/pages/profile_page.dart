import 'package:e_commerce/core/providers/setting_provider.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,

                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Shahanda Ashraf",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "shahanda@example.com",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _ProfileOption(
              title: "My Orders",
              icon: Icons.shopping_bag_outlined,
              onTap: () {},
              surfaceColor: ECommerceAppTheme.surface,
            ),
            _ProfileOption(
              title: "Shipping Address",
              icon: Icons.location_on_outlined,
              onTap: () {},
              surfaceColor: ECommerceAppTheme.surface,
            ),
            _ProfileOption(
              title: "Settings",
              icon: Icons.settings_outlined,
              onTap: () {},
              surfaceColor: ECommerceAppTheme.surface,
            ),

            const SizedBox(height: 20),

            _ProfileOption(
              title: "Log Out",
              icon: Icons.logout,
              isDestructive: true,
              onTap: () {},
              surfaceColor: ECommerceAppTheme.surface,
            ),

            _ProfileOption(
  title: "Language: ${Localizations.localeOf(context).languageCode == 'en' ? 'English' : 'العربية'}",
  icon: Icons.language,
  surfaceColor: ECommerceAppTheme.surface,
  onTap: () {
    
    final provider = Provider.of<SettingsProvider>(context, listen: false);
    if (provider.locale.languageCode == 'en') {
      provider.changeLanguage('ar');
    } else {
      provider.changeLanguage('en');
    }
  },
),


_ProfileOption(
  title: "Dark Mode",
  icon: Icons.dark_mode,
  surfaceColor: ECommerceAppTheme.surface,
  onTap: () {
    final provider = Provider.of<SettingsProvider>(context, listen: false);
    
    bool isCurrentlyDark = provider.themeMode == ThemeMode.dark;
    provider.toggleTheme(!isCurrentlyDark);
  },
),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;
  final Color surfaceColor;

  const _ProfileOption({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.surfaceColor,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isDestructive
                ? ECommerceAppTheme.error.withValues(alpha: 0.1)
                : ECommerceAppTheme.accent.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isDestructive
                ? ECommerceAppTheme.error
                : ECommerceAppTheme.accent,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}









//////////////////////
/**
 * 
 * Column(
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

                  CircleAvatar(
                  radius: 50,
                   backgroundColor: Colors.white,
                   child: CircleAvatar(
                     radius: 46,
                     backgroundImage: NetworkImage(
                         'https://wallpapers.com/images/hd/pretty-profile-pictures-k1qebyviiyl0wx0x.jpg'),
                   ),
                 ),
               ),
            ],
          ),
          
        ],
      ),
 */