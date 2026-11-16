using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PDFtoHTML
{
    /// <summary>
    /// Query options for the PDF to HTML API
    /// </summary>
    public class PDFtoHTMLQueryOptions
    {
        /// <summary>
        /// The PDF file to convert (up to 10 MB), or a public PDF URL
        /// </summary>
        [JsonProperty("pdf")]
        public string Pdf { get; set; }

        /// <summary>
        /// One page or range: 3, 2-7, or 5- for page 5 onwards. Each call converts up to 10 pages (2 on the Free plan) from the start of the range; nextPage says where to continue
        /// </summary>
        [JsonProperty("pages")]
        public string Pages { get; set; }

        /// <summary>
        /// User or owner password of an encrypted PDF
        /// </summary>
        [JsonProperty("password")]
        public string Password { get; set; }

        /// <summary>
        /// Leave out images and vector graphics and keep only the positioned text in its fonts
        /// </summary>
        [JsonProperty("textOnly")]
        public bool? TextOnly { get; set; }
    }
}
