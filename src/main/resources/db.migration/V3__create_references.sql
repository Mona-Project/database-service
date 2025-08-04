ALTER TABLE password_reset_tokens
    ADD CONSTRAINT fk_password_reset_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE user_profiles
    ADD CONSTRAINT fk_user_profile_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE user_skills
    ADD CONSTRAINT fk_user_skills_profile
        FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_user_skills_skill
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE;

ALTER TABLE projects
    ADD CONSTRAINT fk_projects_owner
        FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE project_tag_mapping
    ADD CONSTRAINT fk_project_tag_mapping_project
        FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_project_tag_mapping_tag
    FOREIGN KEY (tag_id) REFERENCES project_tags(id) ON DELETE CASCADE;

ALTER TABLE collaboration_requests
    ADD CONSTRAINT fk_collab_requests_project
        FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_collab_requests_requester
    FOREIGN KEY (requester_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE messages
    ADD CONSTRAINT fk_messages_sender
        FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_messages_receiver
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE;
