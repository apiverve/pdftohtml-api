declare module '@apiverve/pdftohtml' {
  export interface pdftohtmlOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface pdftohtmlResponse {
    status: string;
    error: string | null;
    data: PDFtoHTMLData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PDFtoHTMLData {
      htmlName:       null | string;
      pageCount:      number | null;
      firstPage:      number | null;
      lastPage:       number | null;
      pagesConverted: number | null;
      nextPage:       number | null;
      textOnly:       boolean | null;
      encrypted:      boolean | null;
      size:           number | null;
      inline:         boolean | null;
      html:           null;
      expires:        number | null;
      downloadURL:    null | string;
  }

  export default class pdftohtmlWrapper {
    constructor(options: pdftohtmlOptions);

    execute(callback: (error: any, data: pdftohtmlResponse | null) => void): Promise<pdftohtmlResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: pdftohtmlResponse | null) => void): Promise<pdftohtmlResponse>;
    execute(query?: Record<string, any>): Promise<pdftohtmlResponse>;
  }
}
