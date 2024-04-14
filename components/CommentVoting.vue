<script setup lang="ts">

import type { Comment } from '~/types'

const { voteOnComment } = useApi()


const { comment } = defineProps<{
  comment: Comment
}>()

const voted = ref<string|null>(comment.voted as string|null)
const vote = async (voteType:string) => {
   try {
       if (voted.value === voteType) {
           if (voted.value === 'up') {
               (comment.votes as number) -= 1
           } else if (voted.value === 'down') {
               (comment.votes as number) += 1
           }
           voted.value = null
       } else {
           voted.value = voteType
            if (voted.value === 'up') {
                (comment.votes as number) += 1
            } else if (voted.value === 'down'){
                (comment.votes as number) -= 1
            }
       }
       
       const res = await voteOnComment(comment.comment_id as number, voteType)
       console.log(res)
   } catch (e) {
       console.error(e)
   }
}

</script>


<template>
 <div class="text-center flex w-[40px] ">
                <svg
                    :class="voted==='up' ? 'text-orange-500' : 'text-gray-400' "
                     @click="vote('up')" 
                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                    stroke="currentColor" class="w-4 h-4 m-auto  hover:text-orange-500 cursor-pointer">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 19.5v-15m0 0l-6.75 6.75M12 4.5l6.75 6.75" />
                </svg>
                <p class="text-xs m-1 text-gray-300">{{ comment.votes }}</p>
                <svg :class="voted==='down' ? 'text-blue-500' : 'text-gray-400' "
                    @click="vote('down')"
                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="5"
                    stroke="currentColor" class="w-4 h-4 m-auto  hover:text-blue-500 cursor-pointer">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 13.5L12 21m0 0l-7.5-7.5M12 21V3" />
                </svg>

            </div>
</template>