import { Controller, Get, Req, UseGuards } from "@nestjs/common";
import { ApiBearerAuth } from "@nestjs/swagger";
import { Request } from "express";

import { AppService } from "./app.service";
import { AccessTokenGuard } from "./auth/guards/access-token.guard";

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get("user-test")
  @UseGuards(AccessTokenGuard)
  @ApiBearerAuth("access-token")
  testUser(@Req() req: Request) {
    console.log(req.user);

    return "test 완료";
  }
}
