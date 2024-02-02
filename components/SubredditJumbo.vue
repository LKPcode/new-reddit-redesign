<template>
     <div class="bg-yellow-600 h-[150px]">
        <div class="flex items-center m-auto w-[900px] h-full ">
            <img class="w-[100px] h-[100px] rounded-full border " src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">
            <div class="mx-8">
                <h1 class="text-[40px] font-bold ">
                   <span class="text-gray-900">r/</span>{{subreddit?.name}}
                </h1>
                <!-- Join Button -->
                <h2 class="text-[20px] font-medium text-gray-900"> {{ subreddit?.description }} </h2>
                <!-- <div class="flex">
                     <h3 class="font-medium mt-2 mr-4">30k <span class="font-light text-sm">Members</span></h3>
                    <h3 class="font-medium mt-2"><span class="font-light text-sm">Members</span></h3>
                </div> -->
               
            </div>
            
        </div>
    </div>
</template>

<script setup>
// define props
const {subreddit} = defineProps(['subreddit'])

</script>