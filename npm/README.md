# PDF to HTML API

PDF to HTML converts the pages of a PDF, uploaded or fetched from a URL, into one self-contained HTML file that looks like the original: same layout, embedded fonts and images, and real selectable text. Choose a page range, unlock password-protected PDFs, or ask for text only; long documents are converted in batches, with nextPage pointing to the next one.

[![npm version](https://img.shields.io/npm/v/@apiverve/pdftohtml.svg)](https://www.npmjs.com/package/@apiverve/pdftohtml)

This is a JavaScript wrapper for the [PDF to HTML API](https://apiverve.com/marketplace/pdftohtml?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/pdftohtml
```

Using yarn:
```shell
yarn add @apiverve/pdftohtml
```

---

## Configuration

Before using the PDF to HTML API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The PDF to HTML API documentation is found here: [https://docs.apiverve.com/ref/pdftohtml](https://docs.apiverve.com/ref/pdftohtml?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const pdftohtmlAPI = require('@apiverve/pdftohtml');
const api = new pdftohtmlAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

### File Upload

This API requires a file upload. Use `executeWithFile()` to upload files:

```javascript
// Upload a file (path, Buffer, or ReadStream)
api.executeWithFile('/path/to/file.pdf', options, callback);
```

**Accepted file types:** .pdf
**Maximum file size:** 10 MB

### Available Parameters

Pass additional parameters via `options.fields`:

| Parameter | Type | Description |
|-----------|------|-------------|
| `pages` | string | One page or range: 3, 2-7, or 5- for page 5 onwards. Each call converts up to 10 pages (2 on the Free plan) from the start of the range; nextPage says where to continue |
| `password` | string | User or owner password of an encrypted PDF |
| `textOnly` | boolean | Leave out images and vector graphics and keep only the positioned text in its fonts |

```javascript
api.executeWithFile('/path/to/file', {
    fields: {
        pages: '1-',
        password: 'example',
        textOnly: 'textOnly'
    }
});
```

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
// This API requires a file upload
// You can pass a file path, Buffer, or ReadStream
var filePath = '/path/to/pdf.pdf';

api.executeWithFile(filePath,
    {
        fields: {
        pages: '1-',
        password: 'example',
        textOnly: 'textOnly'
        }
    }, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
// This API requires a file upload
// You can pass a file path, Buffer, or ReadStream
var filePath = '/path/to/pdf.pdf';

api.executeWithFile(filePath, { fields: { /* parameters */ } })
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    // This API requires a file upload
// You can pass a file path, Buffer, or ReadStream
var filePath = '/path/to/pdf.pdf';

    try {
        const data = await api.executeWithFile(filePath, { fields: { /* parameters */ } });
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
