import { Module } from "@nestjs/common";
import { PlaylistsService } from "./playlists.service";
import { PlaylistsController } from "./playlists.controller";
import { PrismaModule } from "../prisma/prisma.module";

@Module({
  imports: [PrismaModule],
  controllers: [PlaylistsController],
  providers: [PlaylistsService],
  exports: [PlaylistsService],
})
export class PlaylistsModule {}
