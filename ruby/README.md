# PDF to HTML API - Ruby Gem

PDF to HTML converts the pages of a PDF, uploaded or fetched from a URL, into one self-contained HTML file that looks like the original: same layout, embedded fonts and images, and real selectable text. Choose a page range, unlock password-protected PDFs, or ask for text only; long documents are converted in batches, with nextPage pointing to the next one.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_pdftohtml'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_pdftohtml
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_pdftohtml'

# Initialize the client
client = APIVerve::Pdftohtml::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  pdf: "https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf",
  pages: "1-"
})

# Print the response
puts response
```

### File Upload

```ruby
# Upload a file
response = client.execute_with_file("/path/to/file.jpg")

# Or use a URL
response = client.execute_with_url("https://example.com/image.jpg")
```

### Error Handling

```ruby
begin
  response = client.execute({ pdf: "https://raw.githubusercontent.com/mozilla/pdf.js/master/web/compressed.tracemonkey-pldi-09.pdf", pages: "1-" })
  puts response["data"]
rescue APIVerve::Pdftohtml::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Pdftohtml::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Pdftohtml::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/pdftohtml?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/pdftohtml?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/pdftohtml?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
