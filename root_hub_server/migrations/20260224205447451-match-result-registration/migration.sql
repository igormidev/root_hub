BEGIN;

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
    "scheduledPairingAttemptId" bigint NOT NULL,
    "locationId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "played_match_scheduled_pairing_attempt_unique_idx" ON "played_match" USING btree ("scheduledPairingAttemptId");
CREATE INDEX "played_match_location_id_idx" ON "played_match" USING btree ("locationId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "played_match"
    ADD CONSTRAINT "played_match_fk_0"
    FOREIGN KEY("scheduledPairingAttemptId")
    REFERENCES "match_schedule_pairing_attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "played_match"
    ADD CONSTRAINT "played_match_fk_1"
    FOREIGN KEY("locationId")
    REFERENCES "locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260224205447451-match-result-registration', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260224205447451-match-result-registration', "timestamp" = now();

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
