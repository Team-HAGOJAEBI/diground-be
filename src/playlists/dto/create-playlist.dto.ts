import { ApiProperty } from "@nestjs/swagger";
import { IsArray, IsBoolean, IsOptional, IsString } from "class-validator";

export class CreatePlaylistDto {
  @ApiProperty({ description: "플레이리스트 제목" })
  @IsString()
  playlistTitle: string;
  @ApiProperty({ description: "플레이리스트 URL (플렛폼에서 가져올때 사용)" })
  @IsString()
  playlistUrl: string;
  @ApiProperty({ description: "플레이리스트 설명" })
  @IsString()
  playlistDescription: string;
  @ApiProperty({ description: "플레이리스트 공개여부" })
  @IsBoolean()
  isPublic: boolean;
  @ApiProperty({ description: "플레이리스트 테그 목록" })
  @IsArray()
  @IsOptional()
  playlistTags: string[];
}
