/*
  Warnings:

  - You are about to alter the column `name` on the `Merchant` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(120)`.
  - You are about to alter the column `email` on the `Merchant` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(180)`.
  - You are about to alter the column `title` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(150)`.
  - You are about to alter the column `name` on the `Tag` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - A unique constraint covering the columns `[slug]` on the table `Tag` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `slug` to the `Tag` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ProductStatus" AS ENUM ('DRAFT', 'PUBLISHED', 'ARCHIVED');

-- AlterTable
ALTER TABLE "Merchant" ADD COLUMN     "country" VARCHAR(2) NOT NULL DEFAULT 'US',
ALTER COLUMN "name" SET DATA TYPE VARCHAR(120),
ALTER COLUMN "email" SET DATA TYPE VARCHAR(180);

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "status" "ProductStatus" NOT NULL DEFAULT 'DRAFT',
ADD COLUMN     "stock" INTEGER NOT NULL DEFAULT 0,
ALTER COLUMN "title" SET DATA TYPE VARCHAR(150);

-- AlterTable
ALTER TABLE "Tag" ADD COLUMN     "slug" VARCHAR(50) NOT NULL,
ALTER COLUMN "name" SET DATA TYPE VARCHAR(50);

-- CreateIndex
CREATE INDEX "Merchant_email_idx" ON "Merchant"("email");

-- CreateIndex
CREATE INDEX "Product_merchantId_idx" ON "Product"("merchantId");

-- CreateIndex
CREATE INDEX "Product_status_price_idx" ON "Product"("status", "price");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_slug_key" ON "Tag"("slug");
