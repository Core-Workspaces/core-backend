FROM node:22-alpine

WORKDIR /app

RUN apk add --no-cache openssl

COPY package.json ./

RUN npm install

COPY prisma ./prisma
COPY prisma.config.ts ./
COPY tsconfig.json ./
COPY src ./src

ENV DATABASE_URL="postgresql://postgres:postgres@postgres:5432/core"

RUN npx prisma generate
RUN npm run build

EXPOSE 4000

ENV NODE_ENV=production
ENV PORT=4000

CMD ["sh", "-c", "npx prisma migrate deploy && node dist/server.js"]
