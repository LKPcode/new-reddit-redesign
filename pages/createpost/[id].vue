<template>
    <SubredditJumbo v-if="subreddit!=null" :subreddit="subreddit" />

    <div class="flex m-auto sm:w-[900px] mb-20 ">

        <!-- Left Column -->
        <div class="sm:w-4/6">
            <!-- <span class=" font-bold">Create Post as</span>
                <span class="hover:underline cursor-pointer text-orange-500">
                    u/GeniusPrompter
                </span>
                in -->
            <!-- Post Card like a post on Reddit -->
            <p class="text-gray-500 text-md font-medium mt-2 flex items-center">
                Create Post
            </p>

            <div class="h-[1px] bg-slate-600 my-2"></div>

            <div class="flex gap-4">
                <SubredditDropdown />

                <PostTypesDropdown @type-selected="typeSelected" />

            </div>
           
            <div class="flex rounded-md cursor-default my-2 ">

                <div class=" bg-slate-700 rounded-l-md ">
                    <div class="text-center w-[40px] mt-3 blur-[2px]">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                            stroke="currentColor" class="w-4 h-4 m-auto text-gray-400 ">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M12 19.5v-15m0 0l-6.75 6.75M12 4.5l6.75 6.75" />
                        </svg>
                        <p class="text-xs m-1 text-gray-300">0</p>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                            stroke="currentColor" class="w-4 h-4 m-auto text-gray-400  ">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M19.5 13.5L12 21m0 0l-7.5-7.5M12 21V3" />
                        </svg>

                    </div>
                </div>

                <div class="flex-grow bg-slate-700 rounded-r-md">
                    <!-- Subreddit name and post metadata -->
                    <div class="flex items-center m-2">
                        <img class="w-[16px] h-[16px] bg-white border border-gray-500 rounded-full" src="~/assets/75cce6fa16b14348860d4687049ed9d6.jpeg"
                            alt="subreddit-image">
                        <p class="text-sm text-white mx-2 hover:underline cursor-pointer">r/{{ subreddit?.name }}</p>
                        <p class="text-xs text-gray-400 mr-2">Post by <span
                                class="hover:underline text-orange-500 cursor-pointer">you</span></p>
                        <p class="text-xs text-gray-400">Posted at <span class="blur-[2px]">11/11/2022</span> </p>
                    </div>
                    <!-- Post title and content -->
                    <div class="ml-2 flex flex-col">
                        <textarea v-model="post.title"
                            class="block h-20 border border-gray-500  rounded-md mr-2 my-2 p-2 px-4 bg-slate-700 text-white"
                            name="create-comment" id="" cols="30" rows="10" placeholder="Title"></textarea>


                        <textarea v-if="post.type=='text'" v-model="post.content"
                            class="block h-36 border border-gray-500  rounded-md mr-2 my-2 p-2 px-4 bg-slate-700 text-white"
                            name="create-comment" id="" cols="30" rows="10" placeholder="Body"></textarea>

                            <div class="pr-2">
                                <FileDropzone v-if="post.type=='image'" @file-selected="imageSelected" />
                            </div>

                            <img v-if="image_object_url" :src="image_object_url" alt="Selected Image">

                    </div>

                    <div class="flex justify-between">
                        <!-- Post buttons -->
                        <div class="flex items pb-1  mx-2 mt-2 blur-[2px]">
                            <!-- Comment -->
                            <div class="flex rounded-md text-gray-400 align-middle items-center px-2 ">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M2.25 12.76c0 1.6 1.123 2.994 2.707 3.227 1.068.157 2.148.279 3.238.364.466.037.893.281 1.153.671L12 21l2.652-3.978c.26-.39.687-.634 1.153-.67 1.09-.086 2.17-.208 3.238-.365 1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z" />
                                </svg>
                                <button class="text-xs font-medium cursor-default   px-2 py-1">0 Comments</button>
                            </div>
                            <!-- Share -->
                            <div class="flex rounded-md text-gray-400  align-middle items-center px-2 ">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z" />
                                </svg>

                                <button class="text-xs  font-medium cursor-default    px-2 py-1">Share</button>

                            </div>
                            <!-- Save -->
                            <div class="flex rounded-md text-gray-400  align-middle items-center px-2 ">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                                </svg>
                                <button class="text-xs  font-medium cursor-default   px-2 py-1">Save</button>

                            </div>
                        </div>
                        <div class="flex justify-end  pb-1  mx-2 my-2 ">
                            <button @click="createPostHandler()"
                                class="block bg-orange-400 text-white rounded-md px-3 py-1">Publish Post</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Right Column -->
        <div class="w-2/6 m-2 md:block hidden mt-10">
            <!-- About Community
            <AboutCommunity /> -->

            <!-- Subreddit Rules -->
            <!-- <SubredditRules /> -->
            
        </div>

    </div>
</template>

<script setup lang="ts">
import type { Post, Subreddit } from '~/types'

const route = useRoute()
const { getSubreddit, createPost, uploadPostImage } = useApi()
const toast = useToast()


const subreddit = ref<Subreddit | null>(null)
const { data: subreddit_ } = await useAsyncData('subreddit', async () => {
    try {
        const sub = await getSubreddit(route.params.id as string)
        return sub
    } catch (e) {
        console.error(e)
    }
    return null
})
if (subreddit_.value) {
    subreddit.value = subreddit_.value
}




const image_object_url = ref<string | null>(null)
const image_file = ref<File | null>(null)

const post = ref<Post>({
    title: '',
    content: '',
    subreddit_name: '',
    type: 'text'
})

const imageSelected = (file: File) => {
    const url = URL.createObjectURL(file)
    image_object_url.value = url
    image_file.value = file
}

const typeSelected = (type: string) => {
    post.value.type = type.toLowerCase(); 
    image_object_url.value = null
}



const createPostHandler = async () => {
    try {
        if (post.value.title == '') {
            toast.add({ title: 'Title is required'})
            return
        }
        if (post.value.type == 'text' && post.value.content == '') {
            toast.add({ title: 'Content is required'})
            return
        }
        if (post.value.type == 'image' && image_object_url.value == null) {
            toast.add({ title: 'Image is required'})
            return
        }

        if(post.value.type == 'image'){
            const path = await uploadPostImage(image_file.value as File)
            post.value.content = path;
        }


        post.value.subreddit_name = subreddit.value?.name as string
        const res = await createPost(post.value)
        console.log(res)
        toast.add({ title: 'Post Created', description: 'Your post has been created'})
    } catch (e) {
        console.error(e)
        toast.add({ title: 'Error', description: 'An error occured while creating your post'})
    }

}


</script>
