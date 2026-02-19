BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "google_place_locations" (
    "id" bigserial PRIMARY KEY,
    "providerPlaceId" text NOT NULL,
    "name" text NOT NULL,
    "formattedAddress" text,
    "shortFormattedAddress" text,
    "lat" double precision NOT NULL,
    "lng" double precision NOT NULL,
    "url" text,
    "websiteUri" text,
    "phoneNumber" text,
    "types" json,
    "primaryType" text,
    "rating" double precision,
    "userRatingCount" bigint,
    "priceLevel" text,
    "primaryPhotoName" text,
    "timezone" text,
    "isPublicPlace" boolean NOT NULL DEFAULT true,
    "notes" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "provider_place_id_unique_idx" ON "google_place_locations" USING btree ("providerPlaceId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "locations" (
    "id" bigserial PRIMARY KEY,
    "googlePlaceLocationId" bigint,
    "manualInputLocationId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "location_google_place_unique_idx" ON "locations" USING btree ("googlePlaceLocationId");
CREATE UNIQUE INDEX "location_manual_input_unique_idx" ON "locations" USING btree ("manualInputLocationId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "manual_input_locations" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text,
    "cityName" text NOT NULL,
    "country" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_in_person_proof" (
    "id" bigserial PRIMARY KEY,
    "matchId" bigint NOT NULL,
    "groupPhotoUrl" text NOT NULL,
    "boardPhotoUrl" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "match_in_person_proof_match_unique_idx" ON "match_in_person_proof" USING btree ("matchId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_schedule_pairing_attempt" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "title" text NOT NULL,
    "description" text,
    "aditionalLocationInfo" text,
    "minAmountOfPlayers" text NOT NULL,
    "maxAmountOfPlayers" text NOT NULL,
    "attemptedAt" timestamp without time zone NOT NULL,
    "locationId" bigint NOT NULL,
    "playerDataId" bigint NOT NULL
);

-- Indexes
CREATE INDEX "location_id_idx" ON "match_schedule_pairing_attempt" USING btree ("locationId");
CREATE INDEX "player_data_id_idx" ON "match_schedule_pairing_attempt" USING btree ("playerDataId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_subscriptions" (
    "id" bigserial PRIMARY KEY,
    "subscribedAt" timestamp without time zone NOT NULL,
    "matchSchedulePairingAttemptId" bigint NOT NULL,
    "playerDataId" bigint NOT NULL
);

-- Indexes
CREATE INDEX "match_schedule_pairing_attempt_id_idx" ON "match_subscriptions" USING btree ("matchSchedulePairingAttemptId");
CREATE INDEX "subscription_player_data_id_idx" ON "match_subscriptions" USING btree ("playerDataId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "played_match" (
    "id" bigserial PRIMARY KEY,
    "matchStartedAt" timestamp without time zone NOT NULL,
    "matchDuration" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_data" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "currentCountry" text,
    "nationality" text,
    "favoriteFaction" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "auth_user_id_unique_idx" ON "player_data" USING btree ("authUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_in_match" (
    "id" bigserial PRIMARY KEY,
    "playerId" bigint NOT NULL,
    "matchId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "player_match_unique_idx" ON "player_in_match" USING btree ("playerId", "matchId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "likesCount" bigint NOT NULL,
    "language" text NOT NULL,
    "attachedMatchId" bigint,
    "authorId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment" (
    "id" bigserial PRIMARY KEY,
    "content" text NOT NULL,
    "language" text NOT NULL,
    "postId" bigint NOT NULL,
    "ownerId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "locations"
    ADD CONSTRAINT "locations_fk_0"
    FOREIGN KEY("googlePlaceLocationId")
    REFERENCES "google_place_locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "locations"
    ADD CONSTRAINT "locations_fk_1"
    FOREIGN KEY("manualInputLocationId")
    REFERENCES "manual_input_locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_in_person_proof"
    ADD CONSTRAINT "match_in_person_proof_fk_0"
    FOREIGN KEY("matchId")
    REFERENCES "played_match"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_schedule_pairing_attempt"
    ADD CONSTRAINT "match_schedule_pairing_attempt_fk_0"
    FOREIGN KEY("locationId")
    REFERENCES "locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_schedule_pairing_attempt"
    ADD CONSTRAINT "match_schedule_pairing_attempt_fk_1"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_subscriptions"
    ADD CONSTRAINT "match_subscriptions_fk_0"
    FOREIGN KEY("matchSchedulePairingAttemptId")
    REFERENCES "match_schedule_pairing_attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_subscriptions"
    ADD CONSTRAINT "match_subscriptions_fk_1"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player_data"
    ADD CONSTRAINT "player_data_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player_in_match"
    ADD CONSTRAINT "player_in_match_fk_0"
    FOREIGN KEY("playerId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "player_in_match"
    ADD CONSTRAINT "player_in_match_fk_1"
    FOREIGN KEY("matchId")
    REFERENCES "played_match"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_0"
    FOREIGN KEY("attachedMatchId")
    REFERENCES "played_match"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_1"
    FOREIGN KEY("authorId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260219221253471-location-inheritance-support', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260219221253471-location-inheritance-support', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260129181124635', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181124635', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
