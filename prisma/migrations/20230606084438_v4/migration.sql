/*
  Warnings:

  - The `orderDineInStatus` column on the `UserOrder` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `orderSystemStatus` column on the `UserOrder` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Admin` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OrderHistory` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "OrderHistory" DROP CONSTRAINT "OrderHistory_uID_fkey";

-- DropForeignKey
ALTER TABLE "UserOrder" DROP CONSTRAINT "UserOrder_oID_fkey";

-- DropIndex
DROP INDEX "UserOrder_mID_key";

-- AlterTable
CREATE SEQUENCE userorder_oid_seq;
ALTER TABLE "UserOrder" ALTER COLUMN "oID" SET DEFAULT nextval('userorder_oid_seq'),
DROP COLUMN "orderDineInStatus",
ADD COLUMN     "orderDineInStatus" "status" NOT NULL DEFAULT 'IN_PROGRESS',
DROP COLUMN "orderSystemStatus",
ADD COLUMN     "orderSystemStatus" "status" NOT NULL DEFAULT 'IN_PROGRESS';
ALTER SEQUENCE userorder_oid_seq OWNED BY "UserOrder"."oID";

-- DropTable
DROP TABLE "Admin";

-- DropTable
DROP TABLE "OrderHistory";
