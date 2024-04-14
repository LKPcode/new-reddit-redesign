<template>
          <!-- About Community -->
          <div class="bg-slate-700 rounded-md p-4 text-white">
            <div class="flex items-center ">
                <img v-show="sub_image_url" class="w-12 h-12 rounded-full border mr-4" :src="sub_image_url" alt="">
                <h1 class=" font-medium text-gray-200">About r/{{ subreddit.name }}</h1>
            </div>
                <p class=" mt-2 text-sm">{{ subreddit.description }}</p>
                <div class="h-[1px] bg-gray-500 my-3"></div>
                <div class="flex">
                    <div class="pr-4">
                        <p class="text-sm font-medium">30k</p> 
                        <p class="text-xs text-gray-400">Members</p>
                    </div>


                    <div class="px-4">
                        <p class="text-sm font-medium">2.4k</p>
                         <p class="text-xs text-gray-400">Online</p>
                    </div>

                    <div class="px-4">
                        <p class="text-sm font-medium">Dec 1, 2022</p>
                         <p class="text-xs text-gray-400">Created</p>
                    </div>
                </div>
                <div class="h-[1px] bg-gray-500 my-3"></div>

                <NuxtLink :to="`/createpost/${subreddit.name}`">
                    <button class="bg-gray-100 hover:bg-gray-200 text-black w-full px-2 py-1 rounded-md font-medium">Create Post</button>
                </NuxtLink>

            </div>
</template>

<script setup lang="ts">
import type { Subreddit } from '~/types';

const { getSubredditImageURL } = useApi()

const {subreddit} = defineProps<{
    subreddit: Subreddit
}>()

const sub_image_url = ref<string>("")

// Get public URL of the Subreddit image
sub_image_url.value = await getSubredditImageURL(subreddit.name) as string;



</script>