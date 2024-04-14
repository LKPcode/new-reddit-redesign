
<script setup lang="ts">
import type { Subreddit,  Post } from '~/types';


    const { getSubreddit, getPostsOfSubreddit } = useApi();
    const route = useRoute();

    const posts = ref<Post[]>([]);

    const subreddit = ref<Subreddit|null>(null);



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

    const {data: posts_} = await useAsyncData('posts', async () => {
        try {
            const posts = await getPostsOfSubreddit(route.params.name as string);
            return posts;
        } catch (e) {
            console.error(e);
        }
        return null;
    })

    if (posts_.value) {
        posts.value = posts_.value;
    }





</script>


<template>

   <SubredditJumbo :subreddit="(subreddit as Subreddit)" />

 
    <!-- Main Content that has two Collumns -->
    <div class="flex m-auto w-[900px] ">

        <!-- Left Column -->
        <div class="w-4/6 ">
            <!-- Sort By -->
            <SortBy />

            <!-- Posts -->
            <Post v-for="post in posts" :key="post.post_id" :post="post" />


        </div>
        <!-- Right Column -->
        <div class="w-2/6 m-2">
      
            <!-- About Community -->
            <AboutCommunity :subreddit="(subreddit as Subreddit)" />
            
            <!-- Subreddit Rules -->
            <SubredditRules />


        </div>
    </div>

</template>
