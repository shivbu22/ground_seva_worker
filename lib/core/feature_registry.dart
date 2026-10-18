import 'package:flutter/material.dart';
import 'theme.dart';

class FeatureItem {
  final String key;
  final IconData icon;
  final Color color;

  const FeatureItem({required this.key, required this.icon, required this.color});
}

class FeatureRegistry {
  // ─── QUICK ACTIONS (Dashboard 2x4 Grid) ───
  static const List<FeatureItem> quickActions = [
    FeatureItem(key: 'attendance', icon: Icons.fingerprint, color: AppTheme.primary),
    FeatureItem(key: 'daily_tasks', icon: Icons.task_alt, color: AppTheme.secondary),
    FeatureItem(key: 'route_nav', icon: Icons.map, color: AppTheme.infoBlue),
    FeatureItem(key: 'weather', icon: Icons.wb_sunny, color: AppTheme.earningGold),
    FeatureItem(key: 'leaderboard', icon: Icons.emoji_events, color: AppTheme.earningGold),
    FeatureItem(key: 'eco_score', icon: Icons.eco, color: AppTheme.primary),
    FeatureItem(key: 'wallet', icon: Icons.account_balance_wallet, color: AppTheme.tertiary),
    FeatureItem(key: 'settings', icon: Icons.settings, color: AppTheme.onSurfaceVariant),
  ];

