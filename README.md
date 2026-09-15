# KorClassIC

한국 고전을 원문 출처·이용조건과 함께 정리하고, AI 보조 번역과 사람 검토를 거쳐 공개하는 프로젝트입니다.

## 사이트

GitHub Pages: `https://pma10.github.io/KorClassIC/`

## 디자인

사이트 테마는 **Fuwari upstream을 그대로 사용**합니다. KorClassIC에서 별도 디자인을 재구현하지 않습니다.

- Upstream: `saicaca/fuwari`
- Pinned commit: `6d39b0dec41282e7852e23e032998a5789abee28`
- License: MIT

빌드할 때 공식 Fuwari 소스를 해당 커밋으로 가져온 뒤 아래 파일만 덮어씁니다.

- `fuwari-overrides/config.ts`: 사이트 이름·언어·링크
- `fuwari-overrides/about.md`: 프로젝트 소개
- `fuwari-overrides/posts/`: 고전 콘텐츠

따라서 Fuwari의 레이아웃, 카드, 네비게이션, 애니메이션, 검색, 다크 모드 등 디자인/동작 코드는 upstream 그대로입니다.

## 로컬 빌드

Node.js 22, pnpm 9.14.4, Git이 필요합니다.

```bash
pnpm --version
bash scripts/materialize-fuwari.sh
```

생성 결과는 `dist/`에 저장됩니다.

## 초기 후보

- 세자행적 (世子行蹟)
- 농산집 (農山集)
- 동현주의 (東賢奏議)

현재는 번역 착수 전 후보 자료이며, 원문 출처·판본·재배포 조건과 기존 번역 존재 여부를 먼저 확인합니다.
