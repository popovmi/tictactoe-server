import { NestFactory } from '@nestjs/core';
import cors from 'cors';

import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  const port = process.env.PORT || 8080;

  app.use(
    cors({
      origin: process.env.CORS_ORIGIN,
      credentials: true,
    }),
  );

  await app.listen(port, '0.0.0.0', () => {
    console.log(`Application is running on: http://0.0.0.0:${port}`);
  });
}
bootstrap();
