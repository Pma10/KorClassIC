import { defineConfig } from 'astro/config';

const site = process.env.SITE_URL || 'https://pma10.github.io';
const base = process.env.BASE_PATH || '/KorClassIC';

export default defineConfig({
  site,
  base,
  trailingSlash: 'always'
});
