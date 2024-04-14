<script setup lang="ts">
import type { Subreddit } from '~/types';

const {subreddits} = defineProps<{
    subreddits: Subreddit[]
}>()

</script>

<template>
    <!-- About Community -->
    <div v-if="subreddits" class="bg-slate-700 rounded-md p-4 text-white sticky top-16">

        <h1 class="font-medium text-gray-400 text-md">Top Subreddits Today</h1>
        
        <div v-for="sub in subreddits">
            <div class="h-[1px] bg-gray-500 my-3"></div>
            <div class="flex items-center cursor-pointer ">
                <img class="w-8 h-8 rounded-full border mr-4" :src="(sub.image_url as string)"
                    alt="">
                <div>
                    <NuxtLink :to="'/subreddit/' + sub.name">
                        <h1 class="font-medium hover:underline text-gray-200 text-sm">
                            r/
                            {{ sub.name }}
                        </h1>
                    </NuxtLink>
                    <p class="text-xs text-gray-400">30k Members</p>
                </div>
                
            </div>
            
        </div>
    </div>
</template>