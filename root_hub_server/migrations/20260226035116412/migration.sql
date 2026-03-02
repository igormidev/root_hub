BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player_push_notification_token" (
    "id" bigserial PRIMARY KEY,
    "token" text NOT NULL,
    "platform" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "lastConfirmedAt" timestamp without time zone NOT NULL,
    "playerDataId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "player_push_notification_token_unique_token_idx" ON "player_push_notification_token" USING btree ("token");
CREATE INDEX "player_push_notification_token_player_active_idx" ON "player_push_notification_token" USING btree ("playerDataId", "isActive");
CREATE INDEX "player_push_notification_token_last_confirmed_idx" ON "player_push_notification_token" USING btree ("lastConfirmedAt");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player_push_notification_token"
    ADD CONSTRAINT "player_push_notification_token_fk_0"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260226035116412', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260226035116412', "timestamp" = now();

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
