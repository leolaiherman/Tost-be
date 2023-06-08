/*
  Warnings:

  - A unique constraint covering the columns `[userPNumber]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Made the column `userPNumber` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User" ALTER COLUMN "userPNumber" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "User_userPNumber_key" ON "User"("userPNumber");
