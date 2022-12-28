import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  site: 'https://jasonbrennan.com',
  integrations: [
    mdx({ drafts: true }),
    sitemap(),
    tailwind()
  ]
});
