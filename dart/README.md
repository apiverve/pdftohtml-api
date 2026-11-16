# PDF to HTML API - Dart/Flutter Client

PDF to HTML converts the pages of a PDF, uploaded or fetched from a URL, into one self-contained HTML file that looks like the original: same layout, embedded fonts and images, and real selectable text. Choose a page range, unlock password-protected PDFs, or ask for text only; long documents are converted in batches, with nextPage pointing to the next one.

[![pub package](https://img.shields.io/pub/v/apiverve_pdftohtml.svg)](https://pub.dev/packages/apiverve_pdftohtml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [PDF to HTML API](https://apiverve.com/marketplace/pdftohtml?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_pdftohtml: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_pdftohtml/apiverve_pdftohtml.dart';

void main() async {
  final client = PdftohtmlClient('YOUR_API_KEY');

  try {
    // This API requires a file upload — a JSON body is rejected with a 400.
    final response = await client.executeWithFile('/path/to/your-file');

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "htmlName": "7c1e4b9a-2f3d-4e8a-9b6c-5d0a1f2e3c4b.html",
    "pageCount": 14,
    "firstPage": 1,
    "lastPage": 10,
    "pagesConverted": 10,
    "nextPage": 11,
    "textOnly": false,
    "encrypted": false,
    "size": 1873402,
    "inline": false,
    "html": null,
    "expires": 1792400000000,
    "downloadURL": "https://storage.googleapis.com/apiverve/APIData/pdftohtml/7c1e4b9a-2f3d-4e8a-9b6c-5d0a1f2e3c4b.html?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1792400000&Signature=SAMPLE"
  }
}
```

## API Reference

- **API Home:** [PDF to HTML API](https://apiverve.com/marketplace/pdftohtml?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/pdftohtml](https://docs.apiverve.com/ref/pdftohtml?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
