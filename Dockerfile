# 选择 node:lts-slim 作为基础镜像
FROM node:lts-slim

# 创建 app 根目录
WORKDIR /app

# 将 package.json 和 package-lock.json 添加到 app 根目录
ADD package*.json ./

# 安装 app 依赖
RUN npm ci --only=production

# 将 app 源码添加到 app 根目录
ADD index.js ./

# 启动 app
CMD [ "npm", "start" ]