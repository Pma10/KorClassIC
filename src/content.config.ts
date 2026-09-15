import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const works = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/works' }),
  schema: z.object({
    title: z.string(),
    hanjaTitle: z.string().optional(),
    author: z.string().optional(),
    period: z.string(),
    category: z.string(),
    status: z.enum(['planned', 'translating', 'reviewing', 'published']),
    progress: z.number().min(0).max(100),
    summary: z.string(),
    source: z.string().optional(),
    sourceUrl: z.url().optional(),
    sourceLicense: z.string().optional(),
    updatedAt: z.coerce.date()
  })
});

export const collections = { works };
