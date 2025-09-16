import { Post, UseGuards, Req, Body, Get, Query } from "@nestjs/common";
import { ApiBearerAuth, ApiQuery } from "@nestjs/swagger";
import { Controller } from "@nestjs/common";
import { PlaylistsService } from "./playlists.service";
import { AccessTokenGuard } from "src/auth/guards/access-token.guard";
import { CreatePlaylistDto } from "./dto/create-playlist.dto";
import { Request } from "express";
import { Prisma } from "@prisma/client";

@Controller("playlists")
export class PlaylistsController {
  constructor(private readonly playlistsService: PlaylistsService) {}

  @Post()
  @UseGuards(AccessTokenGuard)
  @ApiBearerAuth("access-token")
  createPlaylist(@Req() req: Request & { user: { sub: string } }, @Body() createPlaylistDto: CreatePlaylistDto) {
    return this.playlistsService.create(req.user.sub, createPlaylistDto);
  }

  @Get()
  @ApiQuery({ name: "userId", required: false })
  @ApiQuery({ name: "playlistTitle", required: false })
  @ApiQuery({ name: "skip", required: false })
  @ApiQuery({ name: "take", required: false })
  findAllPlaylists(
    @Query("userId") userId?: string,
    @Query("playlistTitle") playlistTitle?: string,
    @Query("skip") skip?: string,
    @Query("take") take?: string
  ) {
    const where: Prisma.PlaylistsWhereInput = {};

    if (userId) {
      where.userId = userId;
    }
    if (playlistTitle) {
      where.playlistTitle = { contains: playlistTitle, mode: "insensitive" };
    }

    return this.playlistsService.findAll({
      where,
      skip: skip ? parseInt(skip) : undefined,
      take: take ? parseInt(take) : undefined,
      orderBy: {
        createdAt: "desc",
      },
    });
  }
}
