<script setup lang="ts">
const { getPostImageURL } = useApi();

const image_url = ref<string | null>(null);

const {path} = defineProps<
    {
        path: string
    }
>(); 

image_url.value = await getPostImageURL(path);

</script>

<template>
    <img v-if="image_url" class="w-full " :src="image_url" alt="">
    <span v-else> 
        Something went wrong.<br/>
        The image could not be loaded.
    </span>
</template>