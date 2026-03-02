BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "match_chat_participant_state" (
    "id" bigserial PRIMARY KEY,
    "playerDataId" bigint NOT NULL,
    "matchChatHistoryId" bigint NOT NULL,
    "firstSeenAt" timestamp without time zone NOT NULL,
    "lastOpenedAt" timestamp without time zone NOT NULL,
    "lastReadMessageAt" timestamp without time zone,
    "unreadMessagesCount" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE UNIQUE INDEX "chat_participant_state_unique_idx" ON "match_chat_participant_state" USING btree ("playerDataId", "matchChatHistoryId");
CREATE INDEX "chat_participant_state_player_unread_idx" ON "match_chat_participant_state" USING btree ("playerDataId", "unreadMessagesCount");
CREATE INDEX "chat_participant_state_player_last_opened_idx" ON "match_chat_participant_state" USING btree ("playerDataId", "lastOpenedAt");
CREATE INDEX "chat_participant_state_history_idx" ON "match_chat_participant_state" USING btree ("matchChatHistoryId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "match_chat_participant_state"
    ADD CONSTRAINT "match_chat_participant_state_fk_0"
    FOREIGN KEY("playerDataId")
    REFERENCES "player_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "match_chat_participant_state"
    ADD CONSTRAINT "match_chat_participant_state_fk_1"
    FOREIGN KEY("matchChatHistoryId")
    REFERENCES "match_chat_history"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR root_hub
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_hub', '20260226032229832', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260226032229832', "timestamp" = now();

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
