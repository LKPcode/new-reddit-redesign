CREATE OR REPLACE FUNCTION comment_tree(comment_id INT)
RETURNS JSON AS $$
SELECT json_build_object(
  'comment_id', c.comment_id,
  'username', c.username,
  'content', c.content,
  'created_at', c.created_at,
  'votes', c.votes,
  'voted', c.voted,
  'children', children
)
FROM comments_for_user c
LEFT JOIN LATERAL (
  SELECT coalesce(json_agg(comment_tree(comments_for_user.comment_id) ORDER BY created_at ASC), '[]') AS children
  FROM comments_for_user
  WHERE parent_comment_id = c.comment_id
) AS get_children ON true
WHERE c.comment_id = comment_tree.comment_id
$$ LANGUAGE sql STABLE;


CREATE OR REPLACE FUNCTION threaded_comments(post_id INT)
RETURNS JSON AS $$
SELECT coalesce(json_agg(comment_tree(comment_id) ORDER BY created_at DESC), '[]') AS comments
FROM comments_for_user c
WHERE c.parent_comment_id IS NULL AND c.post_id = threaded_comments.post_id
$$ LANGUAGE sql STABLE;


select threaded_comments(4);