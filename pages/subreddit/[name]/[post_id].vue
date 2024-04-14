<template>
    <div class="w-[900px] m-auto flex ">

        <div class="w-4/6">

        <!-- Post -->
        <Post v-if="post" :post="post" />

        <!-- Create Comment -->
        <div class="mt-4">
            <p class="text-gray-500 text-sm">
                Comment as 
                <span class="hover:underline cursor-pointer text-orange-500">
                    u/{{ user?.username }}
                </span>
            </p>
            <div class="relative">
                <textarea
                v-model="newComment"
                 class="w-full h-24  rounded-md my-2 p-2 px-4 bg-slate-700 text-white" name="create-comment" id="" cols="30"
                rows="10" placeholder="What are your thoughts?"></textarea>

                <div class="flex justify-end absolute bottom-6 right-2">
                    <button @click="createCommentHandler()" class="bg-orange-400 text-white rounded-md px-3 py-1">Publish</button>
                </div>
            </div>
        </div>

        <!-- Comments -->
        <div class="mb-4">
            <p class="text-gray-500 text-sm">Comments sorted by Best</p>
            <SortBy @selected="sortByFunc" />
            <Comment v-if="comments!=null" :comments="comments"/>
        </div>
    </div>

    <div class="w-2/6  p-2">
        <AboutCommunity v-if="subreddit" :subreddit="subreddit" />
    </div>

    </div>

</template>

<script setup lang="ts">
import type { Post, Subreddit, Comment } from '~/types';

const {user} = useAppUser()


const { getPostById, getSubreddit, getCommentsOfPost, createComment } = useApi()
const route = useRoute()

const post = ref<Post>();
// Dummy comments 3 levels deep
const comments = ref<Comment[]>()

const subreddit = ref<Subreddit>()

const newComment = ref('')

const { data: post_ } = await useAsyncData('post', async () => {
    try {
        const post = await getPostById( route.params.post_id as string );
        return post;
    } catch (e) {
        console.error(e);
    }
    return null;
})

console.log(post_.value)
if (post_.value) {
    post.value = post_.value;
}


const { data: subreddit_ } = await useAsyncData('subreddit', async () => {
        try {
            const sub = await getSubreddit(route.params.name as string);
            // console.log(sub);
            return sub;
        } catch (e) {
            console.error(e);
        }

        return null;
    })

    if (subreddit_.value) {
        subreddit.value = subreddit_.value;
    }


const { data: comments_ } = await useAsyncData('comments', async () => {
    try {
        const comments = await getCommentsOfPost(route.params.post_id as string);
        return comments;
    } catch (e) {
        console.error(e);
    }
    return null;
})

console.log(comments_.value)
if (comments_.value) {
    comments.value = comments_.value;
}

const toast = useToast()
const createCommentHandler = async () => {

    // if comment is empty
    if (newComment.value.trim() === '') {
        toast.add({title: "Comment cannot be empty"})
        return;
    }

    let new_comment: Comment = {
        content: newComment.value,
        created_at: new Date(),
        post_id: (post.value?.post_id as number),
    }

    try {
        const comment = await createComment(new_comment, post.value?.post_id as unknown as string);
        toast.add({title: "Comment created"})
    } catch (e) {
        console.error(e)
        toast.add({title: "Error creating comment"})
    }
}


const sortByFunc = (sortBy:string) => {

}




</script>
