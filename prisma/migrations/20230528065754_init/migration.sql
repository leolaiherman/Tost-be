-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "userID" SERIAL NOT NULL,
    "userName" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,
    "userPassword" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userID")
);

-- CreateTable
CREATE TABLE "OrderHistory" (
    "uID" INTEGER NOT NULL,
    "orderID" SERIAL NOT NULL,
    "userEmail" TEXT NOT NULL,
    "content" TEXT,

    CONSTRAINT "OrderHistory_pkey" PRIMARY KEY ("orderID")
);

-- CreateTable
CREATE TABLE "Menu" (
    "menuID" SERIAL NOT NULL,
    "menuName" TEXT NOT NULL,
    "menuPrice" INTEGER NOT NULL,
    "menuDescription" TEXT,

    CONSTRAINT "Menu_pkey" PRIMARY KEY ("menuID")
);

-- CreateTable
CREATE TABLE "Admin" (
    "adminID" SERIAL NOT NULL,
    "adminPassword" TEXT NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("adminID")
);

-- CreateTable
CREATE TABLE "Table" (
    "tableID" SERIAL NOT NULL,
    "tableSize" INTEGER NOT NULL,

    CONSTRAINT "Table_pkey" PRIMARY KEY ("tableID")
);

-- CreateTable
CREATE TABLE "UserOrder" (
    "oID" INTEGER NOT NULL,
    "uID" INTEGER NOT NULL,
    "mID" INTEGER NOT NULL,
    "menuQuantity" INTEGER NOT NULL,
    "orderPax" INTEGER NOT NULL,
    "totalPayment" INTEGER NOT NULL,

    CONSTRAINT "UserOrder_pkey" PRIMARY KEY ("oID")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_userEmail_key" ON "User"("userEmail");

-- CreateIndex
CREATE UNIQUE INDEX "OrderHistory_uID_key" ON "OrderHistory"("uID");

-- CreateIndex
CREATE UNIQUE INDEX "OrderHistory_userEmail_key" ON "OrderHistory"("userEmail");

-- CreateIndex
CREATE UNIQUE INDEX "UserOrder_uID_key" ON "UserOrder"("uID");

-- CreateIndex
CREATE UNIQUE INDEX "UserOrder_mID_key" ON "UserOrder"("mID");

-- AddForeignKey
ALTER TABLE "OrderHistory" ADD CONSTRAINT "OrderHistory_uID_fkey" FOREIGN KEY ("uID") REFERENCES "User"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_oID_fkey" FOREIGN KEY ("oID") REFERENCES "OrderHistory"("orderID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_uID_fkey" FOREIGN KEY ("uID") REFERENCES "User"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_mID_fkey" FOREIGN KEY ("mID") REFERENCES "Menu"("menuID") ON DELETE RESTRICT ON UPDATE CASCADE;
