/*
  Warnings:

  - The primary key for the `account` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[provider,provider_account_id]` on the table `account` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "account" DROP CONSTRAINT "account_pkey";

-- CreateIndex
CREATE UNIQUE INDEX "provider_provider_account_id" ON "account"("provider", "provider_account_id");
