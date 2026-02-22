String buildAuthEmailHtml({
  required String title,
  required String description,
  required String code,
  required String footerNote,
}) {
  final normalizedCode = code.split('').join('  ');

  return '''
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$title</title>
  </head>
  <body style="margin:0;padding:0;background:#f3f1ec;font-family:Arial,Helvetica,sans-serif;color:#2a2218;">
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#f3f1ec;padding:24px 0;">
      <tr>
        <td align="center">
          <table role="presentation" cellpadding="0" cellspacing="0" width="640" style="max-width:640px;background:#fff;border:1px solid #e1d6c8;border-radius:16px;overflow:hidden;">
            <tr>
              <td style="background:linear-gradient(135deg,#3e2b1d,#6a3d1f);padding:28px 32px;color:#fff;">
                <div style="font-size:14px;letter-spacing:2px;text-transform:uppercase;opacity:0.9;">Root Hub</div>
                <h1 style="margin:10px 0 0;font-size:30px;line-height:1.2;">$title</h1>
              </td>
            </tr>
            <tr>
              <td style="padding:24px 32px 6px;">
                <img
                  src="https://therewillbe.games/media/reviews/photos/original/fe/50/4b/root-review-81-1537397135.png"
                  alt="ROOT artwork"
                  style="display:block;width:100%;max-width:576px;border-radius:12px;border:1px solid #e8dccf;"
                />
              </td>
            </tr>
            <tr>
              <td style="padding:18px 32px 10px;">
                <p style="margin:0;font-size:16px;line-height:1.6;color:#4d3b2a;">$description</p>
              </td>
            </tr>
            <tr>
              <td style="padding:12px 32px 24px;" align="center">
                <div style="display:inline-block;padding:14px 24px;border-radius:12px;background:#f7efe6;border:1px solid #decdbb;color:#2f2418;font-size:28px;letter-spacing:4px;font-weight:700;">
                  $normalizedCode
                </div>
              </td>
            </tr>
            <tr>
              <td style="padding:0 32px 30px;">
                <p style="margin:0;font-size:14px;line-height:1.6;color:#6a5a4a;">
                  $footerNote
                </p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
''';
}
