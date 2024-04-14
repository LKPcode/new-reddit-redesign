<script setup lang="ts">
import type { Post } from '~/types';


const { getPostsOfUser } = useApi();
const route = useRoute();

const posts = ref<Post[]>([]);

const {data: posts_} = await useAsyncData('posts', async () => {
        try {
            const posts = await getPostsOfUser(route.params.username as string);
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

    <UniversalPost v-for="post in posts" :post="post" />

</template>