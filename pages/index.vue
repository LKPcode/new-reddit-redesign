
<script setup lang="ts">
import type { Subreddit, Post } from '~/types';

const { getSubreddits, getPostsForMainPage } = useApi();

const posts = ref<Post[]>([]);
const subreddits = ref<Subreddit[]>([]);

const { data: posts_ } = await useAsyncData('posts', async () => {
    try {
        const posts = await getPostsForMainPage();
        return posts;
    } catch (e) {
        console.error(e);
    }
    return null;
});

if (posts_.value) {
    posts.value = posts_.value;
}

const { data: subreddits_ } = await useAsyncData('subreddits', async () => {
    try {
        const subs = await getSubreddits();
        return subs;
    } catch (e) {
        console.error(e);
    }
    return null;
});

if (subreddits_.value) {
    subreddits.value = subreddits_.value;
}




// Select Sort by value
const selectedSortBy = ref("best");
const selected = async (event: string) => {

}


</script>

<template>

    <!-- Main Content that has two Collumns -->
    <div class="flex m-auto sm:w-[900px] ">

        <!-- Left Column -->
        <div class="sm:w-4/6">
        
            <SortBy @selected="(event)=>{selected(event)}"/>

            <Post v-for="post in posts" :key="post.post_id" :post="post" />

        </div>
        <!-- Right Column -->
        <div class="w-2/6 m-2 md:block hidden">
            <SubredditList :subreddits="subreddits" />

        </div>
    </div>

</template>
