<template>

    <div class="flex items-stretch rounded-md my-2 border border-slate-700 hover:border-slate-500 bg-slate-700 cursor-default">

        <div class="rounded-l-md flex items-center">
            <div class="text-center w-[40px]">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="3"
                    stroke="currentColor" class="w-4 h-4 m-auto text-gray-400 hover:text-orange-500 cursor-pointer">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 19.5v-15m0 0l-6.75 6.75M12 4.5l6.75 6.75" />
                </svg>
                <p class="text-xs m-1 text-gray-300">420</p>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="3"
                    stroke="currentColor" class="w-4 h-4 m-auto text-gray-400 hover:text-blue-500 cursor-pointer">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 13.5L12 21m0 0l-7.5-7.5M12 21V3" />
                </svg>

            </div>
        </div>

        <div class="w-[10px]  my-2  ">

            <div class="h-full w-[2px] border  border-dashed m-auto"></div>
        </div>

        <!-- <img class="w-24 h-16 rounded-md" src="../assets/a55a96a32deb4b4b8b2028d1e98d3947.jpeg" alt=""> -->

        <div class="flex-grow bg-slate-700 rounded-r-md">

            <!-- Subreddit name and post metadata -->
            <div class="flex items-center mx-2"> 
                <p class="text-xs text-gray-400 ">Commented by
                    <span class="hover:underline text-orange-500 cursor-pointer">u/{{ comment.user.username }}</span> </p>
                <!-- <img class="w-[16px] h-[16px] bg-white border border-gray-500 rounded-full" src="../assets/vue.svg"
                    alt="subreddit-image"> -->

                    <p class="text-xs text-gray-400 mx-1"> in </p>
                <p class="text-sm text-white mr-2 hover:underline cursor-pointer"> r/{{ comment.post.subreddit.name }}</p>

                <p class="text-xs text-gray-400">Posted at 11/11/2022</p>
            </div>

            <!-- Post title -->
            <p class="text-sm mx-2 text-white font-semibold pr-6">{{ comment.body }}</p>

            <!-- Post buttons -->
            <div class="flex items pb-1 mx-2">
                <!-- Comment -->
                <div class="flex rounded-md text-gray-400 hover:bg-gray-600 align-middle items-center px-2 ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                        stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M2.25 12.76c0 1.6 1.123 2.994 2.707 3.227 1.068.157 2.148.279 3.238.364.466.037.893.281 1.153.671L12 21l2.652-3.978c.26-.39.687-.634 1.153-.67 1.09-.086 2.17-.208 3.238-.365 1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z" />
                    </svg>
                    <button class="text-xs font-medium   px-2 py-1">20 Replies</button>
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

<script setup>
import { ref ,defineProps} from 'vue'

const {comment} = defineProps(['comment'])



</script>