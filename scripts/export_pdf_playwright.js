// Export the published or local HTML page to PDF with Playwright.
// Usage:
//   npm init -y
//   npm i -D playwright
//   npx playwright install chromium
//   node scripts/export_pdf_playwright.js http://localhost:8000 output.pdf

const { chromium } = require('playwright');

const url = process.argv[2] || 'http://localhost:8000';
const output = process.argv[3] || 'output.pdf';

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 1440, height: 1200 }, deviceScaleFactor: 1 });
  await page.goto(url, { waitUntil: 'networkidle' });
  await page.emulateMedia({ media: 'print' });
  await page.pdf({ path: output, format: 'A4', printBackground: true, margin: { top: '10mm', right: '10mm', bottom: '10mm', left: '10mm' } });
  await browser.close();
  console.log(`PDF exported to ${output}`);
})();
