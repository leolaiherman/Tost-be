/*
  Warnings:

  - You are about to drop the column `totalPayment` on the `UserOrder` table. All the data in the column will be lost.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[tID]` on the table `UserOrder` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[pID]` on the table `UserOrder` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `tableQuantity` to the `Table` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderCreateOrderDate` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderDate` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderDineInStatus` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderPrice` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderSystemStatus` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderTime` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pID` to the `UserOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tID` to the `UserOrder` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Table" ADD COLUMN     "tableQuantity" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "UserOrder" DROP COLUMN "totalPayment",
ADD COLUMN     "orderCreateOrderDate" DATE NOT NULL,
ADD COLUMN     "orderDate" DATE NOT NULL,
ADD COLUMN     "orderDineInStatus" BOOLEAN NOT NULL,
ADD COLUMN     "orderNotes" TEXT,
ADD COLUMN     "orderPrice" INTEGER NOT NULL,
ADD COLUMN     "orderSystemStatus" BOOLEAN NOT NULL,
ADD COLUMN     "orderTime" TIME NOT NULL,
ADD COLUMN     "pID" INTEGER NOT NULL,
ADD COLUMN     "tID" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "Payment" (
    "paymentID" SERIAL NOT NULL,
    "paymentValue" INTEGER NOT NULL,
    "paymentStatus" INTEGER NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("paymentID")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserOrder_tID_key" ON "UserOrder"("tID");

-- CreateIndex
CREATE UNIQUE INDEX "UserOrder_pID_key" ON "UserOrder"("pID");

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_tID_fkey" FOREIGN KEY ("tID") REFERENCES "Table"("tableID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_pID_fkey" FOREIGN KEY ("pID") REFERENCES "Payment"("paymentID") ON DELETE RESTRICT ON UPDATE CASCADE;
