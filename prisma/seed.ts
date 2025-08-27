
import * as process from "node:process";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  //prisma 연결
  await prisma.$connect();
  //tags에 있는 데이터 모두 삭제
  await prisma.tags.deleteMany({});

  // 초기 세팅되어야 하는 tag 데이터 기본 세팅
  const tags = [
    {
      id: 1,
      name: "첫사랑",
      createdIp: "127.0.0.1"
    },
    {
      id: 2,
      name: "인디밴드",
      createdIp: "127.0.0.1"
    },
    {
      id: 3,
      name: "잔잔한",
      createdIp: "127.0.0.1"
    },
    {
      id: 4,
      name: "락",
      createdIp: "127.0.0.1"
    },
    {
      id: 5,
      name: "여름",
      createdIp: "127.0.0.1"
    },
    {
      id: 6,
      name: "겨울",
      createdIp: "127.0.0.1"
    },
    {
      id: 7,
      name: "이별",
      createdIp: "127.0.0.1"
    },
    {
      id: 8,
      name: "드라이브",
      createdIp: "127.0.0.1"
    },
    {
      id: 9,
      name: "여행",
      createdIp: "127.0.0.1"
    }
  ]

  // seed 데이터 insert
  await prisma.tags.createMany({
    data: tags,
    }
  )
  console.log("tags 시드 데이터 생성");
}

main()
.catch((error) => {
  console.error("시드 데이터 생성 중 오류 발생",error);
  process.exit(1);
})
.finally(async () => {
  await prisma.$disconnect();
});