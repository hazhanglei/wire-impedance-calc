#!/bin/bash
# 使用 Surge.sh 快速部署（无需账号）

SITE_NAME="wire-impedance-$(date +%s)"
DEPLOY_DIR="/e/Hermes/00-配置档案总库/默认配置/04-成品导出目录"

echo "=================================="
echo "  线材阻抗计算工具 - Surge部署"
echo "=================================="
echo ""

cd "$DEPLOY_DIR"

# 检查surge
if ! command -v surge &> /dev/null; then
    echo "安装Surge..."
    npm install -g surge --registry=https://registry.npmmirror.com 2>&1
fi

if ! command -v surge &> /dev/null; then
    echo ""
    echo "=================================="
    echo "  Surge安装失败"
    echo "=================================="
    echo ""
    echo "请手动安装："
    echo "  npm install -g surge"
    echo ""
    echo "或使用本地服务器方案："
    echo "  python serve_wire_calc.py"
    exit 1
fi

echo "部署到Surge..."
echo ""
surge --project . --domain "${SITE_NAME}.surge.sh"

echo ""
echo "=================================="
echo "  部署完成！"
echo "=================================="
echo ""
echo "访问地址：https://${SITE_NAME}.surge.sh"
echo ""
