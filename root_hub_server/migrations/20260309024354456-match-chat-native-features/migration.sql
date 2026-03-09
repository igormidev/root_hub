BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "match_chat_message" ADD COLUMN "replyToMessageId" bigint;
ALTER TABLE "match_chat_message" ADD COLUMN "replyToMessagePreview" text;
ALTER TABLE "match_chat_message" ADD COLUMN "replyToMessageUiType" text;
ALTER TABLE "match_chat_message" ADD COLUMN "replyToMessageSenderPlayerDataId" bigint;
ALTER TABLE "match_chat_message" ADD COLUMN "replyToAudioDurationMilliseconds" bigint;
ALTER TABLE "match_chat_message" ADD COLUMN "reactionsJson" text;
CREATE INDEX "chat_message_reply_to_message_id_idx" ON "match_chat_message" USING btree ("replyToMessageId");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "match_chat_participant_state" ADD COLUMN "lastTypingAt" timestamp without time zone;

--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260309024354456-match-chat-native-features', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260309024354456-match-chat-native-features', "timestamp" = now();

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
    VALUES ('serverpod_auth_idp', '20260213194423028', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260213194423028', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
