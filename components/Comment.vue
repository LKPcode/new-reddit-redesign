<template>

    <div class="bg-slate-700 rounded-md ">

        <div v-for="(comment, i ) in props.comments" :key="comment.id" class="flex mt-2">
            <!-- Left Side -->
            <div class=" bg-slate-700 rounded-l-md flex flex-col">
                <div class="w-[30px] flex flex-col  flex-grow ml-1">
                    <img class="w-5 h-5 bg-white rounded-full m-auto my-2" src="../assets/vue.svg" alt="">
                    <div class="flex-grow bg-gray-600 hover:bg-gray-300 w-[2px] m-auto rounded-md"></div>
                </div>
            </div>
            <div class="flex-grow bg-slate-700 rounded-r-md">
                <!-- Subreddit name and post metadata -->
                <div class="flex items-center my-2">
                    <p class="text-sm text-white mx-2 hover:underline cursor-pointer">u/{{ comment.user.username}}</p>
                    <p class="text-xs text-gray-400">Commented at {{ new Date(comment.createdAt).toISOString().split('T')[0] }} </p>
                </div>

                <div>

                    <!-- Comment body -->
                    <div class="m-2">
                        <p class="text-sm text-white pr-8">
                            <!-- Dummy text content -->
                            {{ comment.body }}
                        </p>
                    </div>
                    <!-- Post buttons -->
                    <div class="flex items">
                        <!-- Upvote -->
                        <div class=" flex text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                                stroke="currentColor"
                                class="w-4 h-4 m-auto text-gray-400 hover:text-orange-500 cursor-pointer">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M12 19.5v-15m0 0l-6.75 6.75M12 4.5l6.75 6.75" />
                            </svg>
                            <p class="text-xs m-1 text-gray-300">420</p>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                                stroke="currentColor"
                                class="w-4 h-4 m-auto text-gray-400 hover:text-blue-500 cursor-pointer">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M19.5 13.5L12 21m0 0l-7.5-7.5M12 21V3" />
                            </svg>

                        </div>


                        <!-- Comment -->
                        <div @click="toggleReplyEditor(i)" class="flex rounded-md text-gray-400 hover:bg-gray-600 align-middle items-center px-2 ">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                                stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M2.25 12.76c0 1.6 1.123 2.994 2.707 3.227 1.068.157 2.148.279 3.238.364.466.037.893.281 1.153.671L12 21l2.652-3.978c.26-.39.687-.634 1.153-.67 1.09-.086 2.17-.208 3.238-.365 1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z" />
                            </svg>
                            <button  class="text-xs font-medium   px-2 py-1">Reply</button>
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

                    <!-- Reply editor -->
                    <div v-if="showReplyEditor[i] == true" class="mt-4 mr-4">
                        <p class="text-gray-500 text-sm">Comment as <span
                                class="hover:underline cursor-pointer text-orange-500">u/GeniusPrompter</span> </p>
                        <div class="relative">
                            <textarea
                                v-model="newComments[i]"
                                class="w-full h-24  rounded-md my-2 p-2 px-4 bg-slate-900 text-white"
                                name="create-comment" id="" cols="30" rows="10"
                                placeholder="What are your thoughts?"></textarea>

                            <div class="flex justify-end absolute bottom-6 right-2">
                                <button @click="createCommentHandler(comment.id,i)" class="bg-orange-400 text-white rounded-md px-3 py-1">Publish</button>
                            </div>
                        </div>
                    </div>


                    <!-- Comment replies -->
                    <Comment v-if="'replies' in comment && comment.replies.length > 0" :comments="comment.replies" />

                </div>

            </div>

        </div>






    </div>


</template>

<script setup>


// accept a comments prop
const props = defineProps(['comments'])

const showReplyEditor = ref(Array(props.comments.length).fill(false))

const newComments = ref(Array(props.comments.length).fill(''));

const toggleReplyEditor = (i) => {
    showReplyEditor.value[i] = !showReplyEditor.value[i]
}


const createCommentHandler = (parentID,i) => {
    
}



</script>