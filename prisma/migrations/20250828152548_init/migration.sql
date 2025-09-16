/*
  Warnings:

  - You are about to drop the column `updated_id` on the `playlists` table. All the data in the column will be lost.
  - Added the required column `updated_ip` to the `playlists` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "playlists" DROP COLUMN "updated_id",
ADD COLUMN     "updated_ip" VARCHAR(20) NOT NULL;
