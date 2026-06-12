# 《置身钉内》互动导读｜钉钉 ONE 项目与组织复盘

这是一个单页静态交互式 HTML 信息页面，可本地预览，也可通过 GitHub Pages 发布。

## 内容边界

- 页面类型：互动导读 / 组织复盘 / AI 办公产品案例解读。
- 内容来源：用户确认的 HTML 文件，页面内列明公开报道和转载入口。
- 版权边界：页面不嵌入《置身钉内》全文，仅提供摘要、结构化导读、来源入口和分析性整理。
- 公开性提醒：GitHub Pages 默认可公开访问；发布前请再次确认页面中不存在内部资料、客户敏感信息、账号凭证或个人隐私。

## 本地预览

```bash
python -m http.server 8000
```

然后打开：`http://localhost:8000`

也可以直接双击 `index.html` 查看，但建议使用本地 HTTP 服务以便模拟真实发布环境。

## 文件结构

```text
.
├── index.html
├── README.md
├── DEPLOYMENT.md
├── CODEX_PROMPT.md
├── MANIFEST.json
├── HTML_AUDIT.md
├── PACKAGE_QA.md
├── .nojekyll
├── .github/
│   └── workflows/
│       └── pages.yml
└── scripts/
    ├── setup_pages_branch.sh
    ├── setup_pages_branch.ps1
    ├── generate_qr.py
    └── export_pdf_playwright.js
```

## 交互功能

- 页面内搜索与命中高亮
- 上一个 / 下一个搜索结果跳转
- 分类筛选
- 锚点导航
- 移动端响应式布局
- 返回顶部锚点
- print / PDF 基础样式

## 当前状态

- HTML 文件：已纳入部署包
- 部署方式：GitHub Pages / GitHub Actions
- 发布状态：待 Codex 或本地终端执行发布
- 发布后动作：获取 Pages URL 后执行 Release Audit
