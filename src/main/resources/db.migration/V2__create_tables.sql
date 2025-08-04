CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
                       id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                       username      VARCHAR(50) UNIQUE NOT NULL,
                       email         VARCHAR(100) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       status        user_status DEFAULT 'ACTIVE' NOT NULL,
                       created_at    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                       updated_at    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE password_reset_tokens (
                                       token       VARCHAR(255) PRIMARY KEY,
                                       user_id     UUID NOT NULL,
                                       expiry_date TIMESTAMP NOT NULL,
                                       created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles (
                               id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                               user_id      UUID UNIQUE NOT NULL,
                               full_name    VARCHAR(100),
                               bio          TEXT,
                               github_url   VARCHAR(255),
                               linkedin_url VARCHAR(255),
                               avatar_url   VARCHAR(255),
                               is_public    BOOLEAN DEFAULT TRUE,
                               created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE skills (
                        id   UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                        name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE user_skills (
                             user_profile_id UUID NOT NULL,
                             skill_id        UUID NOT NULL,
                             PRIMARY KEY (user_profile_id, skill_id)
);

CREATE TABLE projects (
                          id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                          owner_id    UUID NOT NULL,
                          title       VARCHAR(150) NOT NULL,
                          description TEXT,
                          github_link VARCHAR(255),
                          created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE project_tags (
                              id   UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                              name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE project_tag_mapping (
                                     project_id UUID NOT NULL,
                                     tag_id     UUID NOT NULL,
                                     PRIMARY KEY (project_id, tag_id)
);

CREATE TABLE collaboration_requests (
                                        id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                                        project_id   UUID NOT NULL,
                                        requester_id UUID NOT NULL,
                                        status       request_status DEFAULT 'PENDING' NOT NULL,
                                        created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
                          id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                          sender_id   UUID NOT NULL,
                          receiver_id UUID NOT NULL,
                          content     TEXT NOT NULL,
                          sent_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          is_read     BOOLEAN DEFAULT FALSE
);