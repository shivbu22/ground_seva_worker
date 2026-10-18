import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/localization.dart';
import '../../core/theme.dart';
import 'generic_feature_page.dart';

class FeaturePages {
  static Widget getPage(String key, AppLocalization loc) {
    switch (key) {
      // ═══════════════════════════════════════════
      // ─── OPERATIONS & DUTY ───
      // ═══════════════════════════════════════════
      case 'attendance':
        return GenericFeaturePage(
          title: loc.tr('attendance'), icon: Icons.fingerprint, color: AppTheme.primary,
          children: [
            InfoCard(title: 'Status: Off Duty', subtitle: 'Last active 8 hours ago', icon: Icons.circle, color: AppTheme.error),
            const InfoCard(title: 'Last Punch In', subtitle: '08:00 AM - Today', icon: Icons.access_time),
            const InfoCard(title: 'Hours Today', subtitle: '0h 0m — Daily target: 8h', icon: Icons.timer),
            const InfoCard(title: 'This Month', subtitle: '22 days present, 2 leave, 1 holiday', icon: Icons.calendar_month),
            const ActionButton(label: 'Punch In Now / पंच इन करें', icon: Icons.fingerprint),
            const ActionButton(label: 'View Attendance Log', icon: Icons.history, isPrimary: false),
          ],
        );

      case 'shift_roster':
        return GenericFeaturePage(
          title: loc.tr('shift_roster'), icon: Icons.calendar_month, color: AppTheme.infoBlue,
          children: [
            InfoCard(title: "Today's Shift", subtitle: 'Morning 6:00 AM - 2:00 PM', icon: Icons.wb_sunny, color: AppTheme.earningGold),
            const InfoCard(title: 'Tomorrow', subtitle: 'Morning 6:00 AM - 2:00 PM', icon: Icons.calendar_today),
            InfoCard(title: 'Zone', subtitle: 'Andheri East - Sector 5', icon: Icons.location_on, color: AppTheme.infoBlue),
            const SizedBox(height: 12),
            _sectionTitle('Weekly Schedule / साप्ताहिक'),
            ..._weeklySchedule(),
          ],
        );

      case 'route_nav':
        return GenericFeaturePage(
          title: loc.tr('route_nav'), icon: Icons.map, color: AppTheme.infoBlue,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            InfoCard(title: "Today's Route", subtitle: 'Andheri East → Jogeshwari', icon: Icons.route, color: AppTheme.infoBlue),
            const InfoCard(title: 'Distance', subtitle: '4.2 km remaining', icon: Icons.straighten),
            const InfoCard(title: 'Estimated Time', subtitle: '1h 30m', icon: Icons.schedule),
            const ActionButton(label: 'Start Navigation / नेविगेशन शुरू', icon: Icons.navigation),
          ],
        );

      case 'gps_tracking':
        return GenericFeaturePage(
          title: loc.tr('gps_tracking'), icon: Icons.gps_fixed, color: AppTheme.primary,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'GPS Status', subtitle: 'Active — High accuracy mode', icon: Icons.gps_fixed),
            const InfoCard(title: 'Current Location', subtitle: '19.1136° N, 72.8697° E', icon: Icons.location_on),
            const InfoCard(title: 'Distance Today', subtitle: '3.8 km covered', icon: Icons.directions_walk),
            const ActionButton(label: 'Share Live Location', icon: Icons.share_location),
          ],
        );

      case 'daily_tasks':
        return GenericFeaturePage(
          title: loc.tr('daily_tasks'), icon: Icons.task_alt, color: AppTheme.primary,
          children: [
            Row(children: [
              MetricCard(label: 'Completed', value: '5', icon: Icons.check_circle, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Pending', value: '3', icon: Icons.pending, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'Overdue', value: '1', icon: Icons.warning, color: AppTheme.error),
            ]),
            const SizedBox(height: 16),
            ..._taskList(),
          ],
        );

      case 'supervisor_chat':
        return GenericFeaturePage(
          title: loc.tr('supervisor_chat'), icon: Icons.chat, color: AppTheme.infoBlue,
          children: [
            InfoCard(title: 'Supervisor: Rajesh Sharma', subtitle: 'Ward Officer - Zone 5', icon: Icons.person, color: AppTheme.infoBlue),
            const InfoCard(title: 'Last Message', subtitle: '"Report to Gate 3 at 2PM"', icon: Icons.message),
            const SizedBox(height: 12),
            _chatBubble('Report to Gate 3 by 2PM', false),
            _chatBubble('On my way sir, will reach in 15 mins', true),
            _chatBubble('✅ Good. Complete drain cleaning also', false),
            const SizedBox(height: 16),
            const ActionButton(label: 'Send Message / संदेश भेजें', icon: Icons.send),
          ],
        );

      case 'work_log':
        return GenericFeaturePage(
          title: loc.tr('work_log'), icon: Icons.history, color: AppTheme.secondary,
          children: [
            _sectionTitle('Today\'s Log / आज का रिकॉर्ड'),
            InfoCard(title: 'Street Sweep — MG Road', subtitle: 'Completed at 9:30 AM', icon: Icons.cleaning_services, color: AppTheme.primary),
            InfoCard(title: 'Garbage Pickup — Market Area', subtitle: 'Completed at 11:00 AM', icon: Icons.delete_outline, color: AppTheme.earningGold),
            InfoCard(title: 'Drain Cleaning — Junction 3', subtitle: 'In Progress', icon: Icons.plumbing, color: AppTheme.infoBlue),
            const ActionButton(label: 'Download Report', icon: Icons.download, isPrimary: false),
          ],
        );

      case 'leave_apply':
        return GenericFeaturePage(
          title: loc.tr('leave_apply'), icon: Icons.event_busy, color: AppTheme.earningGold,
          children: [
            Row(children: [
              MetricCard(label: 'Casual Leave', value: '8', icon: Icons.beach_access, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Sick Leave', value: '5', icon: Icons.local_hospital, color: AppTheme.error),
              const SizedBox(width: 10),
              MetricCard(label: 'Earned', value: '3', icon: Icons.card_giftcard, color: AppTheme.earningGold),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Next Holiday', subtitle: 'Republic Day — Jan 26', icon: Icons.celebration),
            const ActionButton(label: 'Apply Leave / छुट्टी के लिए आवेदन', icon: Icons.add_circle),
          ],
        );

      case 'zone_map':
        return GenericFeaturePage(
          title: loc.tr('zone_map'), icon: Icons.map_outlined, color: AppTheme.tertiary,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'Assigned Zone', subtitle: 'Zone 5 — Andheri East', icon: Icons.location_on),
            const InfoCard(title: 'Coverage Area', subtitle: '2.4 sq km — 45% cleaned', icon: Icons.area_chart),
            const ActionButton(label: 'View Full Map / पूरा नक्शा', icon: Icons.fullscreen),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── FINANCE & BENEFITS ───
      // ═══════════════════════════════════════════
      case 'salary_slip':
        return GenericFeaturePage(
          title: loc.tr('salary_slip'), icon: Icons.receipt_long, color: AppTheme.earningGold,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: AppTheme.glowCard(color: AppTheme.earningGold),
              child: Column(
                children: [
                  Text('March 2025', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                  const SizedBox(height: 4),
                  Text('₹18,500', style: GoogleFonts.plusJakartaSans(fontSize: 40, fontWeight: FontWeight.w800, color: AppTheme.earningGold)),
                  Text('Net Salary / शुद्ध वेतन', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.onSurfaceVariant)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Basic: ₹12,000', subtitle: 'DA: ₹3,000 | HRA: ₹2,500', icon: Icons.account_balance),
            InfoCard(title: 'Deductions: ₹2,000', subtitle: 'PF: ₹1,200 | ESI: ₹800', icon: Icons.remove_circle, color: AppTheme.error),
            const InfoCard(title: 'Bonus: ₹3,000', subtitle: 'Waste collection + incentives', icon: Icons.star),
            const ActionButton(label: 'Download Salary Slip / वेतन पर्ची', icon: Icons.download),
          ],
        );

      case 'pf_esi':
        return GenericFeaturePage(
          title: loc.tr('pf_esi'), icon: Icons.security, color: AppTheme.infoBlue,
          children: [
            Row(children: [
              MetricCard(label: 'PF Balance', value: '₹45K', icon: Icons.savings, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'ESI Status', value: 'Active', icon: Icons.security, color: AppTheme.infoBlue),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'PF Account', subtitle: 'EPFO UAN: XXXX-XXXX-1234', icon: Icons.account_balance),
            const InfoCard(title: 'ESI Coverage', subtitle: 'Family covered — Valid till Dec 2025', icon: Icons.family_restroom),
            const ActionButton(label: 'View PF Passbook / PF पासबुक', icon: Icons.book),
          ],
        );

      case 'wallet':
        return GenericFeaturePage(
          title: loc.tr('wallet'), icon: Icons.account_balance_wallet, color: AppTheme.earningGold,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(gradient: AppTheme.heroGradient, borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(40), blurRadius: 24)]),
              child: Column(
                children: [
                  Text('Wallet Balance', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white.withAlpha(200))),
                  const SizedBox(height: 4),
                  Text('₹3,250', style: GoogleFonts.plusJakartaSans(fontSize: 42, fontWeight: FontWeight.w800, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'UPI ID', subtitle: 'ramkumar@paytm', icon: Icons.qr_code),
            const ActionButton(label: 'Withdraw to Bank / बैंक में निकालें', icon: Icons.account_balance),
            const ActionButton(label: 'Transaction History', icon: Icons.receipt_long, isPrimary: false),
          ],
        );

      case 'bonus_tracker':
        return GenericFeaturePage(
          title: loc.tr('bonus_tracker'), icon: Icons.trending_up, color: AppTheme.earningGold,
          children: [
            Row(children: [
              MetricCard(label: 'This Month', value: '₹2.4K', icon: Icons.currency_rupee, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'Rank', value: '#3', icon: Icons.emoji_events, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Waste Bonus', subtitle: '+₹800 from Grade A collections', icon: Icons.recycling),
            InfoCard(title: 'Attendance Bonus', subtitle: '+₹500 for 100% attendance', icon: Icons.calendar_month, color: AppTheme.earningGold),
            const InfoCard(title: 'Performance Bonus', subtitle: '+₹1,100 monthly incentive', icon: Icons.star),
          ],
        );

      case 'loan_advance':
        return GenericFeaturePage(
          title: loc.tr('loan_advance'), icon: Icons.monetization_on, color: AppTheme.earningGold,
          children: [
            const InfoCard(title: 'Advance Available', subtitle: 'Up to ₹10,000 salary advance', icon: Icons.account_balance),
            const InfoCard(title: 'Current Advance', subtitle: '₹0 — No pending advance', icon: Icons.check_circle),
            const InfoCard(title: 'Loan Status', subtitle: 'Eligible for ₹50,000 loan', icon: Icons.verified),
            const ActionButton(label: 'Apply for Advance / अग्रिम आवेदन', icon: Icons.send),
          ],
        );

      case 'tax_help':
        return GenericFeaturePage(
          title: loc.tr('tax_help'), icon: Icons.calculate, color: AppTheme.secondary,
          children: [
            Row(children: [
              MetricCard(label: 'FY Income', value: '₹2.2L', icon: Icons.currency_rupee, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'Tax Due', value: '₹0', icon: Icons.calculate, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Tax Bracket', subtitle: 'Below ₹2.5L — No tax applicable', icon: Icons.info),
            const InfoCard(title: 'Form 16', subtitle: 'Available for FY 2024-25', icon: Icons.description),
            const ActionButton(label: 'Download Form 16', icon: Icons.download, isPrimary: false),
          ],
        );

      case 'insurance':
        return GenericFeaturePage(
          title: loc.tr('insurance'), icon: Icons.health_and_safety, color: AppTheme.primary,
          children: [
            const InfoCard(title: 'Life Insurance', subtitle: '₹5,00,000 coverage — Active', icon: Icons.favorite),
            InfoCard(title: 'Health Insurance', subtitle: '₹2,00,000 family cover', icon: Icons.local_hospital, color: AppTheme.infoBlue),
            InfoCard(title: 'Accident Insurance', subtitle: '₹3,00,000 — WorkSafe policy', icon: Icons.shield, color: AppTheme.earningGold),
            const ActionButton(label: 'File Claim / दावा दर्ज करें', icon: Icons.upload_file),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── HEALTH & SAFETY ───
      // ═══════════════════════════════════════════
      case 'health_tips':
        return GenericFeaturePage(
          title: loc.tr('health_tips'), icon: Icons.favorite, color: AppTheme.error,
          children: [
            InfoCard(title: '💧 Stay Hydrated', subtitle: 'Drink 3-4 liters of water daily', icon: Icons.water_drop, color: AppTheme.infoBlue),
            const InfoCard(title: '🧤 Wear Gloves', subtitle: 'Always use protective gloves while handling waste', icon: Icons.health_and_safety),
            InfoCard(title: '☀️ Sun Protection', subtitle: 'Wear hat and apply sunscreen', icon: Icons.wb_sunny, color: AppTheme.earningGold),
            InfoCard(title: '🍎 Healthy Diet', subtitle: 'Eat iron-rich foods, fruits daily', icon: Icons.restaurant, color: AppTheme.primary),
          ],
        );

      case 'sick_leave':
        return GenericFeaturePage(
          title: loc.tr('sick_leave'), icon: Icons.medical_services, color: AppTheme.error,
          children: [
            Row(children: [
              MetricCard(label: 'Available', value: '5', icon: Icons.event_available, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Used', value: '2', icon: Icons.event_busy, color: AppTheme.error),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Last Sick Leave', subtitle: 'Feb 15 — Fever (1 day)', icon: Icons.calendar_today),
            const ActionButton(label: 'Apply Sick Leave / बीमार छुट्टी', icon: Icons.add_circle),
          ],
        );

      case 'safety_gear':
        return GenericFeaturePage(
          title: loc.tr('safety_gear'), icon: Icons.shield, color: AppTheme.earningGold,
          children: [
            _sectionTitle('Issued Equipment / जारी उपकरण'),
            const InfoCard(title: 'Gloves (2 pairs)', subtitle: 'Issued: Jan 15 — Replace by: Apr 15', icon: Icons.back_hand),
            InfoCard(title: 'Safety Shoes', subtitle: 'Issued: Dec 1 — Size: 9', icon: Icons.do_not_step, color: AppTheme.earningGold),
            InfoCard(title: 'Reflective Vest', subtitle: 'Issued: Jan 1', icon: Icons.visibility, color: AppTheme.infoBlue),
            InfoCard(title: 'Mask (N95, 5 pack)', subtitle: 'Issued: Mar 1 — 2 remaining', icon: Icons.masks, color: AppTheme.error),
            const ActionButton(label: 'Request Replacement / अनुरोध', icon: Icons.add_shopping_cart),
          ],
        );

      case 'sos_alert':
        return GenericFeaturePage(
          title: loc.tr('sos_alert'), icon: Icons.emergency, color: AppTheme.sosDanger,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(gradient: AppTheme.dangerGradient, borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: AppTheme.sosDanger.withAlpha(50), blurRadius: 24)]),
              child: Column(children: [
                const Icon(Icons.emergency, size: 56, color: Colors.white),
                const SizedBox(height: 12),
                Text('SOS EMERGENCY', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(height: 4),
                Text('Tap to alert supervisor & nearby workers', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: Colors.white70)),
              ]),
            ),
            const SizedBox(height: 16),
            InfoCard(title: 'Volume Down × 3', subtitle: 'Hardware SOS trigger', icon: Icons.volume_down, color: AppTheme.sosDanger),
            const InfoCard(title: 'Emergency Contacts', subtitle: 'Supervisor: +91 98765 43210', icon: Icons.phone),
            InfoCard(title: 'Nearest Hospital', subtitle: 'City Hospital — 1.2 km', icon: Icons.local_hospital, color: AppTheme.infoBlue),
            ActionButton(label: 'TRIGGER SOS / आपातकालीन', icon: Icons.warning, onTap: () {}),
          ],
        );

      case 'mental_health':
        return GenericFeaturePage(
          title: loc.tr('mental_health'), icon: Icons.psychology, color: AppTheme.tertiary,
          children: [
            InfoCard(title: '🧘 Daily Meditation', subtitle: '5-minute morning routine', icon: Icons.self_improvement, color: AppTheme.primary),
            InfoCard(title: '📞 Helpline', subtitle: 'iCall: 9152987821 (Free)', icon: Icons.phone, color: AppTheme.infoBlue),
            const InfoCard(title: '💭 Stress Management', subtitle: 'Deep breathing exercises & techniques', icon: Icons.air),
            const ActionButton(label: 'Talk to Counselor', icon: Icons.support_agent, isPrimary: false),
          ],
        );

      case 'vaccination':
        return GenericFeaturePage(
          title: loc.tr('vaccination'), icon: Icons.vaccines, color: AppTheme.infoBlue,
          children: [
            InfoCard(title: 'COVID-19', subtitle: '3 doses completed — Boostered ✓', icon: Icons.check_circle, color: AppTheme.primary),
            InfoCard(title: 'Tetanus', subtitle: 'Due in 6 months — Mar 2026', icon: Icons.schedule, color: AppTheme.earningGold),
            const InfoCard(title: 'Hepatitis B', subtitle: '3 doses completed ✓', icon: Icons.vaccines),
            const ActionButton(label: 'Book Vaccination / टीका बुक', icon: Icons.calendar_month),
          ],
        );

      case 'training_cert':
        return GenericFeaturePage(
          title: loc.tr('training_cert'), icon: Icons.school, color: AppTheme.earningGold,
          children: [
            InfoCard(title: 'Waste Segregation', subtitle: 'Completed — Certificate issued', icon: Icons.verified, color: AppTheme.primary),
            InfoCard(title: 'Safety Training', subtitle: 'Completed — Valid till Dec 2025', icon: Icons.shield, color: AppTheme.earningGold),
            const InfoCard(title: 'First Aid', subtitle: 'Upcoming — April 15, 2025', icon: Icons.medical_services),
            const ActionButton(label: 'Download Certificates', icon: Icons.download, isPrimary: false),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── WASTE MANAGEMENT ───
      // ═══════════════════════════════════════════
      case 'smart_bin':
        return GenericFeaturePage(
          title: loc.tr('smart_bin'), icon: Icons.delete_outline, color: AppTheme.primary,
          children: [
            Row(children: [
              MetricCard(label: 'Active Bins', value: '24', icon: Icons.delete_outline, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Full Bins', value: '3', icon: Icons.warning, color: AppTheme.error),
            ]),
            const SizedBox(height: 16),
            _mapPlaceholder(),
            const SizedBox(height: 16),
            InfoCard(title: 'Bin #12 — MG Road', subtitle: '90% full — Needs collection', icon: Icons.warning_amber, color: AppTheme.error),
            const InfoCard(title: 'Bin #7 — Park Lane', subtitle: '45% full — Normal', icon: Icons.check_circle),
            const ActionButton(label: 'View All Bins / सभी बिन', icon: Icons.list_alt),
          ],
        );

      case 'complaints':
        return GenericFeaturePage(
          title: loc.tr('complaints'), icon: Icons.report, color: AppTheme.error,
          children: [
            Row(children: [
              MetricCard(label: 'Open', value: '3', icon: Icons.warning, color: AppTheme.error),
              const SizedBox(width: 10),
              MetricCard(label: 'Resolved', value: '12', icon: Icons.check_circle, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            InfoCard(title: '#C-2045: Garbage overflow', subtitle: 'MG Road — Open since 2 days', icon: Icons.report, color: AppTheme.error),
            InfoCard(title: '#C-2044: Clogged drain', subtitle: 'Junction 3 — In Progress', icon: Icons.plumbing, color: AppTheme.earningGold),
            InfoCard(title: '#C-2042: Missed pickup', subtitle: 'Park Lane — Resolved ✓', icon: Icons.check, color: AppTheme.primary),
          ],
        );

      case 'before_after':
        return GenericFeaturePage(
          title: loc.tr('before_after'), icon: Icons.compare, color: AppTheme.secondary,
          children: [
            const InfoCard(title: 'Today\'s Reports', subtitle: '3 before/after submitted', icon: Icons.photo_library),
            Row(children: [
              Expanded(child: Container(height: 150, decoration: BoxDecoration(color: AppTheme.surfaceContainerHigh, borderRadius: BorderRadius.circular(16)),
                child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.photo_camera, color: AppTheme.outline, size: 32), Text('Before', style: TextStyle(color: AppTheme.outline))])))),
              const SizedBox(width: 12),
              Expanded(child: Container(height: 150, decoration: BoxDecoration(color: AppTheme.surfaceContainerHigh, borderRadius: BorderRadius.circular(16)),
                child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.photo_camera, color: AppTheme.primary, size: 32), Text('After', style: TextStyle(color: AppTheme.primary))])))),
            ]),
            const SizedBox(height: 16),
            const ActionButton(label: 'Submit New Report / रिपोर्ट जमा', icon: Icons.add_photo_alternate),
          ],
        );

      case 'scrap_market':
        return GenericFeaturePage(
          title: loc.tr('scrap_market'), icon: Icons.store, color: AppTheme.earningGold,
          children: [
            _sectionTitle('Today\'s Rates / आज के भाव'),
            InfoCard(title: 'Paper / Cardboard', subtitle: '₹12/kg', icon: Icons.description, color: AppTheme.earningGold),
            InfoCard(title: 'Plastic (PET)', subtitle: '₹15/kg', icon: Icons.shopping_bag, color: AppTheme.infoBlue),
            InfoCard(title: 'Iron/Metal', subtitle: '₹28/kg', icon: Icons.settings, color: AppTheme.onSurfaceVariant),
            InfoCard(title: 'Glass', subtitle: '₹5/kg', icon: Icons.local_drink, color: AppTheme.tertiary),
            const ActionButton(label: 'Find Nearest Dealer / डीलर खोजें', icon: Icons.location_on, isPrimary: false),
          ],
        );

      case 'recycling_center':
        return GenericFeaturePage(
          title: loc.tr('recycling_center'), icon: Icons.recycling, color: AppTheme.primary,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'Nearest Center', subtitle: 'GreenCycle Hub — 2.5 km', icon: Icons.recycling),
            const InfoCard(title: 'Operating Hours', subtitle: '8 AM - 6 PM — Open Now', icon: Icons.access_time),
            const ActionButton(label: 'Get Directions / रास्ता दिखाएं', icon: Icons.directions),
          ],
        );

      case 'hazard_report':
        return GenericFeaturePage(
          title: loc.tr('hazard_report'), icon: Icons.dangerous, color: AppTheme.sosDanger,
          children: [
            InfoCard(title: '⚠️ Chemical Waste Found', subtitle: 'Report immediately to supervisor', icon: Icons.dangerous, color: AppTheme.sosDanger),
            InfoCard(title: '🩺 Hospital Waste', subtitle: 'Do NOT handle — Call specialist team', icon: Icons.local_hospital, color: AppTheme.error),
            const InfoCard(title: 'Report Protocol', subtitle: 'Photo → GPS Tag → Notify → Wait', icon: Icons.list_alt),
            ActionButton(label: 'Report Hazard / खतरा रिपोर्ट', icon: Icons.report, onTap: () {}),
          ],
        );

      case 'eco_score':
        return GenericFeaturePage(
          title: loc.tr('eco_score'), icon: Icons.eco, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                Text('🌱 Eco Score', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 4),
                Text('92', style: GoogleFonts.plusJakartaSans(fontSize: 56, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                Text('Excellent! / उत्कृष्ट', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.secondary)),
              ]),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Waste Segregation', subtitle: '95% accuracy this month', icon: Icons.recycling),
            InfoCard(title: 'Route Efficiency', subtitle: '88% — Room to improve', icon: Icons.route, color: AppTheme.earningGold),
            const InfoCard(title: 'Attendance', subtitle: '100% — Perfect streak! 🔥', icon: Icons.calendar_month),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── COMMUNITY & ID ───
      // ═══════════════════════════════════════════
      case 'id_card':
        return GenericFeaturePage(
          title: loc.tr('id_card'), icon: Icons.badge, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                const CircleAvatar(radius: 40, backgroundColor: AppTheme.primaryContainer,
                    child: Icon(Icons.person, size: 48, color: AppTheme.onPrimaryContainer)),
                const SizedBox(height: 14),
                Text('Ram Kumar', style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppTheme.onSurface)),
                Text('ID: GS-2024-5678', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.primary)),
                const SizedBox(height: 8),
                const StatusBadge(label: 'Active Employee', color: AppTheme.primary, icon: Icons.verified),
              ]),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Department', subtitle: 'Solid Waste Management, Zone 5', icon: Icons.business),
            const InfoCard(title: 'Aadhar Linked', subtitle: 'XXXX-XXXX-1234', icon: Icons.credit_card),
            const ActionButton(label: 'Download ID Card / आई-कार्ड', icon: Icons.download),
          ],
        );

      case 'forum':
        return GenericFeaturePage(
          title: loc.tr('forum'), icon: Icons.forum, color: AppTheme.infoBlue,
          children: [
            const InfoCard(title: '🔥 Best route for monsoon?', subtitle: 'Rajesh • 12 replies • 2h ago', icon: Icons.forum),
            const InfoCard(title: 'New safety gear available', subtitle: 'Admin • 5 replies • Today', icon: Icons.announcement),
            const InfoCard(title: 'Tips for drain cleaning', subtitle: 'Suresh • 8 replies • Yesterday', icon: Icons.lightbulb),
            const ActionButton(label: 'New Post / नया पोस्ट', icon: Icons.add_circle),
          ],
        );

      case 'peer_chat':
        return GenericFeaturePage(
          title: loc.tr('peer_chat'), icon: Icons.groups, color: AppTheme.secondary,
          children: [
            const InfoCard(title: 'Zone 5 Workers Group', subtitle: '24 members online', icon: Icons.group),
            const InfoCard(title: 'Shift Partners', subtitle: 'Ram, Suresh, Priya — Active', icon: Icons.people),
            const ActionButton(label: 'Open Group Chat / ग्रुप चैट', icon: Icons.chat),
          ],
        );

      case 'announcements':
        return GenericFeaturePage(
          title: loc.tr('announcements'), icon: Icons.campaign, color: AppTheme.earningGold,
          children: [
            InfoCard(title: '📢 Holiday Notice', subtitle: 'Office closed on Republic Day, Jan 26', icon: Icons.event, color: AppTheme.earningGold),
            const InfoCard(title: '🎉 Best Worker Award', subtitle: 'Ram Kumar — March 2025 winner!', icon: Icons.emoji_events),
            InfoCard(title: '⚠️ Route Change', subtitle: 'MG Road construction — Use alternate route', icon: Icons.warning, color: AppTheme.error),
          ],
        );

      case 'leaderboard':
        return GenericFeaturePage(
          title: loc.tr('leaderboard'), icon: Icons.emoji_events, color: AppTheme.earningGold,
          children: [
            _sectionTitle('Top Workers This Month / महीने के टॉप'),
            _leaderRow('1', 'Suresh Patel', '₹3,200 bonus', AppTheme.earningGold),
            _leaderRow('2', 'Priya Sharma', '₹2,800 bonus', AppTheme.onSurfaceVariant),
            _leaderRow('3', 'Ram Kumar', '₹2,400 bonus', AppTheme.tertiary),
            _leaderRow('4', 'Anil Yadav', '₹1,900 bonus', AppTheme.outline),
            _leaderRow('5', 'Deepak Verma', '₹1,500 bonus', AppTheme.outline),
            const SizedBox(height: 16),
            const InfoCard(title: 'Your Rank', subtitle: '#3 — Keep going! 🔥', icon: Icons.trending_up),
          ],
        );

      case 'referral':
        return GenericFeaturePage(
          title: loc.tr('referral'), icon: Icons.share, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                Text('Your Referral Code', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Text('GS-RAM-2024', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                const SizedBox(height: 4),
                Text('Earn ₹500 per referral! / प्रति रेफरल ₹500', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: AppTheme.onSurfaceVariant)),
              ]),
            ),
            const SizedBox(height: 16),
            Row(children: [
              MetricCard(label: 'Referred', value: '3', icon: Icons.people, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Earned', value: '₹1.5K', icon: Icons.currency_rupee, color: AppTheme.earningGold),
            ]),
            const SizedBox(height: 16),
            const ActionButton(label: 'Share Code / कोड शेयर करें', icon: Icons.share),
          ],
        );

      case 'feedback':
        return GenericFeaturePage(
          title: loc.tr('feedback'), icon: Icons.rate_review, color: AppTheme.secondary,
          children: [
            const InfoCard(title: 'Rate Your Experience', subtitle: 'Help us improve the app', icon: Icons.star),
            const InfoCard(title: 'Report a Bug', subtitle: 'Found something broken? Tell us', icon: Icons.bug_report),
            const ActionButton(label: 'Submit Feedback / प्रतिक्रिया दें', icon: Icons.send),
          ],
        );

      case 'family_benefits':
        return GenericFeaturePage(
          title: loc.tr('family_benefits'), icon: Icons.family_restroom, color: AppTheme.primary,
          children: [
            const InfoCard(title: 'Children Education', subtitle: 'Scholarship: ₹10,000/year per child', icon: Icons.school),
            InfoCard(title: 'Family Health Card', subtitle: 'Covers: Spouse + 2 children', icon: Icons.health_and_safety, color: AppTheme.infoBlue),
            InfoCard(title: 'Emergency Fund', subtitle: '₹50,000 available for family emergency', icon: Icons.savings, color: AppTheme.earningGold),
            const ActionButton(label: 'View Details / विवरण देखें', icon: Icons.info),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── UTILITY & TOOLS ───
      // ═══════════════════════════════════════════
      case 'weather':
        return GenericFeaturePage(
          title: loc.tr('weather'), icon: Icons.wb_sunny, color: AppTheme.earningGold,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.earningGold),
              child: Row(
                children: [
                  Text('32°', style: GoogleFonts.plusJakartaSans(fontSize: 56, fontWeight: FontWeight.w800, color: AppTheme.earningGold)),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Partly Cloudy', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
                    Text('Mumbai — Andheri East', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: AppTheme.onSurfaceVariant)),
                    Text('UV Index: Moderate | Wind: 12 km/h', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.outline)),
                  ])),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InfoCard(title: '🌡️ Heat Advisory', subtitle: 'Drink extra water, take shade breaks', icon: Icons.thermostat, color: AppTheme.error),
            const InfoCard(title: '🌧️ Rain Expected', subtitle: 'Light showers after 5 PM', icon: Icons.umbrella),
          ],
        );

      case 'night_mode':
        return GenericFeaturePage(
          title: loc.tr('night_mode'), icon: Icons.dark_mode, color: AppTheme.secondary,
          children: [
            const InfoCard(title: 'Night Mode Status', subtitle: 'Active — Reduced blue light', icon: Icons.dark_mode),
            const InfoCard(title: 'Night Shift Allowance', subtitle: '+₹50 per night shift', icon: Icons.currency_rupee),
            const ActionButton(label: 'Toggle Night Mode', icon: Icons.brightness_4, isPrimary: false),
          ],
        );

      case 'documents':
        return GenericFeaturePage(
          title: loc.tr('documents'), icon: Icons.folder, color: AppTheme.infoBlue,
          children: [
            const InfoCard(title: 'ID Card', subtitle: 'GS-2024-5678 — Valid', icon: Icons.badge),
            const InfoCard(title: 'Aadhar Card', subtitle: 'Linked & verified', icon: Icons.credit_card),
            InfoCard(title: 'PAN Card', subtitle: 'ABCDE1234F', icon: Icons.receipt, color: AppTheme.earningGold),
            const InfoCard(title: 'Training Certificates', subtitle: '3 certificates uploaded', icon: Icons.school),
            const ActionButton(label: 'Upload Document / अपलोड करें', icon: Icons.upload_file),
          ],
        );

      case 'quiz':
        return GenericFeaturePage(
          title: loc.tr('quiz'), icon: Icons.quiz, color: AppTheme.earningGold,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.earningGold),
              child: Column(children: [
                Text('🎯 Daily Quiz', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
                const SizedBox(height: 4),
                Text('Win ₹50 daily! Answer 5 questions', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: AppTheme.onSurfaceVariant)),
              ]),
            ),
            const SizedBox(height: 16),
            Row(children: [
              MetricCard(label: 'Streak', value: '5 🔥', icon: Icons.local_fire_department, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'Total Won', value: '₹250', icon: Icons.emoji_events, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            const ActionButton(label: 'Start Quiz / क्विज़ शुरू', icon: Icons.play_arrow),
          ],
        );

      case 'helpline':
        return GenericFeaturePage(
          title: loc.tr('helpline'), icon: Icons.phone, color: AppTheme.infoBlue,
          children: [
            InfoCard(title: '📞 Emergency', subtitle: '112 — India Emergency Number', icon: Icons.emergency, color: AppTheme.sosDanger),
            const InfoCard(title: '🏥 Health Helpline', subtitle: '108 — Ambulance Service', icon: Icons.local_hospital),
            InfoCard(title: '👷 Supervisor', subtitle: '+91 98765 43210 — Rajesh Sharma', icon: Icons.person, color: AppTheme.earningGold),
            InfoCard(title: '🏢 HR Office', subtitle: '+91 22 2345 6789 — Mon-Fri 10AM-5PM', icon: Icons.business, color: AppTheme.infoBlue),
            const ActionButton(label: 'Call Supervisor / सुपरवाइजर को कॉल', icon: Icons.call),
          ],
        );

      case 'settings':
        return GenericFeaturePage(
          title: loc.tr('settings'), icon: Icons.settings, color: AppTheme.onSurfaceVariant,
          children: [
            const InfoCard(title: 'Language', subtitle: 'English / हिंदी — Tap to switch', icon: Icons.translate),
            const InfoCard(title: 'Notifications', subtitle: 'All notifications enabled', icon: Icons.notifications),
            const InfoCard(title: 'Data Usage', subtitle: 'Low data mode: OFF', icon: Icons.data_usage),
            const InfoCard(title: 'Privacy', subtitle: 'Location sharing: ON', icon: Icons.privacy_tip),
            const InfoCard(title: 'App Version', subtitle: 'GroundSeva Worker v2.0.1', icon: Icons.info),
            ActionButton(label: 'Logout / लॉगआउट', icon: Icons.logout, onTap: () {}, isPrimary: false),
          ],
        );

      case 'notification_center':
        return GenericFeaturePage(
          title: loc.tr('notification_center'), icon: Icons.notifications, color: AppTheme.earningGold,
          children: [
            InfoCard(title: '🔔 New Job Available', subtitle: 'Street Sweep — 120m away — ₹200', icon: Icons.work, color: AppTheme.primary),
            InfoCard(title: '💰 Bonus Credited', subtitle: '+₹30 waste collection bonus', icon: Icons.currency_rupee, color: AppTheme.earningGold),
            const InfoCard(title: '📢 Announcement', subtitle: 'Route change effective tomorrow', icon: Icons.campaign),
            const InfoCard(title: '✅ Task Completed', subtitle: 'Drain cleaning marked as done', icon: Icons.check_circle),
          ],
        );

      case 'emergency_contacts':
        return GenericFeaturePage(
          title: loc.tr('emergency_contacts'), icon: Icons.contact_phone, color: AppTheme.sosDanger,
          children: [
            InfoCard(title: 'Police', subtitle: '100', icon: Icons.local_police, color: AppTheme.infoBlue),
            InfoCard(title: 'Ambulance', subtitle: '108', icon: Icons.local_hospital, color: AppTheme.sosDanger),
            InfoCard(title: 'Fire', subtitle: '101', icon: Icons.local_fire_department, color: AppTheme.error),
            const InfoCard(title: 'Supervisor', subtitle: '+91 98765 43210', icon: Icons.person),
            const ActionButton(label: 'Add Emergency Contact', icon: Icons.add, isPrimary: false),
          ],
        );

      case 'about':
        return GenericFeaturePage(
          title: loc.tr('about'), icon: Icons.info, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.eco, size: 40, color: AppTheme.onPrimaryContainer)),
                const SizedBox(height: 14),
                Text('GroundSeva Worker', style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                Text('Eco Sanitation Platform', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Text('v2.0.1', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: AppTheme.outline)),
              ]),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Mission', subtitle: 'Empowering India\'s sanitation heroes with technology', icon: Icons.flag),
            const InfoCard(title: 'Contact', subtitle: 'support@groundseva.in', icon: Icons.email),
          ],
        );

      // ═══════════════════════════════════════════
      // ─── ADDITIONAL FEATURES ───
      // ═══════════════════════════════════════════
      case 'report_issue':
        return GenericFeaturePage(
          title: loc.tr('report_issue'), icon: Icons.report_problem, color: AppTheme.earningGold,
          children: [
            const InfoCard(title: 'Report Type', subtitle: 'Road damage, blocked drain, overflow...', icon: Icons.list),
            const ActionButton(label: 'Report with Photo / फोटो रिपोर्ट', icon: Icons.add_photo_alternate),
          ],
        );

      case 'uniform_request':
        return GenericFeaturePage(
          title: loc.tr('uniform_request'), icon: Icons.checkroom, color: AppTheme.infoBlue,
          children: [
            const InfoCard(title: 'Last Issued', subtitle: 'Uniform set — Jan 2025', icon: Icons.checkroom),
            const InfoCard(title: 'Shoes', subtitle: 'Safety shoes — Dec 2024', icon: Icons.do_not_step),
            const ActionButton(label: 'Request Uniform / वर्दी के लिए', icon: Icons.send),
          ],
        );

      case 'vehicle_check':
        return GenericFeaturePage(
          title: loc.tr('vehicle_check'), icon: Icons.local_shipping, color: AppTheme.earningGold,
          children: [
            const InfoCard(title: 'Vehicle: MH-01-AB-1234', subtitle: 'Garbage truck — Active', icon: Icons.local_shipping),
            const InfoCard(title: 'Last Service', subtitle: 'Feb 20, 2025 — Oil change', icon: Icons.build),
            InfoCard(title: 'Fuel Level', subtitle: '65% — Range: ~150 km', icon: Icons.local_gas_station, color: AppTheme.earningGold),
            const ActionButton(label: 'Report Vehicle Issue', icon: Icons.warning, isPrimary: false),
          ],
        );

      case 'qr_scanner':
        return GenericFeaturePage(
          title: loc.tr('qr_scanner'), icon: Icons.qr_code_scanner, color: AppTheme.primary,
          children: [
            Container(height: 250, decoration: BoxDecoration(color: AppTheme.surfaceContainerHigh, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Icon(Icons.qr_code_scanner, size: 64, color: AppTheme.outline))),
            const SizedBox(height: 16),
            const InfoCard(title: 'Scan to log', subtitle: 'Scan bin QR to auto-fill waste log', icon: Icons.qr_code),
            const ActionButton(label: 'Open Scanner / स्कैनर खोलें', icon: Icons.camera_alt),
          ],
        );

      case 'area_cleaning_status':
        return GenericFeaturePage(
          title: loc.tr('area_cleaning_status'), icon: Icons.cleaning_services, color: AppTheme.primary,
          children: [
            Row(children: [
              MetricCard(label: 'Cleaned', value: '75%', icon: Icons.check_circle, color: AppTheme.primary),
              const SizedBox(width: 10),
              MetricCard(label: 'Pending', value: '25%', icon: Icons.pending, color: AppTheme.earningGold),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Sector 5 — MG Road', subtitle: 'Completed ✓', icon: Icons.check_circle),
            InfoCard(title: 'Sector 5 — Park Lane', subtitle: 'In Progress...', icon: Icons.pending, color: AppTheme.earningGold),
            InfoCard(title: 'Sector 5 — Market Area', subtitle: 'Not Started', icon: Icons.circle_outlined, color: AppTheme.outline),
          ],
        );

      case 'toilet_locator':
        return GenericFeaturePage(
          title: loc.tr('toilet_locator'), icon: Icons.wc, color: AppTheme.infoBlue,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'Nearest: Sulabh Complex', subtitle: '200m — Open 24/7 — Free', icon: Icons.wc),
            InfoCard(title: 'Municipal Toilet Block', subtitle: '450m — 6AM-10PM — ₹2', icon: Icons.location_on, color: AppTheme.infoBlue),
          ],
        );

      case 'water_station':
        return GenericFeaturePage(
          title: loc.tr('water_station'), icon: Icons.water, color: AppTheme.infoBlue,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            InfoCard(title: 'Drinking Water Station', subtitle: '150m — Municipal supply point', icon: Icons.water_drop, color: AppTheme.infoBlue),
            const InfoCard(title: 'Refill Point', subtitle: '300m — Near park entrance', icon: Icons.local_drink),
          ],
        );

      case 'rest_zone':
        return GenericFeaturePage(
          title: loc.tr('rest_zone'), icon: Icons.airline_seat_recline_normal, color: AppTheme.tertiary,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'Rest Shelter #4', subtitle: '100m — Shaded area with bench', icon: Icons.deck),
            InfoCard(title: 'Canteen', subtitle: '250m — Lunch available ₹30-50', icon: Icons.restaurant, color: AppTheme.earningGold),
          ],
        );

      case 'performance_review':
        return GenericFeaturePage(
          title: loc.tr('performance_review'), icon: Icons.analytics, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                Text('Overall Rating', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 4),
                Text('4.5 ⭐', style: GoogleFonts.plusJakartaSans(fontSize: 42, fontWeight: FontWeight.w800, color: AppTheme.earningGold)),
                Text('Excellent Performance', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.primary)),
              ]),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Attendance', subtitle: '5/5 — Perfect', icon: Icons.check_circle),
            InfoCard(title: 'Quality', subtitle: '4/5 — Very good', icon: Icons.star, color: AppTheme.earningGold),
            const InfoCard(title: 'Speed', subtitle: '4.5/5 — Above average', icon: Icons.speed),
          ],
        );

      case 'digital_library':
        return GenericFeaturePage(
          title: loc.tr('digital_library'), icon: Icons.local_library, color: AppTheme.infoBlue,
          children: [
            const InfoCard(title: '📖 Waste Management Guide', subtitle: 'Hindi & English — 45 pages', icon: Icons.menu_book),
            InfoCard(title: '🎥 Safety Training Videos', subtitle: '5 videos — Total 2h 30m', icon: Icons.video_library, color: AppTheme.earningGold),
            const InfoCard(title: '📋 SOP Documents', subtitle: 'Standard procedures for each task', icon: Icons.description),
            const ActionButton(label: 'Browse Library / पुस्तकालय', icon: Icons.search, isPrimary: false),
          ],
        );

      case 'achievements':
        return GenericFeaturePage(
          title: loc.tr('achievements'), icon: Icons.military_tech, color: AppTheme.earningGold,
          children: [
            _sectionTitle('Badges Earned / बैज'),
            Wrap(spacing: 8, runSpacing: 8, children: [
              StatusBadge(label: '🏆 100% Attendance', color: AppTheme.earningGold),
              StatusBadge(label: '♻️ Eco Champion', color: AppTheme.primary),
              StatusBadge(label: '⭐ Top Performer', color: AppTheme.earningGold),
              StatusBadge(label: '🔥 30-Day Streak', color: AppTheme.error),
              StatusBadge(label: '💪 500kg Collected', color: AppTheme.infoBlue),
            ]),
            const SizedBox(height: 16),
            InfoCard(title: 'Next Badge', subtitle: 'Collect 1000kg waste — 65% done', icon: Icons.trending_up, color: AppTheme.earningGold),
          ],
        );

      case 'skill_upgrade':
        return GenericFeaturePage(
          title: loc.tr('skill_upgrade'), icon: Icons.school, color: AppTheme.primary,
          children: [
            InfoCard(title: '🎓 Advanced Waste Segregation', subtitle: 'Duration: 3 days — Starts Apr 15', icon: Icons.school, color: AppTheme.primary),
            InfoCard(title: '🔧 Vehicle Maintenance Basics', subtitle: 'Online — Self-paced', icon: Icons.build, color: AppTheme.earningGold),
            const InfoCard(title: '💻 Digital Literacy', subtitle: 'Next batch: May 1 — Free enrollment', icon: Icons.computer),
            const ActionButton(label: 'Enroll Now / नामांकन करें', icon: Icons.how_to_reg),
          ],
        );

      case 'grievance':
        return GenericFeaturePage(
          title: loc.tr('grievance'), icon: Icons.gavel, color: AppTheme.error,
          children: [
            Row(children: [
              MetricCard(label: 'Open', value: '1', icon: Icons.pending, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'Resolved', value: '4', icon: Icons.check_circle, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'How to file', subtitle: 'Select category → Describe issue → Submit', icon: Icons.help),
            const ActionButton(label: 'File Grievance / शिकायत दर्ज', icon: Icons.add_circle),
          ],
        );

      case 'overtime_log':
        return GenericFeaturePage(
          title: loc.tr('overtime_log'), icon: Icons.more_time, color: AppTheme.earningGold,
          children: [
            Row(children: [
              MetricCard(label: 'This Month', value: '12h', icon: Icons.timer, color: AppTheme.earningGold),
              const SizedBox(width: 10),
              MetricCard(label: 'OT Pay', value: '₹600', icon: Icons.currency_rupee, color: AppTheme.primary),
            ]),
            const SizedBox(height: 16),
            const InfoCard(title: 'Yesterday', subtitle: '2h extra — ₹100 overtime', icon: Icons.schedule),
            const InfoCard(title: 'March 15', subtitle: '3h extra — ₹150 overtime', icon: Icons.schedule),
            const ActionButton(label: 'Log Overtime / ओवरटाइम दर्ज', icon: Icons.add_circle),
          ],
        );

      case 'geo_fence':
        return GenericFeaturePage(
          title: loc.tr('geo_fence'), icon: Icons.fence, color: AppTheme.primary,
          children: [
            _mapPlaceholder(),
            const SizedBox(height: 16),
            const InfoCard(title: 'Your Zone Boundary', subtitle: 'Andheri East — 2.4 sq km', icon: Icons.fence),
            InfoCard(title: 'Status', subtitle: 'Inside zone ✓', icon: Icons.check_circle, color: AppTheme.primary),
            InfoCard(title: 'Alert', subtitle: 'Notification if you exit the zone', icon: Icons.notifications_active, color: AppTheme.earningGold),
          ],
        );

      case 'carbon_footprint':
        return GenericFeaturePage(
          title: loc.tr('carbon_footprint'), icon: Icons.co2, color: AppTheme.primary,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glowCard(color: AppTheme.primary),
              child: Column(children: [
                Text('Carbon Saved', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 4),
                Text('2.4 tons', style: GoogleFonts.plusJakartaSans(fontSize: 42, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                Text('CO₂ equivalent this year 🌍', style: GoogleFonts.plusJakartaSans(fontSize: 13, color: AppTheme.secondary)),
              ]),
            ),
            const SizedBox(height: 16),
            const InfoCard(title: 'Waste Diverted', subtitle: '450 kg from landfill this month', icon: Icons.recycling),
            InfoCard(title: 'Trees Equivalent', subtitle: '= 12 trees planted 🌳', icon: Icons.park, color: AppTheme.primary),
          ],
        );

      default:
        return GenericFeaturePage(
          title: loc.tr(key), icon: Icons.construction, color: AppTheme.primary,
          children: [
            InfoCard(title: loc.tr(key), subtitle: 'This feature is under development', icon: Icons.construction, color: AppTheme.earningGold),
            const ActionButton(label: 'Coming Soon / जल्द आ रहा है', icon: Icons.schedule, isPrimary: false),
          ],
        );
    }
  }

  // ─── SHARED HELPER WIDGETS ───

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Row(children: [
        Container(width: 3, height: 18, decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.primary)),
      ]),
    );
  }

  static Widget _mapPlaceholder() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.outlineVariant.withAlpha(40)),
      ),
      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.map, size: 48, color: AppTheme.primary.withAlpha(120)),
        const SizedBox(height: 8),
        Text('Maps Loading...', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppTheme.outline)),
      ])),
    );
  }

  static Widget _chatBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isMe ? AppTheme.primaryContainer.withAlpha(40) : AppTheme.surfaceContainerHigh,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16), topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 4), bottomRight: Radius.circular(isMe ? 4 : 16),
          ),
        ),
        child: Text(text, style: GoogleFonts.plusJakartaSans(
            fontSize: 14, color: isMe ? AppTheme.primary : AppTheme.onSurface)),
      ),
    );
  }

  static List<Widget> _weeklySchedule() {
    final days = ['Mon: 6AM-2PM', 'Tue: 6AM-2PM', 'Wed: 6AM-2PM', 'Thu: 6AM-2PM', 'Fri: 6AM-2PM', 'Sat: 6AM-12PM', 'Sun: OFF'];
    return days.map((d) => Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: AppTheme.glassCard(opacity: 0.08, radius: 12),
      child: Row(children: [
        Expanded(child: Text(d, style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.onSurface))),
        StatusBadge(label: d.contains('OFF') ? 'Holiday' : 'Active',
            color: d.contains('OFF') ? AppTheme.error : AppTheme.primary),
      ]),
    )).toList();
  }

  static List<Widget> _taskList() {
    final tasks = [
      {'title': 'Street Sweep — MG Road', 'status': 'Done', 'color': AppTheme.primary},
      {'title': 'Garbage Pickup — Market', 'status': 'Done', 'color': AppTheme.primary},
      {'title': 'Drain Clean — Junction 3', 'status': 'In Progress', 'color': AppTheme.earningGold},
      {'title': 'Bin Collection — Park Lane', 'status': 'Pending', 'color': AppTheme.outline},
    ];
    return tasks.map((t) => Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: AppTheme.glassCard(opacity: 0.08, radius: 14),
      child: Row(children: [
        Icon(t['status'] == 'Done' ? Icons.check_circle : t['status'] == 'In Progress' ? Icons.pending : Icons.circle_outlined,
            color: t['color'] as Color, size: 22),
        const SizedBox(width: 12),
        Expanded(child: Text(t['title'] as String, style: GoogleFonts.plusJakartaSans(
            fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.onSurface))),
        StatusBadge(label: t['status'] as String, color: t['color'] as Color),
      ]),
    )).toList();
  }

  static Widget _leaderRow(String rank, String name, String bonus, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: AppTheme.glassCard(opacity: rank == '1' ? 0.15 : 0.08, radius: 14),
      child: Row(children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(
            color: color.withAlpha(25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('#$rank', style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w800, color: color))),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.onSurface)),
          Text(bonus, style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.onSurfaceVariant)),
        ])),
        if (rank == '1') const Text('👑', style: TextStyle(fontSize: 20)),
      ]),
    );
  }
}
