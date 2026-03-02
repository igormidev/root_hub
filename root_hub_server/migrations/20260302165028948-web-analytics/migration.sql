BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "web_analytics_click" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "requestPath" text NOT NULL,
    "requestQuery" text,
    "matchId" bigint,
    "ipAddress" text,
    "countryCode" text,
    "countryName" text,
    "city" text,
    "deviceType" text NOT NULL,
    "osName" text,
    "browserName" text,
    "userAgent" text
);

-- Indexes
CREATE INDEX "web_analytics_click_created_at_idx" ON "web_analytics_click" USING btree ("createdAt");
CREATE INDEX "web_analytics_click_match_id_idx" ON "web_analytics_click" USING btree ("matchId");
CREATE INDEX "web_analytics_click_country_code_idx" ON "web_analytics_click" USING btree ("countryCode");
CREATE INDEX "web_analytics_click_device_type_idx" ON "web_analytics_click" USING btree ("deviceType");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "web_ip_location_cache" (
    "id" bigserial PRIMARY KEY,
    "ipAddress" text NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "countryCode" text,
    "countryName" text,
    "city" text
);

-- Indexes
CREATE UNIQUE INDEX "web_ip_location_cache_ip_unique_idx" ON "web_ip_location_cache" USING btree ("ipAddress");
CREATE INDEX "web_ip_location_cache_updated_at_idx" ON "web_ip_location_cache" USING btree ("updatedAt");


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260302165028948-web-analytics', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260302165028948-web-analytics', "timestamp" = now();

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
