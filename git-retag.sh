#!/bin/bash

# 检查是否输入 2 个参数
if [ $# -ne 2 ]; then
    echo "用法: $0 <版本号> <备注信息>"
    echo "示例: $0 1.0.9 '1.0.9.3'"
    exit 1
fi

TAG=$1
MESSAGE=$2

echo "====================================="
echo "即将重新打标签: $TAG"
echo "备注信息: $MESSAGE"
echo "====================================="

# 1. 删除本地标签
echo -e "\n1. 删除本地标签: $TAG"
git tag -d "$TAG"

# 2. 删除远程标签
echo -e "\n2. 删除远程标签: $TAG"
git push origin --delete "$TAG"

# 3. 重新打标签
echo -e "\n3. 创建新标签: $TAG"
git tag -a "$TAG" -m "$MESSAGE"

# 4. 推送到远程
echo -e "\n4. 推送标签到远程"
git push origin "$TAG"

echo -e "\n====================================="
echo "✅ 标签 $TAG 处理完成！"
echo "====================================="