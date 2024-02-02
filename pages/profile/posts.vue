<script setup lang="ts">

const posts = ref([]);

</script>


<template>

    <UniversalPost v-for="post in posts" :post="post" />

</template>