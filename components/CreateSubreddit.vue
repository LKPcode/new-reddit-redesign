<script setup lang="ts" >

import { routerKey } from 'vue-router';
import type { Subreddit } from '~/types'

const { showCreateSubredditSlideover } = useAppState()
const { createSubreddit, uploadSubredditImage } = useApi()
const toast = useToast()
const router = useRouter()



const subreddit = ref<Subreddit>({
    name: '',
    description: '',
    image_url: null,
})

const showcase_image = ref<string | null>(null)
const setImage = (event: File) => {
    subreddit.value.image_url = event;
    showcase_image.value = URL.createObjectURL(event);
}

const create = async () => {
  try{
    // Upload image
    const image_path = await uploadSubredditImage( subreddit.value.name ,subreddit.value.image_url as File)
    subreddit.value.image_url = image_path
    // Create subreddit
    await createSubreddit(subreddit.value)
    showCreateSubredditSlideover.value = false
    router.push("/subreddit/" + subreddit.value.name)
    toast.add({ title: 'Subreddit created successfully' })
  }catch(e){
    // Notify user of error
    toast.add({ title: 'There was a problem creating the subreddit, please try again' })
    console.error(e)
  }
}

</script>


<template>
    <div>
      <USlideover v-model="showCreateSubredditSlideover">
        <UCard class="flex flex-col flex-1" :ui="{  background: 'bg-white dark:bg-slate-800', body: { base: 'flex-1' }, ring: '', divide: 'divide-y divide-gray-100 dark:divide-gray-800' }">
          <template #header>
            <div class="p-2 text-center font-bold text-gray-400">
                Create a Community
            </div> 
          </template>

          <div class="p-5 h-full flex flex-col justify-between">

            <div class="mt-4">
            <p class="text-gray-500 text-sm">Subreddit Name</p>
            <div class="relative">
                <input
                v-model="subreddit.name"
                type="text"
                 class="w-full text-sm  rounded-md my-2 p-2 px-4 bg-slate-700 text-white"  id="" 
                placeholder="Example: AI">
            </div>
            </div>

            <div class="mt-4">
            <p class="text-gray-500 text-sm">Provide a description for the community</p>
            <div class="relative">
                <textarea
                v-model="subreddit.description"
                 class="w-full h-24 text-sm  rounded-md my-2 p-2 px-4 bg-slate-700 text-white" name="create-comment" id="" cols="30"
                rows="10" placeholder="Example: Discussions about the advancements in the AI space."></textarea>
            </div>
            </div>


            <div class="mt-4">
                <p class="text-gray-500 text-sm">Upload an Image</p>
                <FileDropzone @file-selected="setImage"  />
            </div>

            <div class="mt-4">
                <p class="text-gray-500 mb-1  text-sm">Showcase</p>
                         <!-- About Community -->
            <div class="bg-slate-700 rounded-md p-4 text-white">
            <div class="flex items-center ">
                <img v-if="showcase_image" class="w-12 h-12 rounded-full border mr-4" :src="(showcase_image as string)" alt="">
                <!-- <div v-else class="w-12 h-12 rounded-full border mr-4 bg-slate-600" > </div> -->
                <h1 v-if="subreddit.name" class=" font-medium text-gray-200">r/{{ subreddit.name }}</h1>
            </div>
                <p class=" mt-2 text-sm"> {{ subreddit.description }} </p>
            </div>
            </div>


            <button @click="create" 
                    class="bg-orange-400 mt-auto block w-full text-slate-900 font-bold rounded-md px-3 py-1">Publish</button>

          </div>
               

         
        </UCard>
      </USlideover>
    </div>
  </template>
