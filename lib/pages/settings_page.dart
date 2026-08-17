import 'package:flutter/material.dart';
import 'package:animesalt/utils/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.body,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: AppTheme.body,
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSectionTitle('Appearance'),
                    const SizedBox(height: 16),
                    _buildSettingsCard(
                      context,
                      icon: Icons.dark_mode_rounded,
                      title: 'Dark Mode',
                      subtitle: 'Currently enabled',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppTheme.primaryLight,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingsCard(
                      context,
                      icon: Icons.notifications_rounded,
                      title: 'Notifications',
                      subtitle: 'Get notified about new episodes',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppTheme.primaryLight,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Playback'),
                    const SizedBox(height: 16),
                    _buildSettingsCard(
                      context,
                      icon: Icons.play_circle_outline_rounded,
                      title: 'Auto Play Next',
                      subtitle: 'Automatically play next episode',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppTheme.primaryLight,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingsCard(
                      context,
                      icon: Icons.hd_rounded,
                      title: 'Video Quality',
                      subtitle: 'HD',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ),
                    const SizedBox(height: 32),
                    _buildSectionTitle('About'),
                    const SizedBox(height: 16),
                    _buildSettingsCard(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: 'App Version',
                      subtitle: '1.0.0',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingsCard(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      subtitle: 'View privacy policy',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primary, AppTheme.secondary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppTheme.primaryLight, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppTheme.text,
            fontSize: 12,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
