/*
  Warnings:

  - You are about to drop the `PAndPS` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `profileServices` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PAndPS" DROP CONSTRAINT "PAndPS_profileService_id_fkey";

-- DropForeignKey
ALTER TABLE "PAndPS" DROP CONSTRAINT "PAndPS_profile_id_fkey";

-- DropTable
DROP TABLE "PAndPS";

-- DropTable
DROP TABLE "profileServices";

-- CreateTable
CREATE TABLE "ProfileService" (
    "serviceCode" INTEGER NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "service_id" INTEGER NOT NULL,

    CONSTRAINT "ProfileService_pkey" PRIMARY KEY ("profile_id","service_id")
);

-- CreateTable
CREATE TABLE "Service" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ProfileService_serviceCode_key" ON "ProfileService"("serviceCode");

-- AddForeignKey
ALTER TABLE "ProfileService" ADD CONSTRAINT "ProfileService_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileService" ADD CONSTRAINT "ProfileService_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "Service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
