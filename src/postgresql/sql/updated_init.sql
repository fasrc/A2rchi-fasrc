-- Create schema 'a2rchi_db'
CREATE SCHEMA IF NOT EXISTS a2rchi_db;

-- Create user 'a2rchi' with password
CREATE USER a2rchi WITH PASSWORD 'pickled.lobster.shoes';

-- Grant all privileges on schema 'a2rchi_db' to user 'a2rchi'
GRANT ALL PRIVILEGES ON SCHEMA a2rchi_db TO a2rchi;

-- Use the 'a2rchi_db' schema
SET search_path TO a2rchi_db;

-- Original SQL content, now applied to the 'a2rchi_db' schema
-- create tables
CREATE TABLE IF NOT EXISTS conversations (
    conversation_id INTEGER NOT NULL,
    message_id SERIAL,
    sender TEXT NOT NULL,
    content TEXT NOT NULL,
    ts TIMESTAMP NOT NULL,
    PRIMARY KEY (message_id)
);
CREATE TABLE IF NOT EXISTS feedback (
    mid INTEGER NOT NULL,
    feedback_ts TIMESTAMP NOT NULL,
    feedback TEXT NOT NULL,
    feedback_msg TEXT,
    incorrect BOOLEAN,
    unhelpful BOOLEAN,
    inappropriate BOOLEAN,
    PRIMARY KEY (mid, feedback_ts),
    FOREIGN KEY (mid) REFERENCES conversations(message_id)
);
CREATE TABLE IF NOT EXISTS timing (
    mid INTEGER NOT NULL,
    client_sent_msg_ts TIMESTAMP NOT NULL,
    server_received_msg_ts TIMESTAMP NOT NULL,
    lock_acquisition_ts TIMESTAMP NOT NULL,
    vectorstore_update_ts TIMESTAMP NOT NULL,
    query_convo_history_ts TIMESTAMP NOT NULL,
    chain_finished_ts TIMESTAMP NOT NULL,
    similarity_search_ts TIMESTAMP NOT NULL,
    a2rchi_message_ts TIMESTAMP NOT NULL,
    insert_convo_ts TIMESTAMP NOT NULL,
    finish_call_ts TIMESTAMP NOT NULL,
    server_response_msg_ts TIMESTAMP NOT NULL,
    msg_duration INTERVAL SECOND NOT NULL,
    PRIMARY KEY (mid),
    FOREIGN KEY (mid) REFERENCES conversations(message_id)
);

-- Grant usage and future privileges on all tables to 'a2rchi'
ALTER DEFAULT PRIVILEGES IN SCHEMA a2rchi_db GRANT ALL ON TABLES TO a2rchi;

-- Create schema 'grafana'
CREATE SCHEMA IF NOT EXISTS grafana;

-- Create user 'grafana' with password
CREATE USER grafana WITH PASSWORD 'blury.lines.cheese';

-- Grant all privileges on schema 'grafana' to user 'grafana'
GRANT ALL PRIVILEGES ON SCHEMA grafana TO grafana;

-- Grant usage and future privileges on all tables to 'grafana'
ALTER DEFAULT PRIVILEGES IN SCHEMA grafana GRANT ALL ON TABLES TO grafana;
