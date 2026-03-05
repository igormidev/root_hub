BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "account_deletion_request" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "notificationTargetEmail" text,
    "notificationAttemptedAt" timestamp without time zone,
    "notificationSentAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "account_deletion_request_created_at_idx" ON "account_deletion_request" USING btree ("createdAt");
CREATE INDEX "account_deletion_request_email_idx" ON "account_deletion_request" USING btree ("email");


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260305202026876-account-deletion-request', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260305202026876-account-deletion-request', "timestamp" = now();

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
