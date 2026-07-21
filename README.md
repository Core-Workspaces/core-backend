# Core Backend
Esta API é responsável por todo ecosistema da plataforma do Core.

## Tecnologias

- Node.js
- Typescript
- Prisma ORM
- PostgreSQL

## Requisitos

- Node.js >= 20
- PostgreSQL
- Docker e Docker Compose (opcional, para subir tudo com containers)

## Rode com Docker

1. Certifique-se de que o Docker Desktop está em execução.
2. Na raiz do projeto, suba a API e o banco:

```bash
docker compose up --build
```

Para rodar em segundo plano:

```bash
docker compose up --build -d
```

3. A API ficará disponível em `http://localhost:4000`.

O `docker-compose.yml` sobe dois serviços:

- **postgres** — PostgreSQL na porta `5432`
- **api** — aplicação na porta `4000`, com migrations aplicadas automaticamente via `prisma migrate deploy`

Para parar os containers:

```bash
docker compose down
```

Para parar e remover os dados do banco:

```bash
docker compose down -v
```

## Rode Localmente

1. Instale as dependências:

```bash
npm install
```

2. Crie um `.env` com base no `.env.example`:

```env
PORT=4000
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/core"
```

3. Suba o PostgreSQL (pode usar só o serviço de banco do Docker):

```bash
docker compose up postgres -d
```

4. Rode as migrations da database:

```bash
npx prisma migrate dev
```

5. Rode a API no modo de desenvolvimento:

```bash
npm run dev
```

A API ficará disponível em `http://localhost:4000`.