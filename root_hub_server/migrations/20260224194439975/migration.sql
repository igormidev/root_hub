BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "match_chat_message" ADD COLUMN "blurhash" text;
ALTER TABLE "match_chat_message" ADD COLUMN "imageWidth" bigint;
ALTER TABLE "match_chat_message" ADD COLUMN "imageHeight" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "match_schedule_pairing_attempt" ADD COLUMN "closedForSubscriptions" boolean;

--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260224194439975', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260224194439975', "timestamp" = now();

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
