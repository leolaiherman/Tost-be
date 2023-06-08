-- DropIndex
DROP INDEX "User_userPNumber_key";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "userPNumber" SET DATA TYPE TEXT;
