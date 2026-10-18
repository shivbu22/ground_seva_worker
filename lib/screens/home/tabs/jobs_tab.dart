import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/localization.dart';
import '../../../core/theme.dart';

class JobsTab extends StatefulWidget {
  const JobsTab({super.key});

  @override
  State<JobsTab> createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> {
  String _selectedFilter = 'all';
  final List<Map<String, dynamic>> _filters = [
    {'key': 'all', 'label': 'All / सभी', 'icon': Icons.list_alt},
    {'key': 'sweep', 'label': 'Street Sweep', 'icon': Icons.cleaning_services},
    {'key': 'garbage', 'label': 'Garbage', 'icon': Icons.delete_outline},
    {'key': 'drain', 'label': 'Drain', 'icon': Icons.plumbing},
    {'key': 'lake', 'label': 'Lake', 'icon': Icons.water},
  ];

  final List<Map<String, dynamic>> _jobs = [
    {'type': 'Street Sweep', 'icon': Icons.cleaning_services, 'location': 'MG Road, Sector 5', 'distance': '120m', 'pay': '₹200', 'urgency': 'Normal', 'color': 0xFF63DD98},
    {'type': 'Garbage Pickup', 'icon': Icons.delete_outline, 'location': 'Andheri East Market', 'distance': '250m', 'pay': '₹350', 'urgency': 'Urgent', 'color': 0xFFFBBF24},
    {'type': 'Drain Clean', 'icon': Icons.plumbing, 'location': 'JM Road, Junction 3', 'distance': '380m', 'pay': '₹300', 'urgency': 'Normal', 'color': 0xFF3B82F6},
    {'type': 'Lake Cleaning', 'icon': Icons.water, 'location': 'Powai Lake, Gate 2', 'distance': '450m', 'pay': '₹500', 'urgency': 'Priority', 'color': 0xFF90D792},
  ];

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<AppLocalization>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GPS Status
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: AppTheme.glassCard(opacity: 0.1, radius: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.gps_fixed, color: AppTheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GPS Active • Tracking Enabled',
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.primary)),
                      Text('Showing jobs within 500m radius',
                          style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                Container(
                  width: 10, height: 10,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(80), blurRadius: 8)],
                  ),
                ),
              ],
            ),
          ),

          // Filters
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _filters.length,
              itemBuilder: (context, i) {
                final f = _filters[i];
                final selected = f['key'] == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    selected: selected,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(f['icon'] as IconData, size: 16,
                            color: selected ? AppTheme.onPrimaryContainer : AppTheme.onSurfaceVariant),
                        const SizedBox(width: 6),
                        Text(f['label'] as String),
                      ],
                    ),
                    onSelected: (val) => setState(() => _selectedFilter = f['key'] as String),
                    backgroundColor: AppTheme.surfaceContainerHigh,
                    selectedColor: AppTheme.primaryContainer,
                    checkmarkColor: AppTheme.onPrimaryContainer,
                    labelStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 13, fontWeight: FontWeight.w600,
                      color: selected ? AppTheme.onPrimaryContainer : AppTheme.onSurfaceVariant,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    side: BorderSide(color: selected ? Colors.transparent : AppTheme.outlineVariant.withAlpha(60)),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          // Job Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text('${_jobs.length} ${loc.tr('nearby_jobs')}',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),

          // Jobs List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _jobs.length,
            itemBuilder: (context, i) => _buildJobCard(_jobs[i], loc),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildJobCard(Map<String, dynamic> job, AppLocalization loc) {
    final color = Color(job['color'] as int);
    final isUrgent = job['urgency'] == 'Urgent';
    final isPriority = job['urgency'] == 'Priority';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUrgent ? AppTheme.earningGold.withAlpha(50) :
                 isPriority ? AppTheme.primary.withAlpha(50) :
                 AppTheme.outlineVariant.withAlpha(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withAlpha(20),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(job['icon'] as IconData, color: color, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(job['type'] as String,
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onSurface))),
                          if (isUrgent || isPriority)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: (isUrgent ? AppTheme.earningGold : AppTheme.primary).withAlpha(20),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(job['urgency'] as String,
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 11, fontWeight: FontWeight.w700,
                                      color: isUrgent ? AppTheme.earningGold : AppTheme.primary)),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(job['location'] as String,
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 13, color: AppTheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildJobChip(Icons.near_me, job['distance'] as String, AppTheme.primary),
                const SizedBox(width: 10),
                _buildJobChip(Icons.currency_rupee, job['pay'] as String, AppTheme.earningGold),
                const Spacer(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(30), blurRadius: 12)],
                      ),
                      child: Text(loc.tr('accept'),
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.onPrimaryContainer)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(label, style: GoogleFonts.plusJakartaSans(
              fontSize: 13, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}
