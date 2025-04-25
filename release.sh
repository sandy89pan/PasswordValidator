#!/bin/bash

# 使用方式: ./release.sh 0.1.2

# 获取新版本号
VERSION=$1

# 校验输入
if [ -z "$VERSION" ]; then
  echo "❌ 请提供版本号，例如：./release.sh 0.1.2"
  exit 1
fi

# 获取当前 podspec 文件名（假设当前目录只有一个 .podspec）
PODSPEC_FILE=$(ls *.podspec | head -n 1)

if [ ! -f "$PODSPEC_FILE" ]; then
  echo "❌ 找不到 .podspec 文件"
  exit 1
fi

# 修改 podspec 中的版本号
echo "🔧 正在更新 $PODSPEC_FILE 中的版本号为 $VERSION ..."
sed -i '' "s/^\(\s*s.version\s*=\s*\).*$/\1'$VERSION'/" "$PODSPEC_FILE"

# 提交更改
echo "📦 提交代码更改..."
git add .
git commit -m "Release $VERSION"

# 打 tag
echo "🏷 生成 Git tag $VERSION ..."
git tag $VERSION

# 推送代码 & tag
echo "🚀 推送代码和 tag ..."
git push
git push origin $VERSION

# 提示
echo "✅ 已完成发布准备，可执行 pod trunk push"

