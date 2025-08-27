-- CreateTable
CREATE TABLE "comments" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID,
    "playlist_id" UUID,
    "content" TEXT,
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "created_ip" VARCHAR(20),
    "updated_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_ip" VARCHAR(20),

    CONSTRAINT "pk_comments" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "diggings" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "playlist_id" UUID NOT NULL,
    "user_id" UUID,
    "digged_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "platform" VARCHAR(50),
    "created_ip" VARCHAR(20),

    CONSTRAINT "diggings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inquiries" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID,
    "title" VARCHAR(100),
    "message" TEXT,
    "status" VARCHAR(20),
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "created_id" VARCHAR(100),
    "created_ip" VARCHAR(20),
    "updated_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_id" VARCHAR(100),
    "updated_ip" VARCHAR(20),

    CONSTRAINT "pk_inquiries" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "likes" (
    "user_id" UUID NOT NULL,
    "playlist_id" UUID NOT NULL,
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "created_ip" VARCHAR(20),

    CONSTRAINT "pk_likes" PRIMARY KEY ("user_id","playlist_id")
);

-- CreateTable
CREATE TABLE "playlist_items" (
    "track_order" INTEGER NOT NULL,
    "playlist_id" UUID NOT NULL,
    "track_title" VARCHAR(255),
    "track_artist" VARCHAR(255),
    "track_imgurl" TEXT,
    "track_playtime" VARCHAR(8),
    "created_at" TIMESTAMP(6),
    "created_ip" VARCHAR(20),

    CONSTRAINT "pk_playlist_items" PRIMARY KEY ("track_order","playlist_id")
);

-- CreateTable
CREATE TABLE "playlist_tags" (
    "playlist_id" UUID NOT NULL,
    "tag_id" INTEGER NOT NULL,

    CONSTRAINT "pk_playlist_tags" PRIMARY KEY ("playlist_id","tag_id")
);

-- CreateTable
CREATE TABLE "playlists" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "playlist_title" VARCHAR(100) NOT NULL,
    "playlist_url" TEXT NOT NULL,
    "playlist_description" TEXT,
    "is_public" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_ip" VARCHAR(20) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "updated_id" VARCHAR(100) NOT NULL,

    CONSTRAINT "playlists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "playlists_history" (
    "history_type" VARCHAR(10) NOT NULL,
    "history_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "history_ip" VARCHAR(20) NOT NULL,
    "id" UUID NOT NULL,
    "user_id" UUID,
    "playlist_title" VARCHAR(100) NOT NULL,
    "playlist_url" TEXT NOT NULL,
    "playlist_discription" TEXT,
    "is_public" BOOLEAN DEFAULT true,
    "created_at" TIMESTAMP(6),
    "created_id" VARCHAR(100) NOT NULL,
    "created_ip" VARCHAR(20) NOT NULL,
    "updated_at" TIMESTAMP(6),
    "updated_id" VARCHAR(100) NOT NULL,
    "updated_ip" VARCHAR(20) NOT NULL
);

-- CreateTable
CREATE TABLE "shares" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "playlist_id" UUID NOT NULL,
    "user_id" UUID,
    "shared_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "ip_address" VARCHAR(45),
    "user_agent" TEXT,
    "platform" VARCHAR(50),
    "created_ip" VARCHAR(20),

    CONSTRAINT "shares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tags" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(50),
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "created_ip" VARCHAR(20),

    CONSTRAINT "tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tags_history" (
    "history_type" VARCHAR(10),
    "history_at" TIMESTAMP(6),
    "history_ip" VARCHAR(20),
    "id" INTEGER,
    "name" VARCHAR(50),
    "created_at" TIMESTAMP(6),
    "created_id" VARCHAR(100),
    "created_ip" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "provider" VARCHAR(20) NOT NULL,
    "provider_id" VARCHAR(100) NOT NULL,
    "profile_imageurl" TEXT,
    "nickname" VARCHAR(50),
    "email" VARCHAR(255),
    "password" TEXT,
    "youtube_token" VARCHAR(500),
    "youtube_id" VARCHAR(100),
    "applemusic_token" VARCHAR(500),
    "applemusic_id" VARCHAR(100),
    "spotify_token" VARCHAR(500),
    "spotify_id" VARCHAR(100),
    "melon_token" VARCHAR(500),
    "melon_id" VARCHAR(100),
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "created_ip" VARCHAR(20) NOT NULL,
    "updated_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_ip" VARCHAR(20) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_history" (
    "history_type" VARCHAR(10) NOT NULL,
    "history_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "history_ip" VARCHAR(20) NOT NULL,
    "id" UUID NOT NULL,
    "provider" VARCHAR(20) NOT NULL,
    "provider_id" VARCHAR(100) NOT NULL,
    "profile_imageurl" TEXT,
    "nickname" VARCHAR(50),
    "youtube_token" VARCHAR(500),
    "youtube_id" VARCHAR(100),
    "applemusic_token" VARCHAR(500),
    "applemusic_id" VARCHAR(100),
    "spotify_token" VARCHAR(500),
    "spotify_id" VARCHAR(100),
    "melon_token" VARCHAR(500),
    "melon_id" VARCHAR(100),
    "created_at" TIMESTAMP(6),
    "created_ip" VARCHAR(20) NOT NULL,
    "updated_at" TIMESTAMP(6),
    "updated_ip" VARCHAR(20) NOT NULL
);

