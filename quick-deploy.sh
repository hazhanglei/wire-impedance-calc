#!/bin/bash
# 快速部署脚本 - 使用 Surge.sh（无需账号）

echo "=================================="
echo "  线材阻抗计算工具 - 快速部署"
echo "=================================="
echo ""

SITE_NAME="wire-impedance-$(date +%s)"
DEPLOY_DIR="/e/Hermes/00-配置档案总库/默认配置/04-成品导出目录"

echo "1. 检查Surge CLI..."
if ! command -v surge &> /dev/null; then
    echo "   安装Surge..."
    npm install -g surge 2>/dev/null || {
        echo "   Surge安装失败，尝试备选方案..."
        echo ""
        echo "=================================="
        echo "  备选方案：本地服务器"
        echo "=================================="
        echo ""
        echo "运行以下命令启动本地服务器："
        echo "  cd $DEPLOY_DIR"
        echo "  python serve_wire_calc.py"
        echo ""
        echo "然后手机访问：http://<电脑IP>:8765"
        exit 0
    }
fi

echo "2. 部署到Surge..."
cd "$DEPLOY_DIR"
surge --project . --domain "${SITE_NAME}.surge.sh" 2>&1

echo ""
echo "=================================="
echo "  部署完成！"
echo "=================================="
echo ""
echo "访问地址：https://${SITE_NAME}.surge.sh"
echo ""
