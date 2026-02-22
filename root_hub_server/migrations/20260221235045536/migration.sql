BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "anonymous_player" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "createdByPlayerId" bigint NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "manual_input_locations" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "manual_input_locations" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text,
    "cityName" text NOT NULL,
    "country" text NOT NULL,
    "playerDataId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "manual_input_player_data_id_idx" ON "manual_input_locations" USING btree ("playerDataId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_chat_history" (
    "id" bigserial PRIMARY KEY,
    "content" text NOT NULL,
    "matchSchedulePairingAttemptId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "chat_history_pairing_attempt_id_idx" ON "match_chat_history" USING btree ("matchSchedulePairingAttemptId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_chat_message" (
    "id" bigserial PRIMARY KEY,
    "sentAt" timestamp without time zone NOT NULL,
    "content" text NOT NULL,
    "matchChatHistoryId" bigint NOT NULL,
    "playerDataId" bigint NOT NULL
);

-- Indexes
CREATE INDEX "chat_message_history_id_idx" ON "match_chat_message" USING btree ("matchChatHistoryId");
CREATE INDEX "chat_message_player_data_id_idx" ON "match_chat_message" USING btree ("playerDataId");

--
-- ACTION DROP TABLE
--
DROP TABLE "played_match" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "played_match" (
    "id" bigserial PRIMARY KEY,
    "matchStartedAt" timestamp without time zone NOT NULL,
    "matchEstimatedDuration" bigint,
    "locationId" bigint NOT NULL
);

-- Indexes
CREATE INDEX "played_match_location_id_idx" ON "played_match" USING btree ("locationId");

--
-- ACTION DROP TABLE
--
DROP TABLE "player_data" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_data" (
    "id" bigserial PRIMARY KEY,
    "authUserId" uuid NOT NULL,
    "displayName" text NOT NULL,
    "currentCountry" text,
    "nationality" text,
    "favoriteFaction" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "auth_user_id_unique_idx" ON "player_data" USING btree ("authUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_perfomance_in_match" (
    "id" bigserial PRIMARY KEY,
    "anonymousPlayerId" bigint,
    "playerDataId" bigint,
    "playedMatchId" bigint NOT NULL,
    "factionUsedInMatch" text NOT NULL,
    "didWin" boolean NOT NULL,
    "scoreInMatch" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "anonymous_player"
    ADD CONSTRAINT "anonymous_player_fk_0"
    FOREIGN KEY("createdByPlayerId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "manual_input_locations"
    ADD CONSTRAINT "manual_input_locations_fk_0"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_chat_history"
    ADD CONSTRAINT "match_chat_history_fk_0"
    FOREIGN KEY("matchSchedulePairingAttemptId")
    REFERENCES "match_schedule_pairing_attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_chat_message"
    ADD CONSTRAINT "match_chat_message_fk_0"
    FOREIGN KEY("matchChatHistoryId")
    REFERENCES "match_chat_history"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_chat_message"
    ADD CONSTRAINT "match_chat_message_fk_1"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "played_match"
    ADD CONSTRAINT "played_match_fk_0"
    FOREIGN KEY("locationId")
    REFERENCES "locations"("id")
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
ALTER TABLE ONLY "player_perfomance_in_match"
    ADD CONSTRAINT "player_perfomance_in_match_fk_0"
    FOREIGN KEY("anonymousPlayerId")
    REFERENCES "anonymous_player"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "player_perfomance_in_match"
    ADD CONSTRAINT "player_perfomance_in_match_fk_1"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "player_perfomance_in_match"
    ADD CONSTRAINT "player_perfomance_in_match_fk_2"
    FOREIGN KEY("playedMatchId")
    REFERENCES "played_match"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260221235045536', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260221235045536', "timestamp" = now();

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
