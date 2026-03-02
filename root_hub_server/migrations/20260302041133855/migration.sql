BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "match_schedule_pairing_attempt" DROP CONSTRAINT "match_schedule_pairing_attempt_fk_0";
ALTER TABLE "match_schedule_pairing_attempt" DROP CONSTRAINT "match_schedule_pairing_attempt_fk_1";
ALTER TABLE "match_schedule_pairing_attempt" ADD COLUMN "status" text NOT NULL DEFAULT 'scheduled'::text;
ALTER TABLE "match_schedule_pairing_attempt" ADD COLUMN "notPlayedReason" text;
ALTER TABLE "match_schedule_pairing_attempt" ADD COLUMN "notPlayedReasonDetails" text;
ALTER TABLE "match_schedule_pairing_attempt" ADD COLUMN "notPlayedMarkedByPlayerDataId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_schedule_pairing_attempt"
    ADD CONSTRAINT "match_schedule_pairing_attempt_fk_2"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_schedule_pairing_attempt"
    ADD CONSTRAINT "match_schedule_pairing_attempt_fk_0"
    FOREIGN KEY("notPlayedMarkedByPlayerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_schedule_pairing_attempt"
    ADD CONSTRAINT "match_schedule_pairing_attempt_fk_1"
    FOREIGN KEY("locationId")
    REFERENCES "locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260302041133855', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260302041133855', "timestamp" = now();

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
