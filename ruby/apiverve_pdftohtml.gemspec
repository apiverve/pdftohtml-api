# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_pdftohtml"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "PDF to HTML API - Ruby Client"
  spec.description   = "PDF to HTML converts the pages of a PDF, uploaded or fetched from a URL, into one self-contained HTML file that looks like the original: same layout, embedded fonts and images, and real selectable text. Choose a page range, unlock password-protected PDFs, or ask for text only; long documents are converted in batches, with nextPage pointing to the next one."
  spec.homepage      = "https://apiverve.com/marketplace/pdftohtml?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/pdftohtml-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/pdftohtml"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
