#!/bin/bash
# 部署脚本 - GitHub Pages

set -e

REPO_DIR="/e/Hermes/00-配置档案总库/默认配置/04-成品导出目录"
GIT_REPO="https://github.com/hazhanglei/wire-impedance-calc.git"

echo "=================================="
echo "  线材阻抗计算工具 - 部署脚本"
echo "=================================="
echo ""

cd "$REPO_DIR"

# 检查git状态
echo "1. 检查Git状态..."
git status --short

# 添加所有更改
echo ""
echo "2. 添加文件到Git..."
git add -A
git commit -m "update: $(date '+%Y-%m-%d %H:%M')" || echo "No changes to commit"

# 推送到GitHub
echo ""
echo "3. 推送到GitHub..."
git push origin main

echo ""
echo "=================================="
echo "  部署完成！"
echo "=================================="
echo ""
echo "请访问：https://hazhanglei.github.io/wire-impedance-calc/"
echo ""
echo "如果页面空白，请在GitHub仓库设置中启用Pages："
echo "  Settings → Pages → Source: main branch → Save"
echo ""
