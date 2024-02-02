<template>
    <!-- About Community -->
    <div class="bg-slate-700 rounded-md p-4 text-white sticky top-16">

        <h1 class="font-medium text-gray-400 text-md">Top Subreddits Today</h1>
        
        <div v-for="sub in [1, 2, 3, 4]">
            <div class="h-[1px] bg-gray-500 my-3"></div>
            <div class="flex items-center cursor-pointer ">
                <img class="w-8 h-8 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg"
                    alt="">
                <div>
                    <h1 class="font-medium hover:underline text-gray-200 text-sm">r/ChatGPT</h1>
                    <p class="text-xs text-gray-400">30k Members</p>
                </div>
                
            </div>
            
        </div>
    </div>
</template>