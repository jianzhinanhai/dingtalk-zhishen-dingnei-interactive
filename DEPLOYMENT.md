# Deployment Guide

## 目标

将 `index.html` 发布为 GitHub Pages 静态站点。

## 推荐方式：GitHub Actions 发布

本包已包含 `.github/workflows/pages.yml`，推送到 `main` 分支后，可通过 GitHub Pages 的 GitHub Actions 源完成部署。

## 操作步骤

### 1. 检查文件

```bash
ls -la
python -m http.server 8000
```

本地打开 `http://localhost:8000`，确认首屏、搜索、筛选、导航和移动端布局正常。

### 2. GitHub 登录

```bash
gh auth status || gh auth login
```

安全规则：不要在聊天中粘贴 GitHub 密码、token、SSH 私钥或 2FA code；使用浏览器授权。

### 3. 初始化并发布

```bash
git init
git branch -M main
git add .
git commit -m "Publish DingTalk interactive insight page"
gh repo create dingtalk-zhishen-dingnei-interactive --public --source=. --remote=origin --push
```

如需私有仓库，可将 `--public` 改为 `--private`。但请注意：GitHub Pages 站点访问权限取决于账号/组织计划和 Pages 设置，不能简单等同于仓库私有。

### 4. 启用 Pages

进入 GitHub 仓库：

`Settings → Pages → Build and deployment → Source: GitHub Actions`

或由 Codex / GitHub CLI 检查并配置。

GitHub 官方文档说明，Pages 可以从分支发布，也可以使用 GitHub Actions workflow 发布；本包采用后者。

### 5. 发布后验收

Codex 或操作者需返回：

- Repository URL
- Pages URL
- Latest commit hash
- Deployment status
- Build errors, if any
- Remediation steps, if any

拿到 Pages URL 后，应执行发布后审计：桌面端、手机端、搜索、高亮、筛选、导航、返回顶部、来源边界、敏感信息。

## 常见问题

### 页面显示为 404

- 检查 Actions 是否完成。
- 检查 Pages source 是否选择 GitHub Actions。
- 检查仓库是否包含 `.github/workflows/pages.yml`。
- 等待 GitHub Pages 首次部署完成。

### CSS/JS 不生效

本页面为单文件 HTML，CSS/JS 内嵌在 `index.html` 中；通常不是路径问题。优先检查是否被浏览器缓存或文件未正确推送。

### 搜索或筛选异常

请先在本地 HTTP 服务复现，再检查浏览器 Console。不要在发布时重写页面内容。
