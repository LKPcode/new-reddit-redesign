<template>
      <p class="text-sm text-white pr-6">
            {{ data || "Text is null or undefined" }}
      </p>
</template>

<script setup>

// Define props
const {data} = defineProps(["data"])


</script>

