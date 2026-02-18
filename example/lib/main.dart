import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoreUtilsExampleApp());
}

class CoreUtilsExampleApp extends StatelessWidget {
  const CoreUtilsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'core_utils Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── CostumAppBar ──
      appBar: CostumAppBar(
        title: 'core_utils Demo',
        centerTitle: true,
        actions: [
          CostumIconButton(
            iconData: Icons.info_outline,
            onPressed: () {
              CostumBottomSheet.show(
                context,
                title: 'About',
                child: const Text(
                  'This app demonstrates the core_utils package extensions and widgets.',
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: [
          // ── Context Extensions ──
          _SectionTitle('Context Extensions'),
          Text(
            'Screen: ${context.width.toStringAsFixed(0)} × ${context.height.toStringAsFixed(0)}',
          ).paddingAll(8),
          'Primary color'.text.bold
              .bodyLarge(context)
              .color(context.primaryColor),

          16.h, // SizedBox(height: 16) — num extension
          // ── String Extensions ──
          _SectionTitle('String Extensions'),
          Text(
            "'hello world'.capitalize() → ${'hello world'.capitalize()}",
          ).paddingAll(4),
          Text(
            "'hello world'.toTitleCase() → ${'hello world'.toTitleCase()}",
          ).paddingAll(4),
          Text(
            "'hello world'.toSnakeCase() → ${'hello world'.toSnakeCase()}",
          ).paddingAll(4),
          Text(
            "'abc123'.isAlphanumeric → ${'abc123'.isAlphanumeric}",
          ).paddingAll(4),

          16.h,

          // ── Text Builder ──
          _SectionTitle('Text Builder'),
          'Chainable Text API'.text.bold
              .titleMedium(context)
              .color(Colors.indigo),

          24.h,

          // ── Widget Extensions ──
          _SectionTitle('Widget Extensions'),
          const Text('Rounded Box')
              .roundedBox(
                radius: 12,
                backgroundColor: Colors.indigo.shade50,
                innerPadding: 16.all,
              )
              .paddingAll(8),

          16.h,

          // ── CostumButton ──
          _SectionTitle('Reusable Widgets'),
          CostumButton(
            text: 'Press Me',
            onPressed: () => 'Button pressed!'.debugLog(),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            borderRadius: 12,
          ).paddingSymmetric(h: 16),

          32.h,
        ].column(crossAxisAlignment: CrossAxisAlignment.stretch),
      ).paddingAll(16),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return title.text.bold
        .titleLarge(context)
        .color(context.primaryColor)
        .paddingOnly(top: 16, bottom: 8);
  }
}
