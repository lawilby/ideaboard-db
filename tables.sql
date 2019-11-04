CREATE TABLE note (
    id SERIAL PRIMARY KEY,
    created timestamp with timezone DEFAULT CURRENT_TIMESTAMP   
);

CREATE TABLE board (
    id SERIAL PRIMARY KEY,
    created timestamp with timezone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE note_board (
    note_id integer NOT NULL REFERENCES note (id),
    board_id integer NOT NULL REFERENCES board (id),
    PRIMARY KEY (note_id, board_id)
);

CREATE TABLE grid_col (
    id SERIAL PRIMARY KEY
);

CREATE TABLE board_grid_column (
    board_id integer NOT NULL REFERENCES board (id),
    grid_col_id integer NOT NULL REFERENCES grid_col (id)
);

CREATE TABLE grid_row (
    id SERIAL PRIMARY KEY
);

CREATE TABLE board_grid_row (
    board_id integer NOT NULL REFERENCES board (id),
    grid_col_id integer NOT NULL REFERENCES grid_col (id)
);

CREATE TYPE CONTENT_TYPE_OPTS AS ENUM ('text', 'image');

CREATE TABLE note_content (
    id SERIAL PRIMARY KEY,
    note_id integer NOT NULL REFERENCES note (id),
    content_type CONTENT_TYPE_OPTS,
    created timestamp with timezone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE note_text (
    id SERIAL PRIMARY KEY,
    note_content_id integer NOT NULL REFERENCES note_content (id),
    note_text text
);

CREATE TABLE note_image (
    id SERIAL PRIMARY KEY,
    note_content_id integer NOT NULL REFERENCES note_content (id),
    note_image bytea
);

