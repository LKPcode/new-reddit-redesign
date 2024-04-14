CREATE OR REPLACE FUNCTION handle_vote()
RETURNS TRIGGER AS
$$
BEGIN
    -- Assume: NEW.vote contains 'up' or 'down', NEW.post_id or NEW.comment_id is set

    -- Check for an existing vote by this user for the same post or comment
    IF NEW.post_id IS NOT NULL THEN
        -- Handling vote for a post
        IF EXISTS(SELECT 1 FROM votes WHERE username = NEW.username AND post_id = NEW.post_id) THEN
            -- An existing vote on the post is found, decide action based on the vote direction
            IF (SELECT vote FROM votes WHERE username = NEW.username AND post_id = NEW.post_id) = NEW.vote THEN
                -- Same vote direction: Remove the existing vote and adjust the post's vote counter
                UPDATE posts SET votes = votes + CASE WHEN NEW.vote = 'up' THEN -1 ELSE 1 END WHERE post_id = NEW.post_id;
                DELETE FROM votes WHERE username = NEW.username AND post_id = NEW.post_id;
            ELSE
                -- Different vote direction: Flip the vote and adjust the post's vote counter by 2 in the direction of the new vote
                UPDATE votes SET vote = NEW.vote WHERE username = NEW.username AND post_id = NEW.post_id;
                UPDATE posts SET votes = votes + CASE WHEN NEW.vote = 'up' THEN 2 ELSE -2 END WHERE post_id = NEW.post_id;
            END IF;
            -- Cancel the insert as we've already handled the existing vote
            RETURN NULL;
        END IF;
    ELSIF NEW.comment_id IS NOT NULL THEN
        -- Handling vote for a comment (Similar logic as for post, adjusted for comment_id)
        IF EXISTS(SELECT 1 FROM votes WHERE username = NEW.username AND comment_id = NEW.comment_id) THEN
            -- An existing vote on the comment is found, decide action based on the vote direction
            IF (SELECT vote FROM votes WHERE username = NEW.username AND comment_id = NEW.comment_id) = NEW.vote THEN
                -- Logic for removing or flipping the vote, similar to above, adjusted for comments
                -- This part would be similar to the post logic but targeted at comments, potentially adjusting a comment's vote counter if such a column exists
                UPDATE comments SET votes = votes + CASE WHEN NEW.vote = 'up' THEN -1 ELSE 1 END WHERE comment_id = NEW.comment_id;
                DELETE FROM votes WHERE username = NEW.username AND comment_id = NEW.comment_id;
            ELSE
                -- Different vote direction logic for comments
                UPDATE votes SET vote = NEW.vote WHERE username = NEW.username AND comment_id = NEW.comment_id;
                UPDATE comments SET votes = votes + CASE WHEN NEW.vote = 'up' THEN 2 ELSE -2 END WHERE comment_id = NEW.comment_id;
            END IF;
            -- Cancel the insert as we've already handled the existing vote
            RETURN NULL;
        END IF;
    END IF;

    -- If no existing vote matches, proceed with the insert, which PostgreSQL does automatically if this function returns NEW
    -- Adjust the post or comment vote counter up or down based on the new vote
    IF NEW.post_id IS NOT NULL THEN
        UPDATE posts SET votes = votes + CASE WHEN NEW.vote = 'up' THEN 1 ELSE -1 END WHERE post_id = NEW.post_id;
    -- Similar update logic for comments if applicable
    END IF;
    IF NEW.comment_id IS NOT NULL THEN
        UPDATE comments SET votes = votes + CASE WHEN NEW.vote = 'up' THEN 1 ELSE -1 END WHERE comment_id = NEW.comment_id;
    -- Similar update logic for comments if applicable
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS before_vote_change ON votes;

CREATE TRIGGER before_vote_change
BEFORE INSERT ON votes
FOR EACH ROW EXECUTE FUNCTION handle_vote();
