BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "geo_locations" (
    "id" bigserial PRIMARY KEY,
    "x" double precision NOT NULL,
    "y" double precision NOT NULL,
    "ratio" double precision NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "player_data" DROP COLUMN "currentCountry";
ALTER TABLE "player_data" DROP COLUMN "nationality";
ALTER TABLE "player_data" ADD COLUMN "currentLocationId" bigint;
CREATE UNIQUE INDEX "player_current_location_unique_idx" ON "player_data" USING btree ("currentLocationId");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player_data"
    ADD CONSTRAINT "player_data_fk_1"
    FOREIGN KEY("currentLocationId")
    REFERENCES "geo_locations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260222172937003', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260222172937003', "timestamp" = now();

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
