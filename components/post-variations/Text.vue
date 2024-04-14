<template>
      <p class="text-sm text-white pr-6">
            {{ content }}
      </p>
</template>

<script setup lang="ts">

// Define props
const {content} = defineProps<{
      content: string
}>();

</script>

