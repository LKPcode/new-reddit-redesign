<template>
    <!-- Post Card like a post on Reddit -->
    <div class="flex rounded-md border border-slate-700 hover:border-slate-500 cursor-default my-2">
        
        <div class=" bg-slate-700 rounded-l-md pt-2">
           <Voting :post="post" />
        </div>

        <div @click="goTo(`/subreddit/${post.subreddit_name}/${post.post_id}`)"
        class="flex-grow bg-slate-700 rounded-r-md">
            <!-- Subreddit name and post metadata -->
            <div class="flex items-center m-2">
                
                <img class="w-[16px] h-[16px] bg-white border border-gray-500 rounded-full" :src="sub_image_url"
                    alt="subreddit-image">

                <p @click.self.stop="goTo(`/subreddit/${post.subreddit_name}`)"
                  class="text-sm text-white mx-2 hover:underline cursor-pointer">r/ {{ props.post?.subreddit_name }}</p>


                <p class="text-xs text-gray-400 mr-2">Posted by 
                    <span @click.self.stop="goTo(`/profile/${post.username}`)" 
                        class="hover:underline text-orange-500 cursor-pointer">
                        u/{{props.post.username}}
                    </span> 
                </p>

                <p class="text-xs text-gray-400">Posted at {{  }}</p>
            </div>
            <!-- Post title and content -->
            <div class="ml-2">
                <p class="text-lg text-white font-semibold pr-6 mb-2">{{ props.post?.title || "Error" }}</p>

                <PostVariationsText v-if="props.post.type=='text'" :content="props.post.content" />
                <PostVariationsImage v-else-if="props.post.type=='image'" :path="props.post.content" />

            </div>
            <!-- Post buttons -->
            <div class="flex items pb-1  mx-2 mt-2">
                <!-- Comment -->
                <div class="flex rounded-md text-gray-400 hover:bg-gray-600 align-middle items-center px-2 ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                        stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M2.25 12.76c0 1.6 1.123 2.994 2.707 3.227 1.068.157 2.148.279 3.238.364.466.037.893.281 1.153.671L12 21l2.652-3.978c.26-.39.687-.634 1.153-.67 1.09-.086 2.17-.208 3.238-.365 1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z" />
                    </svg>
                    <button class="text-xs font-medium   px-2 py-1">20 Comments</button>
                </div>
                <!-- Share -->
                <div class="flex rounded-md text-gray-400 hover:bg-gray-600 align-middle items-center px-2 ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z" />
                    </svg>

                    <button class="text-xs  font-medium    px-2 py-1">Share</button>

                </div>
                <!-- Save -->
                <div class="flex rounded-md text-gray-400 hover:bg-gray-600 align-middle items-center px-2 ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                    </svg>
                    <button class="text-xs  font-medium   px-2 py-1">Save</button>

                </div>


            </div>
        </div>

    </div>
</template>

<script setup lang="ts">


import type { Post } from '~/types'

const { getSubredditImageURL } = useApi()

const props = defineProps<{
  post: Post
}>()

const post = ref<Post>(props.post)
const sub_image_url = ref<string>("")

// Get public URL of the Subreddit image
const getImagePublicURL = async (subreddit_name: string) => {
    try {
        const url = await getSubredditImageURL(subreddit_name)
        // console.log(url)
        return url
    } catch (e) {
        console.error(e)
    }
    return null
}

// Get the public URL of the subreddit image
sub_image_url.value = await getImagePublicURL(post.value.subreddit_name) as string;


const router = useRouter()
const goTo = (path:string) => {
    router.push(path)
}

</script>