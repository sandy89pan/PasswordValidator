#!/bin/bash

# 使用方式: ./release.sh 0.1.2

# 获取新版本号
VERSION=$1

# 校验输入
if [ -z "$VERSION" ]; then
  echo "❌ 请输入版本号，例如：./release.sh 0.1.2"
  exit 1
fi

# 获取 podspec 文件
PODSPEC_FILE=$(ls *.podspec | head -n 1)

if [ ! -f "$PODSPEC_FILE" ]; then
  echo "❌ 没有找到 .podspec 文件"
  exit 1
fi

echo "📄 使用 podspec 文件: $PODSPEC_FILE"

# 修改 podspec 中版本号
echo "🔧 修改版本号为 $VERSION ..."
sed -i '' "s/^\(\s*s.version\s*=\s*\).*$/\1'$VERSION'/" "$PODSPEC_FILE"

# 提交更改
echo "📦 提交更改到 Git ..."
git add .
git commit -m "Release $VERSION"

# 打 tag
echo "🏷 创建 tag: $VERSION ..."
git tag "$VERSION"

# 推送代码和 tag
echo "🚀 推送代码和 tag 到远程仓库..."
git push
git push origin "$VERSION"

# 执行 pod trunk push
echo "📡 执行 pod trunk push ..."
pod trunk push "$PODSPEC_FILE"

# 完成
echo "✅ 完成发布: $VERSION 🎉"


