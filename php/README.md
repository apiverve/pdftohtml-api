# PDF to HTML API - PHP Package

PDF to HTML converts the pages of a PDF, uploaded or fetched from a URL, into one self-contained HTML file that looks like the original: same layout, embedded fonts and images, and real selectable text. Choose a page range, unlock password-protected PDFs, or ask for text only; long documents are converted in batches, with nextPage pointing to the next one.

## Installation

Install via Composer:

```bash
composer require apiverve/pdftohtml
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Pdftohtml\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf',
    'pages' => '1-'
]);

// Print the response
print_r($response);
```

### File Upload

```php
// Upload a file
$response = $client->executeWithFile('/path/to/file.jpg');

// Or use a URL
$response = $client->executeWithUrl('https://example.com/image.jpg');
```

### Error Handling

```php
use APIVerve\Pdftohtml\Client;
use APIVerve\Pdftohtml\Exceptions\APIException;
use APIVerve\Pdftohtml\Exceptions\ValidationException;

try {
    $response = $client->execute(['pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf', 'pages' => '1-']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/pdftohtml?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/pdftohtml?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/pdftohtml?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
