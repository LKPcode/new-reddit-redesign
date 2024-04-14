import type { Subreddit, Post, Comment } from "~/types";


export const useApi = () => {
    const supabase = useSupabaseClient<any>();

    const getUser = async (username: string) => {
        const { data, error } = await supabase.from('users').select('*').eq('username', username).single();
        if (error) {
            throw new Error(error.message);
        }
        return data;
    }


    const createSubreddit = async (subreddit: Subreddit) =>  {

        const { error } = await supabase.from('subreddits').insert(
            subreddit
        );

        if (error) {
            throw new Error(error.message);
        }
    }

    const getSubredditImageURL = async (sub_name: string) : Promise<string> => {
        const { data } = await supabase.storage.from('sub_images').getPublicUrl(sub_name);
        return data.publicUrl as string;
    }

    const uploadSubredditImage = async (sub_name: string, image: File) : Promise<string> => {
        const { data, error } = await supabase.storage.from('sub_images').upload(sub_name, image);
        if (error) {
            throw new Error(error.message);
        }

        return data.path;
    }


    const getSubreddit = async (name: string) : Promise<Subreddit> => {
        const { data, error } = await supabase.from('subreddits').select('*').eq('name', name).single();
        if (error) {
            throw new Error(error.message);
        }
        const { data: public_url } = await supabase.storage.from('sub_images').getPublicUrl(data.image_url);
        return {
            ...data,
            image_url: public_url.publicUrl as string,
        }
    }

    const getSubreddits = async () : Promise<Subreddit[]> => {
        const { data, error } = await supabase.from('subreddits').select('*');
        if (error) {
            throw new Error(error.message);
        }

        const subreddit_list = data as Subreddit[];
        subreddit_list.forEach(async (subreddit: Subreddit) => {
            const { data: public_url } = await supabase.storage.from('sub_images').getPublicUrl(subreddit.image_url as string);
            subreddit.image_url = public_url.publicUrl as string;
        });

        return subreddit_list;
    }



    const createPost = async (post: Post) =>  {
            
            const { error } = await supabase.from('posts').insert(
                post
            );
    
            if (error) {
                throw new Error(error.message);
            }
    }

    const uploadPostImage = async (image: File) : Promise<string> => {
        let random_name = Math.random().toString(36).substring(7);
        const { data, error } = await supabase.storage.from('posts').upload(random_name, image);
        if (error) {
            throw new Error(error.message);
        }

        return data.path;
    }


    const getPostsOfSubreddit = async (subredditName: string) : Promise<Post[]> => {
        const { data, error } = await supabase.from('posts_for_user')
            .select(`*`).eq('subreddit_name', subredditName);

        if (error) {
            throw new Error(error.message);
        }

        return (data);
    }

    const getPostsForMainPage = async () : Promise<Post[]> => {
        const { data, error } = await supabase.from('posts_for_user')
            .select(`*`);
        if (error) {
            throw new Error(error.message);
        }

        return data;
    }

    const getPostsOfUser = async (username: string) : Promise<Post[]> => {
        const { data, error } = await supabase.from('posts_for_user')
            .select(`*`).eq('username', username);
        if (error) {
            throw new Error(error.message);
        }

        return data;
    }

    const getPostById = async (post_id: string) : Promise<Post> => {
        const { data, error } = await supabase.from('posts_for_user')
            .select(`*`).eq('post_id', post_id).single();
        if (error) {
            throw new Error(error.message);
        }

        return data as Post;
    }


    const getPostImageURL = async (image_path: string) : Promise<string> => {
        const { data } = await supabase.storage.from('posts').getPublicUrl(image_path);
        return data.publicUrl as string;
    }

    const voteOnPost = async (post_id: number, vote:string) => {
        const { error } = await supabase.from('votes').insert(
            {post_id, vote}
        );
        if (error) {
            throw new Error(error.message);
        }
    }

    const getCommentsOfPost = async (post_id: string) => {
        // call threaded_comments function
        let { data, error } = await supabase.rpc('threaded_comments', {post_id});
        if (error) {
            throw new Error(error.message);
        }
        return data;
    }

    const createComment = async (comment: Comment, post_id: string) => {
        const { error } = await supabase.from('comments').insert(
            comment
        );
        if (error) {
            throw new Error(error.message);
        }
    }

    const voteOnComment = async (comment_id: number, vote:string) => {
        const { error } = await supabase.from('votes').insert(
            {comment_id, vote}
        );
        if (error) {
            throw new Error(error.message);
        }
    }

    const getCommentsOfUser = async (username: string) => {
        const { data, error } = await supabase.from('comments_for_user').select('*').eq('username', username);
        if (error) {
            throw new Error(error.message);
        }
        return data;
    }


   return {
            getUser,
            createSubreddit,
            uploadSubredditImage,
            getSubredditImageURL,
            getSubreddit,
            getSubreddits,
            createPost,
            getPostsOfSubreddit,
            getPostsForMainPage,
            getPostsOfUser,
            getPostById,
            uploadPostImage,
            getPostImageURL,
            voteOnPost,
            getCommentsOfPost,
            createComment,
            voteOnComment,
            getCommentsOfUser,
    }

}