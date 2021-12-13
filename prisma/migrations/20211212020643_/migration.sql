
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);


CREATE TABLE "Film" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "actors" TEXT NOT NULL,
    "producers" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "release_year" TEXT NOT NULL,
    "linkImage" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Film_pkey" PRIMARY KEY ("id")
);


CREATE TABLE "_FilmToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);


CREATE UNIQUE INDEX "User_email_key" ON "User"("email");


CREATE UNIQUE INDEX "Film_name_key" ON "Film"("name");


CREATE UNIQUE INDEX "_FilmToUser_AB_unique" ON "_FilmToUser"("A", "B");


CREATE INDEX "_FilmToUser_B_index" ON "_FilmToUser"("B");


ALTER TABLE "_FilmToUser" ADD FOREIGN KEY ("A") REFERENCES "Film"("id") ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE "_FilmToUser" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
