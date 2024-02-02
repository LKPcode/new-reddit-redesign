<template>
          <!-- About Community -->
          <div class="bg-slate-700 rounded-md p-4 text-white">
            <div class="flex items-center ">
                <img class="w-12 h-12 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">
                <h1 class=" font-medium text-gray-200">About r/ChatGPT</h1>
            </div>
                <p class=" mt-2 text-sm">A subreddit dedicated to ChatGPT by OpenAI</p>
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

                <button @click="goTo('/create-post/0')" class="bg-gray-100 hover:bg-gray-200 text-black w-full px-2 py-1 rounded-md font-medium">Create Post</button>
            </div>
</template>

<script setup>


const goTo = (path) => {

}

</script>