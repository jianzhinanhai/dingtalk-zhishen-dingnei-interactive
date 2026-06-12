# Codex Prompt: Publish confirmed interactive HTML to GitHub Pages

你现在负责将一个已确认的单页交互式 HTML 信息页面发布到 GitHub Pages。

## 一、任务目标

基于当前项目文件夹，创建或更新 GitHub 仓库，并将 `index.html` 发布为 GitHub Pages 站点。

页面标题：《置身钉内》互动导读｜钉钉 ONE 项目与组织复盘

建议仓库名：`dingtalk-zhishen-dingnei-interactive`

目标仓库：`<OWNER>/dingtalk-zhishen-dingnei-interactive`，如用户未指定 owner，请使用当前 GitHub 登录账号。

发布方式：GitHub Pages + GitHub Actions workflow。

## 二、输入文件

项目文件夹应包含：

```text
index.html
README.md
DEPLOYMENT.md
CODEX_PROMPT.md
MANIFEST.json
HTML_AUDIT.md
PACKAGE_QA.md
.nojekyll
.github/workflows/pages.yml
scripts/setup_pages_branch.sh
scripts/setup_pages_branch.ps1
scripts/generate_qr.py
scripts/export_pdf_playwright.js
```

## 三、强制安全规则

1. 不得要求用户在聊天中提供 GitHub 密码。
2. 不得要求用户在聊天中粘贴 GitHub token。
3. 不得要求用户提供 SSH 私钥或 2FA code。
4. 使用 `gh auth login` 进行浏览器授权。
5. GitHub Pages 默认按公开站点处理；发布前再次提醒用户确认无敏感信息。
6. 不要重写正文内容，除非是部署兼容性必要修改。
7. 不要删除 `MANIFEST.json`、`.nojekyll`、workflow、README 或部署说明。

## 四、执行步骤

### 1. 文件检查

- 确认 `index.html` 存在且非空。
- 确认 `MANIFEST.json` 是合法 JSON。
- 确认 `.github/workflows/pages.yml` 存在。
- 确认 `.nojekyll` 存在。
- 本地启动预览：

```bash
python -m http.server 8000
```

检查页面首屏、导航、搜索框、搜索高亮、筛选按钮、返回顶部。

### 2. GitHub 授权

```bash
gh auth status || gh auth login
```

如未登录，等待用户在浏览器完成授权，不要索要任何凭证。

### 3. 初始化仓库并提交

```bash
git init
git branch -M main
git add .
git commit -m "Publish DingTalk interactive insight page"
```

如仓库不存在，创建：

```bash
gh repo create dingtalk-zhishen-dingnei-interactive --public --source=. --remote=origin --push
```

如用户要求私有仓库，将 `--public` 改为 `--private`，但仍需提示 Pages 访问权限需单独验证。

如仓库已存在：

```bash
git remote add origin <repo-url> || git remote set-url origin <repo-url>
git push -u origin main
```

### 4. 启用 GitHub Pages

优先使用 GitHub Actions source。

检查仓库设置：`Settings → Pages → Build and deployment → Source: GitHub Actions`。

如可通过 CLI/API 配置，则配置 Pages 使用 GitHub Actions；如无法自动配置，返回明确的手工设置路径。

### 5. 检查部署状态

- 打开 GitHub Actions，确认 Pages workflow 成功。
- 获取 Pages URL。
- 桌面端访问一次。
- 尽可能用移动端 viewport 检查一次。
- 测试搜索关键词：`ONE`、`无招`、`敏捷`。
- 测试分类筛选：`产品定位`、`AI 办公`、`组织管理`。

## 五、返回格式

请按以下格式返回：

```text
Repository URL:
Pages URL:
Latest commit hash:
Deployment status: Success / Failed / Pending
Desktop check:
Mobile viewport check:
Search/filter check:
Known issues:
Remediation steps:
```

## 六、禁止事项

- 不要把 GitHub token 写入任何文件。
- 不要把本地绝对路径、临时文件、系统隐藏文件写入仓库。
- 不要发布包含敏感信息的替代版本。
- 不要将外部转载全文复制进 `index.html`。
