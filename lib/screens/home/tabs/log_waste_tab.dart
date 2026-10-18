import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/localization.dart';
import '../../../core/theme.dart';

class LogWasteTab extends StatefulWidget {
  const LogWasteTab({super.key});

  @override
  State<LogWasteTab> createState() => _LogWasteTabState();
}

class _LogWasteTabState extends State<LogWasteTab> {
  String _selectedWasteType = 'dry';
  String _selectedSubCategory = 'Paper';
  double _weight = 10;
  final String _aiGrade = 'B';
  bool _photoAdded = false;

  final List<Map<String, dynamic>> _wasteTypes = [
    {'key': 'dry', 'label': 'Dry / सूखा', 'icon': Icons.inventory_2_outlined, 'color': AppTheme.earningGold},
    {'key': 'wet', 'label': 'Wet / गीला', 'icon': Icons.water_drop_outlined, 'color': AppTheme.primary},
    {'key': 'metal', 'label': 'Metal / धातु', 'icon': Icons.settings, 'color': AppTheme.infoBlue},
    {'key': 'organic', 'label': 'Organic / जैविक', 'icon': Icons.eco, 'color': AppTheme.secondary},
    {'key': 'hazard', 'label': 'Hazardous / खतरनाक', 'icon': Icons.warning_amber, 'color': AppTheme.sosDanger},
  ];

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<AppLocalization>(context);
    final bonus = _aiGrade == 'A' ? 50 : _aiGrade == 'B' ? 30 : 15;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── PHOTO UPLOAD ───
          InkWell(
            onTap: () => setState(() => _photoAdded = true),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: AppTheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _photoAdded ? AppTheme.primary.withAlpha(60) : AppTheme.outlineVariant.withAlpha(60),
                  width: _photoAdded ? 2 : 1.5,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: _photoAdded
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppTheme.primaryContainer.withAlpha(30), AppTheme.surfaceContainerHigh],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: const Center(child: Icon(Icons.check_circle, color: AppTheme.primary, size: 48)),
                          ),
                          Positioned(bottom: 12, left: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryContainer.withAlpha(40),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text('Photo captured ✓', style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.primary)),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withAlpha(15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.camera_alt_rounded, size: 32, color: AppTheme.primary),
                        ),
                        const SizedBox(height: 12),
                        Text(loc.tr('take_photo'), style: GoogleFonts.plusJakartaSans(
                            fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.onSurface)),
                        Text('फ़ोटो लें / Upload evidence', style: GoogleFonts.plusJakartaSans(
                            fontSize: 12, color: AppTheme.onSurfaceVariant)),
                      ],
                    ),
            ),
          ),

          const SizedBox(height: 24),

          // ─── WASTE TYPE SELECTOR ───
          Text('Waste Type / कचरे का प्रकार', style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _wasteTypes.map((w) {
              final selected = _selectedWasteType == w['key'];
              final color = w['color'] as Color;
              return InkWell(
                onTap: () => setState(() => _selectedWasteType = w['key'] as String),
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? color.withAlpha(30) : AppTheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: selected ? color.withAlpha(80) : AppTheme.outlineVariant.withAlpha(50)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(w['icon'] as IconData, size: 18, color: selected ? color : AppTheme.onSurfaceVariant),
                      const SizedBox(width: 6),
                      Text(w['label'] as String, style: GoogleFonts.plusJakartaSans(
                          fontSize: 13, fontWeight: FontWeight.w600,
                          color: selected ? color : AppTheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // ─── SUB-CATEGORY ───
          Text('Sub-Category / उप-श्रेणी', style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.outlineVariant.withAlpha(50)),
            ),
            child: DropdownButtonFormField<String>(
              value: _selectedSubCategory,
              decoration: const InputDecoration(border: InputBorder.none, filled: false),
              dropdownColor: AppTheme.surfaceContainerHighest,
              style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.onSurface),
              items: ['Paper', 'Plastic', 'Glass', 'E-Waste', 'Food Waste', 'Garden Waste', 'Mixed']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => setState(() => _selectedSubCategory = val ?? 'Paper'),
            ),
          ),

          const SizedBox(height: 24),

          // ─── WEIGHT SLIDER ───
          Text('Estimated Weight / अनुमानित वजन', style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: AppTheme.glassCard(opacity: 0.1, radius: 20),
            child: Column(
              children: [
                Text('${_weight.toStringAsFixed(1)} kg',
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 40, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                const SizedBox(height: 16),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppTheme.primaryContainer,
                    inactiveTrackColor: AppTheme.surfaceContainerHighest,
                    thumbColor: AppTheme.primary,
                    overlayColor: AppTheme.primary.withAlpha(20),
                    trackHeight: 6,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: Slider(
                    value: _weight, min: 0.5, max: 100,
                    onChanged: (v) => setState(() => _weight = v),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0.5 kg', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.outline)),
                    Text('100 kg', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppTheme.outline)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ─── AI GRADE INDICATOR ───
          Container(
            padding: const EdgeInsets.all(20),
            decoration: AppTheme.glowCard(color: AppTheme.primary, radius: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(40), blurRadius: 16)],
                  ),
                  child: Text('AI', style: GoogleFonts.plusJakartaSans(
                      fontSize: 20, fontWeight: FontWeight.w800, color: AppTheme.onPrimaryContainer)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('AI Suggested Grade', style: GoogleFonts.plusJakartaSans(
                          fontSize: 12, color: AppTheme.onSurfaceVariant)),
                      const SizedBox(height: 2),
                      Text('Grade $_aiGrade', style: GoogleFonts.plusJakartaSans(
                          fontSize: 24, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppTheme.earningGold.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text('+₹$bonus', style: GoogleFonts.plusJakartaSans(
                          fontSize: 22, fontWeight: FontWeight.w800, color: AppTheme.earningGold)),
                      Text('Bonus', style: GoogleFonts.plusJakartaSans(
                          fontSize: 11, color: AppTheme.earningGold)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // ─── SUBMIT ───
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('✅ Waste logged successfully! / कचरा सफलतापूर्वक दर्ज!',
                      style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600)),
                  backgroundColor: AppTheme.primaryContainer,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ));
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(50), blurRadius: 20, offset: const Offset(0, 6))],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload_rounded, color: AppTheme.onPrimaryContainer, size: 22),
                    const SizedBox(width: 10),
                    Text('${loc.tr('submit')} / दर्ज करें',
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onPrimaryContainer)),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
