import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, //config 모듈에서 가져온 모든 설정을 전역적으로 사용 가능함.
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
