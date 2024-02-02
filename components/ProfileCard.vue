<template>
    <!-- About Community -->
    <div class="bg-slate-700 relative rounded-md p-4 text-white">
        <div class="h-20"></div>
         <div class="h-20 bg-orange-400 absolute w-full top-0 left-0 rounded-t-md">

            <img class="w-24 h-24 rounded-md border m-auto mt-4 " src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">  

         </div>
     
          <p class=" mt-8 text-center text-xl font-bold">GeniusPrompter</p>

          <div class="h-[1px] bg-gray-500 my-3"></div>

          <div class="flex justify-evenly">
              <div class="pr-4">
                  <p class="text-sm font-medium">10.2k</p> 
                  <p class="text-xs text-gray-400">Karma</p>
              </div>

              <div class="px-4">
                  <p class="text-sm font-medium">Dec 1, 2022</p>
                   <p class="text-xs text-gray-400">Created</p>
              </div>

              <div class="px-4">
                  <p class="text-sm font-medium">54</p>
                   <p class="text-xs text-gray-400">Posts</p>
              </div>

              <div class="px-4">
                  <p class="text-sm font-medium">120</p>
                   <p class="text-xs text-gray-400">Comments</p>
              </div>
          </div>
          <div class="h-[1px] bg-gray-500 my-3"></div>

          
          <button  class="bg-slate-800 hover:bg-slate-900 text-white w-full px-2 py-1 rounded-md font-medium">Edit Profile</button>
          <button @click="showCreateSubredditSlideover=true" class="bg-gray-100 hover:bg-gray-200 text-black w-full px-2 py-1  mt-2 rounded-md font-medium">Create Community</button>
      
      </div>
</template>


<script setup>

const router = useRouter();

const { showCreateSubredditSlideover } = useSubreddit()

const goTo = (path) => {
    router.push(path);
}

</script>