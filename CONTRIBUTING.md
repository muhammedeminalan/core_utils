# Contributing to core_utils

Thanks for considering contributing! Here's how you can help.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/<your-username>/core_utils.git
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create a feature branch:
   ```bash
   git checkout -b feature/my-feature
   ```

## Development

- Run analysis: `flutter analyze`
- Run tests: `flutter test`
- Format code: `dart format .`

## Pull Request Guidelines

- **One feature/fix per PR** — keep it focused.
- Follow existing code style and naming conventions.
- Add tests for new features.
- Update `CHANGELOG.md` under an `## [Unreleased]` section.
- Make sure `flutter analyze` and `flutter test` pass.

## Commit Messages

Use clear, descriptive commit messages:

```
feat: add opacity extension on Widget
fix: handle null case in string capitalize
docs: update README with new examples
```

## Versioning

This project follows [Semantic Versioning](https://semver.org/):

- **PATCH** (0.1.x): Bug fixes, documentation.
- **MINOR** (0.x.0): New extensions/widgets, non-breaking additions.
- **MAJOR** (x.0.0): Breaking API changes (rename, remove, signature change).

## Code of Conduct

Be respectful and constructive. We're all here to build something useful.
