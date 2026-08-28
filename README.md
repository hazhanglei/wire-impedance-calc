# 线材阻抗计算工具 - 部署完成

## 访问方式

### 方式1：GitHub Pages（推荐）
**网站地址：https://hazhanglei.github.io/wire-impedance-calc/**

⚠️ **需要在GitHub上手动启用Pages：**
1. 打开 https://github.com/hazhanglei/wire-impedance-calc/settings/pages
2. Source选择：`main` branch, `/ (root)`
3. 点击Save
4. 等待1-2分钟后访问上述链接

### 方式2：本地服务器（立即可用）
```bash
cd /e/Hermes/00-配置档案总库/默认配置/04-成品导出目录
python serve_wire_calc.py
```
手机访问：`http://<电脑IP>:8765`

查看电脑IP：
```bash
ip addr show | grep "inet " | grep -v 127.0.0.1
```

## 手机使用说明

1. **GitHub Pages方式**：手机浏览器直接访问 https://hazhanglei.github.io/wire-impedance-calc/
2. **本地服务器方式**：确保手机和电脑在同一WiFi，浏览器访问 http://<电脑IP>:8765

## 数据共享

由于iOS限制，使用剪贴板共享数据：
- 导出：点击「📦 导出」→ 复制JSON
- 导入：点击「📥 导入」→ 粘贴JSON → 确认

## 文件位置
- HTML工具：`E:\Hermes\00-配置档案总库\默认配置\04-成品导出目录\WireImpedanceCalc.html`
- 服务器脚本：`serve_wire_calc.py`
- GitHub仓库：https://github.com/hazhanglei/wire-impedance-calc
