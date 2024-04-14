
// Interface for users table
interface User {
    user_id: string; // UUID
    username: string;
    email: string;
    createdAt: Date;
    lastLogin?: Date;
  }
  interface Subreddit {
    name: string;
    description: string | null;
    image_url: string | File | null;
    created_at?: Date;
    creator_username?: string;
  }
  
  interface Post {
    post_id?: number;
    title: string;
    content: string;
    type: string;
    file_url?: string | null;
    created_at?: Date;
    username?: string;
    subreddit_name: string;
    votes?: number;
    voted?: string;
  }
  
  interface Comment {
    comment_id?: number;
    content: string;
    created_at?: Date;
    username?: string;
    post_id: number;
    parent_comment_id?: number;
    children?: Comment[];
    votes?: number;
    voted?: string;
  }
  
  interface Vote {
    vote_id: number;
    upvote: boolean;
    username: string;
    post_id: number | null;
    comment_id: number | null;
  }
  
  interface Moderator {
    moderator_id: number;
    username: string;
    subreddit_name: string;
  }

  export type {
    User,
    Subreddit,
    Post,
    Comment,
    Vote,
    Moderator,
  }