  // ─── ALL FEATURES BY CATEGORY ───
  static const Map<String, List<FeatureItem>> categories = {
    'Operations & Duty / संचालन': [
      FeatureItem(key: 'attendance', icon: Icons.fingerprint, color: AppTheme.primary),
      FeatureItem(key: 'shift_roster', icon: Icons.calendar_month, color: AppTheme.infoBlue),
      FeatureItem(key: 'route_nav', icon: Icons.map, color: AppTheme.infoBlue),
      FeatureItem(key: 'gps_tracking', icon: Icons.gps_fixed, color: AppTheme.primary),
      FeatureItem(key: 'daily_tasks', icon: Icons.task_alt, color: AppTheme.secondary),
      FeatureItem(key: 'supervisor_chat', icon: Icons.chat, color: AppTheme.infoBlue),
      FeatureItem(key: 'work_log', icon: Icons.history, color: AppTheme.secondary),
      FeatureItem(key: 'leave_apply', icon: Icons.event_busy, color: AppTheme.earningGold),
      FeatureItem(key: 'zone_map', icon: Icons.map_outlined, color: AppTheme.tertiary),
    ],

    'Finance & Benefits / वित्त': [
      FeatureItem(key: 'salary_slip', icon: Icons.receipt_long, color: AppTheme.earningGold),
      FeatureItem(key: 'pf_esi', icon: Icons.security, color: AppTheme.infoBlue),
      FeatureItem(key: 'wallet', icon: Icons.account_balance_wallet, color: AppTheme.earningGold),
      FeatureItem(key: 'bonus_tracker', icon: Icons.trending_up, color: AppTheme.earningGold),
      FeatureItem(key: 'loan_advance', icon: Icons.monetization_on, color: AppTheme.earningGold),
      FeatureItem(key: 'tax_help', icon: Icons.calculate, color: AppTheme.secondary),
      FeatureItem(key: 'insurance', icon: Icons.health_and_safety, color: AppTheme.primary),
      FeatureItem(key: 'overtime_log', icon: Icons.more_time, color: AppTheme.earningGold),
    ],

    'Health & Safety / स्वास्थ्य': [
      FeatureItem(key: 'health_tips', icon: Icons.favorite, color: AppTheme.error),
      FeatureItem(key: 'sick_leave', icon: Icons.medical_services, color: AppTheme.error),
      FeatureItem(key: 'safety_gear', icon: Icons.shield, color: AppTheme.earningGold),
      FeatureItem(key: 'sos_alert', icon: Icons.emergency, color: Color(0xFFDC2626)),
      FeatureItem(key: 'mental_health', icon: Icons.psychology, color: AppTheme.tertiary),
      FeatureItem(key: 'vaccination', icon: Icons.vaccines, color: AppTheme.infoBlue),
      FeatureItem(key: 'training_cert', icon: Icons.school, color: AppTheme.earningGold),
      FeatureItem(key: 'emergency_contacts', icon: Icons.contact_phone, color: Color(0xFFDC2626)),
    ],

    'Waste Management / कचरा': [
      FeatureItem(key: 'smart_bin', icon: Icons.delete_outline, color: AppTheme.primary),
      FeatureItem(key: 'complaints', icon: Icons.report, color: AppTheme.error),
      FeatureItem(key: 'before_after', icon: Icons.compare, color: AppTheme.secondary),
      FeatureItem(key: 'scrap_market', icon: Icons.store, color: AppTheme.earningGold),
      FeatureItem(key: 'recycling_center', icon: Icons.recycling, color: AppTheme.primary),
      FeatureItem(key: 'hazard_report', icon: Icons.dangerous, color: Color(0xFFDC2626)),
      FeatureItem(key: 'eco_score', icon: Icons.eco, color: AppTheme.primary),
      FeatureItem(key: 'carbon_footprint', icon: Icons.co2, color: AppTheme.primary),
    ],

    'Community & ID / समुदाय': [
      FeatureItem(key: 'id_card', icon: Icons.badge, color: AppTheme.primary),
      FeatureItem(key: 'forum', icon: Icons.forum, color: AppTheme.infoBlue),
      FeatureItem(key: 'peer_chat', icon: Icons.groups, color: AppTheme.secondary),
      FeatureItem(key: 'announcements', icon: Icons.campaign, color: AppTheme.earningGold),
      FeatureItem(key: 'leaderboard', icon: Icons.emoji_events, color: AppTheme.earningGold),
      FeatureItem(key: 'referral', icon: Icons.share, color: AppTheme.primary),
      FeatureItem(key: 'feedback', icon: Icons.rate_review, color: AppTheme.secondary),
      FeatureItem(key: 'family_benefits', icon: Icons.family_restroom, color: AppTheme.primary),
      FeatureItem(key: 'achievements', icon: Icons.military_tech, color: AppTheme.earningGold),
    ],

    'Utility & Tools / उपयोगिता': [
      FeatureItem(key: 'weather', icon: Icons.wb_sunny, color: AppTheme.earningGold),
      FeatureItem(key: 'night_mode', icon: Icons.dark_mode, color: AppTheme.secondary),
      FeatureItem(key: 'documents', icon: Icons.folder, color: AppTheme.infoBlue),
      FeatureItem(key: 'quiz', icon: Icons.quiz, color: AppTheme.earningGold),
      FeatureItem(key: 'helpline', icon: Icons.phone, color: AppTheme.infoBlue),
      FeatureItem(key: 'settings', icon: Icons.settings, color: AppTheme.onSurfaceVariant),
      FeatureItem(key: 'notification_center', icon: Icons.notifications, color: AppTheme.earningGold),
      FeatureItem(key: 'qr_scanner', icon: Icons.qr_code_scanner, color: AppTheme.primary),
      FeatureItem(key: 'area_cleaning_status', icon: Icons.cleaning_services, color: AppTheme.primary),
      FeatureItem(key: 'toilet_locator', icon: Icons.wc, color: AppTheme.infoBlue),
      FeatureItem(key: 'water_station', icon: Icons.water, color: AppTheme.infoBlue),
      FeatureItem(key: 'rest_zone', icon: Icons.airline_seat_recline_normal, color: AppTheme.tertiary),
      FeatureItem(key: 'about', icon: Icons.info, color: AppTheme.primary),
    ],

    'Growth & Career / विकास': [
      FeatureItem(key: 'performance_review', icon: Icons.analytics, color: AppTheme.primary),
      FeatureItem(key: 'digital_library', icon: Icons.local_library, color: AppTheme.infoBlue),
      FeatureItem(key: 'skill_upgrade', icon: Icons.school, color: AppTheme.primary),
      FeatureItem(key: 'grievance', icon: Icons.gavel, color: AppTheme.error),
      FeatureItem(key: 'geo_fence', icon: Icons.fence, color: AppTheme.primary),
      FeatureItem(key: 'report_issue', icon: Icons.report_problem, color: AppTheme.earningGold),
      FeatureItem(key: 'uniform_request', icon: Icons.checkroom, color: AppTheme.infoBlue),
      FeatureItem(key: 'vehicle_check', icon: Icons.local_shipping, color: AppTheme.earningGold),
    ],
  };

  // Flat list of all features
  static List<FeatureItem> get allFeatures {
    return categories.values.expand((list) => list).toList();
  }
}
