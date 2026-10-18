import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/localization.dart';
import '../../core/theme.dart';
import '../../core/feature_registry.dart';
import '../features/feature_pages.dart';
import 'tabs/jobs_tab.dart';
import 'tabs/log_waste_tab.dart';
import 'tabs/earnings_tab.dart';
import 'more_features_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<AppLocalization>(context);

    final List<Widget> tabs = [
      _buildHomeTab(loc),
      const JobsTab(),
      const LogWasteTab(),
      const EarningsTab(),
      const MoreFeaturesScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.eco, size: 20, color: AppTheme.onPrimaryContainer),
            ),
            const SizedBox(width: 10),
            Text(loc.tr('app_title'), style: GoogleFonts.plusJakartaSans(
                fontSize: 20, fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate, color: AppTheme.primary),
            onPressed: () => loc.toggleLanguage(),
            tooltip: loc.tr('toggle_lang'),
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, color: AppTheme.onSurfaceVariant),
                Positioned(right: 0, top: 0, child: Container(
                  width: 8, height: 8,
                  decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
                )),
              ],
            ),
            onPressed: () => _openFeature(context, 'announcements', loc),
          ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppTheme.surfaceContainerLow,
          border: Border(top: BorderSide(color: AppTheme.outlineVariant, width: 0.3)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            _buildNavItem(Icons.home_rounded, Icons.home_outlined, loc.tr('nav_home')),
            _buildNavItem(Icons.work_rounded, Icons.work_outline, loc.tr('nav_jobs')),
            _buildNavItem(Icons.recycling_rounded, Icons.recycling_outlined, loc.tr('nav_log')),
            _buildNavItem(Icons.account_balance_wallet_rounded, Icons.account_balance_wallet_outlined, loc.tr('nav_earnings')),
            _buildNavItem(Icons.grid_view_rounded, Icons.grid_view, loc.tr('nav_more')),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData active, IconData inactive, String label) {
    return BottomNavigationBarItem(icon: Icon(inactive), activeIcon: Icon(active), label: label);
  }

  Widget _buildHomeTab(AppLocalization loc) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── HERO EARNINGS BANNER ───
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppTheme.heroGradient,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(color: AppTheme.primary.withAlpha(40), blurRadius: 30, offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withAlpha(100), width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF006D40),
                        child: Icon(Icons.person, size: 28, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${loc.tr('greeting')}, Ram Kumar 👋',
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                          Text('Zone: Andheri East • ${loc.tr('shift_roster')}',
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12, color: Colors.white.withAlpha(180))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(25),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(loc.tr('today_earnings'),
                                style: GoogleFonts.plusJakartaSans(fontSize: 11, color: Colors.white.withAlpha(180))),
                            const SizedBox(height: 4),
                            Text('₹450', style: GoogleFonts.plusJakartaSans(
                                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(25),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(loc.tr('monthly_total'),
                                style: GoogleFonts.plusJakartaSans(fontSize: 11, color: Colors.white.withAlpha(180))),
                            const SizedBox(height: 4),
                            Text('₹12,450', style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ─── QUICK ACTIONS ───
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Text(loc.tr('quick_actions'),
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 0.82,
              ),
              itemCount: FeatureRegistry.quickActions.length,
              itemBuilder: (context, index) {
                final f = FeatureRegistry.quickActions[index];
                return _buildQuickAction(context, f, loc);
              },
            ),
          ),

          const SizedBox(height: 20),

          // ─── SOS EMERGENCY ───
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => _openFeature(context, 'sos_alert', loc),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppTheme.sosDanger.withAlpha(15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.sosDanger.withAlpha(50)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: AppTheme.dangerGradient,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: AppTheme.sosDanger.withAlpha(40), blurRadius: 12)],
                      ),
                      child: const Icon(Icons.emergency, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(loc.tr('sos_alert'),
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.error)),
                          Text('Volume Down 3x for instant SOS',
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12, color: AppTheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.error.withAlpha(150), size: 18),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ─── LIVE STATUS ───
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: AppTheme.glassCard(opacity: 0.1, radius: 20),
              child: Row(
                children: [
                  _buildStatusChip('🟢', 'GPS Active', AppTheme.primary),
                  const SizedBox(width: 12),
                  _buildStatusChip('📡', 'Online', AppTheme.secondary),
                  const SizedBox(width: 12),
                  _buildStatusChip('🔋', '85%', AppTheme.earningGold),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ─── RECENT ACTIVITY ───
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text('Recent Activity',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),
          _buildActivityItem(Icons.check_circle_rounded, 'Street Sweep Completed', 'Sector 5 - MG Road', '2h ago', AppTheme.primary),
          _buildActivityItem(Icons.recycling_rounded, 'Logged 15kg Dry Waste', 'Grade B • +₹30 bonus', '3h ago', AppTheme.secondary),
          _buildActivityItem(Icons.fingerprint, 'Punched In at 8:00 AM', 'Andheri East Ward Office', 'Today', AppTheme.earningGold),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, FeatureItem f, AppLocalization loc) {
    return InkWell(
      onTap: () => _openFeature(context, f.key, loc),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: f.color.withAlpha(25),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: f.color.withAlpha(40)),
            ),
            child: Icon(f.icon, color: f.color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(loc.tr(f.key),
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 11, fontWeight: FontWeight.w600, color: AppTheme.onSurfaceVariant),
              textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String emoji, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Flexible(child: Text(label, style: GoogleFonts.plusJakartaSans(
                fontSize: 12, fontWeight: FontWeight.w600, color: color),
                overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String title, String subtitle, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppTheme.glassCard(opacity: 0.08, radius: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.onSurface)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: GoogleFonts.plusJakartaSans(
                      fontSize: 12, color: AppTheme.onSurfaceVariant)),
                ],
              ),
            ),
            Text(time, style: GoogleFonts.plusJakartaSans(
                fontSize: 11, color: AppTheme.outline)),
          ],
        ),
      ),
    );
  }

  void _openFeature(BuildContext context, String key, AppLocalization loc) {
    final page = FeaturePages.getPage(key, loc);
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}
