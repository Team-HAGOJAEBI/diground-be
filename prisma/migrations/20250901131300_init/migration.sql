-- AlterTable
ALTER TABLE "account" ALTER COLUMN "updated_at" DROP DEFAULT,
ADD CONSTRAINT "account_pkey" PRIMARY KEY ("provider", "provider_account_id");

-- DropIndex
DROP INDEX "provider_provider_account_id";

-- AlterTable
ALTER TABLE "comments" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "playlists" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "session" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "updated_at" DROP DEFAULT;
