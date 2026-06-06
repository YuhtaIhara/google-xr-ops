# Snapshot: Jetpack XR SDK Developer Preview 4 — updates blog

| 項目 | 値 |
|---|---|
| source id | jetpack-xr-dp4 |
| URL | https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html |
| fetched | 2026-05-23 |
| method | WebFetch |
| 用途 | SDK 最新版の API set 把握、 Sotto Compose Glimmer HUD 実装の base |

## 抽出情報

### Jetpack Projected (Audio/Display Glasses)

- **Device Availability API**: 装着状態 monitoring (`Lifecycle.State`: STARTED / CREATED / DESTROYED)
- **ProjectedTestRule**: projected test 環境の自動 setup、 unit test 用

### Jetpack Compose Glimmer (Display Glasses)

- **Google Sans Flex font** for optical see-through displays
- 新 components:
  - **Stacks**: touchpad-optimized groups
  - **Title Chips**: content categorization

→ Sotto の 3 zone HUD layout で Title Chips を summary list の visual separator として活用可能、 Stacks は inline code zone の構造化に使える

### Jetpack SceneCore (XR Headsets)

- **GltfModelNode**: 3D model fine-tune、 pose / materials / textures 改変、 node 単位 animation 実行
- **Custom Meshes (experimental)**: `CustomMesh.BuilderFromMeshData` で geometry 構築

### Compose for XR

- **Native glTF support**: `SpatialGltfModel` + `SpatialGltfModelState`
- node 階層 + animation controls アクセス

### ARCore for Jetpack XR

- **Geospatial API preview**: wired XR Glasses 用、 VPS positioning が **87+ countries** で利用可能

## Beta / Stable Roadmap

Core libraries "will be officially moving to Beta soon":

- XR Runtime
- Jetpack SceneCore
- ARCore perception features (Depth Maps, Eye/Hand Tracking, Hit Testing, Spatial Anchors)

Modern, Kotlin-first architecture (legacy Guava/RxJava3 removed)。

## Resources / Samples

- 公式 docs: http://developer.android.com/xr
- XR examples: https://developer.android.com/develop/xr/samples
- XR experiments: https://developer.android.com/develop/xr/experiments
- Catalyst program: g.co/dev/catalyst

## Sotto への影響

1. **Display & Audio glasses 用 Jetpack Projected**: Sotto の AudioBuffer / device 装着状態 monitoring に直結、 spec § 5 components 設計と整合
2. **Compose Glimmer の新 components (Stacks / Title Chips)**: spec § 5 HudPresenter の 3 zone layout で活用、 PoC mock HUD でも採用可
3. **DP4 → Beta 移行 timeline**: Sotto の 2026-08 実装開始時点で Beta 想定、 API 安定性向上が見込める
4. **`SpatialGltfModel`**: spec § 5 HudPresenter の architecture diagram thumbnail zone で 3D 図表示が可能になる (E2 phase で活用)
5. **ARCore Geospatial 87 countries**: Sotto は spatial anchor 不要だが、 v2 以降の「location-based corpus retrieval」 (例: client 訪問時に該当 client 関連 corpus 自動ロード) で活用余地

## 関連

- 設計 spec § 4-5 (Architecture / Components): `../../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- Spice Sutra PoC setup guide (Compose Glimmer 環境構築 知見): `../../../project-aura/application/poc-setup-guide.md`
