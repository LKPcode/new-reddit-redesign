<script setup   lang="ts">
import type { Comment } from '~/types';

const { getCommentsOfUser } = useApi();
const route = useRoute();

const comments = ref<Comment[]>([]);

const { data : comments_ } = await useAsyncData(
    async () => {
        return await getCommentsOfUser(route.params.username as string);
    }
);

if (comments_.value) {
    comments.value = comments_.value;
}

</script>


<template>

    <ProfileComment v-for="comment in comments" :comment="comment" />

</template>