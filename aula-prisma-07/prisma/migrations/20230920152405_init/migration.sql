-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profiles" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "id" SERIAL NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "zipcode" INTEGER NOT NULL,
    "profile_id" INTEGER NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profileServices" (
    "id" SERIAL NOT NULL,
    "serviceCode" INTEGER NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "service_id" INTEGER NOT NULL,

    CONSTRAINT "profileServices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PAndPS" (
    "profile_id" INTEGER NOT NULL,
    "profileService_id" INTEGER NOT NULL,

    CONSTRAINT "PAndPS_pkey" PRIMARY KEY ("profile_id","profileService_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profiles_userId_key" ON "profiles"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "addresses_zipcode_key" ON "addresses"("zipcode");

-- CreateIndex
CREATE UNIQUE INDEX "profileServices_serviceCode_key" ON "profileServices"("serviceCode");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PAndPS" ADD CONSTRAINT "PAndPS_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PAndPS" ADD CONSTRAINT "PAndPS_profileService_id_fkey" FOREIGN KEY ("profileService_id") REFERENCES "profileServices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
