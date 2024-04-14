CREATE TABLE users (
    user_id UUID PRIMARY KEY REFERENCES auth.users(id),
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP WITH TIME ZONE
);

CREATE TABLE subreddits (
    name VARCHAR(50) PRIMARY KEY,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    creator_username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    type VARCHAR(50) NOT NULL,
    file_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
    subreddit_name VARCHAR(50) REFERENCES subreddits(name) ON DELETE CASCADE
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    parent_comment_id INT REFERENCES comments(comment_id) ON DELETE CASCADE
);

CREATE TABLE votes (
    vote_id SERIAL PRIMARY KEY,
    upvote BOOLEAN NOT NULL,
    username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
    post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
    comment_id INT REFERENCES comments(comment_id) ON DELETE CASCADE
);

CREATE TABLE moderators (
    moderator_id SERIAL PRIMARY KEY,
    username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
    subreddit_name VARCHAR(50) REFERENCES subreddits(name) ON DELETE CASCADE
);




-- Helper function to get the username of a user_id (UUID) from the users table
CREATE OR REPLACE FUNCTION public.username_of_uid()
RETURNS VARCHAR AS
$$
DECLARE
  _username VARCHAR;
BEGIN
  SELECT username INTO _username
  FROM public.users
  WHERE user_id = auth.uid(); -- Assuming auth.uuid() returns the UUID to check

  RETURN _username;
EXCEPTION WHEN NO_DATA_FOUND THEN
  RETURN NULL; -- Returns NULL if no matching user_id is found
END;
$$
LANGUAGE plpgsql VOLATILE
SECURITY DEFINER; -- Allows the function to be executed with the privileges of the user who defines it, enabling it to be called by anyone



-- https://github.com/orgs/supabase/discussions/12531#discussioncomment-5054574
-- RLS for Views by using security invoker

CREATE OR REPLACE VIEW public.posts_for_user AS
SELECT
    p.post_id,
    p.title,
    p.content,
    p.type,
    p.file_url,
    p.created_at,
    p.username,
    p.subreddit_name,
    p.votes,
    v.vote AS voted
FROM
    public.posts p
LEFT JOIN public.votes v ON p.post_id = v.post_id
    AND v.username = username_of_uid();


-- drop view view_user_votes;



-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

create or replace view
  public.comments_for_user as
select
  c.comment_id,
  c.content,
  c.created_at,
  c.username,
  c.post_id,
  c.votes,
  c.parent_comment_id,
  p.subreddit_name,
  v.vote as voted
from
  public.comments c
  left join public.votes v on c.comment_id = v.comment_id
  and v.username = username_of_uid ()
  left join public.posts p on c.post_id = p.post_id;

-- drop view comments_for_user;