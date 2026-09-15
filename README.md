# KorClassIC

한국 고전을 AI와 사람의 검토로 현대 한국어에 연결하는 오픈 번역 아카이브입니다.

- **Frontend:** Astro
- **Design direction:** Fuwari-inspired soft glass / card UI
- **Hosting:** GitHub Pages
- **Content:** Markdown + Astro Content Collections

## 개발

```bash
npm install
npm run dev
```

프로덕션 빌드:

```bash
npm run build
```

## 콘텐츠 추가

`src/content/works/*.md`에 작품을 추가합니다. 각 작품은 최소한 작품명, 시대, 분류, 번역 상태, 진행률, 요약, 마지막 갱신일을 기록합니다.

번역 상태는 다음 네 단계로 관리합니다.

- `planned` — 출처/이용조건/기존 번역 조사
- `translating` — AI 초벌 번역 진행
- `reviewing` — 원문 대조 및 사람 검토
- `published` — 1차 검토 완료 공개본

## GitHub Pages

`main` 브랜치에 반영되면 `.github/workflows/deploy.yml`이 사이트를 빌드하고 GitHub Pages에 배포하도록 구성되어 있습니다.

예상 주소: `https://pma10.github.io/KorClassIC/`

## 라이선스

사이트 코드의 라이선스와 고전 원문/번역 콘텐츠의 이용조건은 분리해서 관리합니다. **각 원문 데이터는 해당 출처의 이용조건을 개별 확인한 뒤 포함합니다.**

디자인 방향은 [Fuwari](https://github.com/saicaca/fuwari)에서 영감을 받았습니다. Fuwari는 MIT License로 배포됩니다.