-- CreateTable
CREATE TABLE "account" (
    "user_id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "provider_account_id" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "authenticator" (
    "credential_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "provider_account_id" TEXT NOT NULL,
    "credential_public_key" TEXT NOT NULL,
    "counter" INTEGER NOT NULL,
    "credentialDeviceType" TEXT NOT NULL,
    "credentialBackedUp" BOOLEAN NOT NULL,
    "transports" TEXT,

    CONSTRAINT "Authenticator_pkey" PRIMARY KEY ("user_id","credential_id")
);

-- CreateTable
CREATE TABLE "session" (
    "session_token" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verification_token" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VerificationToken_pkey" PRIMARY KEY ("identifier","token")
);

-- CreateIndex
CREATE INDEX "idx_diggings_digged_at" ON "diggings"("digged_at");

-- CreateIndex
CREATE INDEX "idx_diggings_platform" ON "diggings"("platform");

-- CreateIndex
CREATE INDEX "idx_diggings_playlist_id" ON "diggings"("playlist_id");

-- CreateIndex
CREATE INDEX "idx_diggings_user_id" ON "diggings"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_diggings_unique_user_playlist" ON "diggings"("user_id", "playlist_id");

-- CreateIndex
CREATE INDEX "idx_likes_created_at" ON "likes"("created_at");

-- CreateIndex
CREATE INDEX "idx_likes_playlist_id" ON "likes"("playlist_id");

-- CreateIndex
CREATE INDEX "idx_playlists_created_at" ON "playlists"("created_at");

-- CreateIndex
CREATE INDEX "idx_playlists_is_public" ON "playlists"("is_public");

-- CreateIndex
CREATE INDEX "idx_playlists_title" ON "playlists"("playlist_title");

-- CreateIndex
CREATE INDEX "idx_playlists_user_id" ON "playlists"("user_id");

-- CreateIndex
CREATE INDEX "idx_shares_platform" ON "shares"("platform");

-- CreateIndex
CREATE INDEX "idx_shares_playlist_id" ON "shares"("playlist_id");

-- CreateIndex
CREATE INDEX "idx_shares_shared_at" ON "shares"("shared_at");

-- CreateIndex
CREATE INDEX "idx_shares_user_id" ON "shares"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_shares_unique_user_playlist" ON "shares"("user_id", "playlist_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_user_nickname" ON "users"("nickname");

-- CreateIndex
CREATE UNIQUE INDEX "unique_user_email" ON "users"("email");

-- CreateIndex
CREATE INDEX "idx_users_email" ON "users"("email");

-- CreateIndex
CREATE INDEX "idx_users_nickname" ON "users"("nickname");

-- CreateIndex
CREATE INDEX "idx_users_provider" ON "users"("provider");

-- CreateIndex
CREATE INDEX "idx_users_provider_id" ON "users"("provider_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_provider_provider_id_key" ON "users"("provider", "provider_id");

-- CreateIndex
CREATE UNIQUE INDEX "provider_provider_account_id" ON "account"("provider", "provider_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "Authenticator_credentialID_key" ON "authenticator"("credential_id");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "session"("session_token");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_playlist" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diggings" ADD CONSTRAINT "diggings_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "diggings" ADD CONSTRAINT "diggings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "inquiries" ADD CONSTRAINT "inquiries_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlist_items" ADD CONSTRAINT "fk_playlist_items_playlist" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlist_tags" ADD CONSTRAINT "playlist_tags_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlist_tags" ADD CONSTRAINT "playlist_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlists" ADD CONSTRAINT "fk_playlists_user_id" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "shares" ADD CONSTRAINT "shares_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "shares" ADD CONSTRAINT "shares_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "authenticator" ADD CONSTRAINT "Authenticator_userId_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
