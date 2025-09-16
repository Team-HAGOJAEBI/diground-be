import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma/prisma.service";
import { Playlists, Prisma } from "@prisma/client";
import { CreatePlaylistDto } from "./dto/create-playlist.dto";

@Injectable()
export class PlaylistsService {
  constructor(private prisma: PrismaService) {}

  //Playlist insert
  async create(userId: string, createPlaylistDto: CreatePlaylistDto): Promise<Playlists> {
    return this.prisma.playlists.create({
      data: {
        userId: userId,
        ...createPlaylistDto,
        createdIp: "127.0.0.1",
        updatedIp: "127.0.0.1",
      },
    });
  }

  // playlist findAll
  async findAll(params: {
    skip?: number; //검색 결과에서 건너뛸 항목의 수를 지정하는 속성으로, 페이지네이션에서 주로 사용됨
    take?: number; //가져올 항목의 수를 지정하는 속성으로, 일반적으로 페이지네이션과 함께 사용
    cursor?: Prisma.PlaylistsWhereUniqueInput; //마지막 항목의 인덱스를 저장하는 속성으로, 페이지 네이션에서 주로 사용됨. (offset과 비교)
    where?: Prisma.PlaylistsWhereInput; //검색 조건을 지정하는 속성
    orderBy?: Prisma.PlaylistsOrderByWithRelationInput; //결과를 정렬하는 속성
  }): Promise<Playlists[]> {
    const { skip, take, cursor, where, orderBy } = params;

    return this.prisma.playlists.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }
  // playlist findone
  async findOne(playlistId: string, include?: string[]): Promise<Playlists | null> {
    const includeObject = {};

    if (include) {
      include.forEach((item) => {
        includeObject[item] = true;
      });
    }

    const playlist = await this.prisma.playlists.findUnique({
      where: { id: playlistId },
      include: include?.length ? includeObject : undefined,
    });

    return playlist;
  }
}
