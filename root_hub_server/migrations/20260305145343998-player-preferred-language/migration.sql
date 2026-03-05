BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "player_data" ADD COLUMN "preferredLanguage" text NOT NULL DEFAULT 'english'::text;

--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260305145343998-player-preferred-language', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260305145343998-player-preferred-language', "timestamp" = now();

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
