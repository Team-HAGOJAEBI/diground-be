import { Injectable, OnModuleInit } from "@nestjs/common";
import { PrismaClient } from "@prisma/client";

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  // 프리즈마 모듈이 Init 될 때 연결
  async onModuleInit() {
    await this.$connect();
  }
}
