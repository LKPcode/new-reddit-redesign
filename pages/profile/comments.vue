<script setup   lang="ts">


const comments = ref([]);

</script>


<template>

    <ProfileComment v-for="comment in comments" :comment="comment" />


</template>