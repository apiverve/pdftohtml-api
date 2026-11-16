/// Response models for the PDF to HTML API.

/// API Response wrapper.
class PdftohtmlResponse {
  final String status;
  final dynamic error;
  final PdftohtmlData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PdftohtmlResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PdftohtmlResponse.fromJson(Map<String, dynamic> json) => PdftohtmlResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PdftohtmlData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the PDF to HTML API.

class PdftohtmlData {
  String? htmlName;
  num? pageCount;
  num? firstPage;
  num? lastPage;
  num? pagesConverted;
  num? nextPage;
  bool? textOnly;
  bool? encrypted;
  num? size;
  bool? inline;
  dynamic html;
  num? expires;
  String? downloadURL;

  PdftohtmlData({
    this.htmlName,
    this.pageCount,
    this.firstPage,
    this.lastPage,
    this.pagesConverted,
    this.nextPage,
    this.textOnly,
    this.encrypted,
    this.size,
    this.inline,
    this.html,
    this.expires,
    this.downloadURL,
  });

  factory PdftohtmlData.fromJson(Map<String, dynamic> json) => PdftohtmlData(
      htmlName: json['htmlName'],
      pageCount: json['pageCount'],
      firstPage: json['firstPage'],
      lastPage: json['lastPage'],
      pagesConverted: json['pagesConverted'],
      nextPage: json['nextPage'],
      textOnly: json['textOnly'],
      encrypted: json['encrypted'],
      size: json['size'],
      inline: json['inline'],
      html: json['html'],
      expires: json['expires'],
      downloadURL: json['downloadURL'],
    );
}

class PdftohtmlRequest {
  String? pdf;
  String? pages;

  PdftohtmlRequest({
    this.pdf,
    this.pages,
  });

  Map<String, dynamic> toJson() => {
      if (pdf != null) 'pdf': pdf,
      if (pages != null) 'pages': pages,
    };
}
