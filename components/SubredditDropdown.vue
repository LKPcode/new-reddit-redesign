<template>
    <span ref="target" class="cursor-pointer">
        <div class="relative w-[250px]">
            <button @click="toggleMenu"
                class="relative flex items-center  border border-slate-700 hover:border-slate-500 px-2 py-1 text-left rounded-md text-white w-full">
                <img class="w-6 h-6 rounded-full border mr-4" :src="(selected_subreddit?.image_url as string)"
                    alt=""/>

                <div class="ml-1">
                    <span v-if="selected_subreddit==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selected_subreddit.name }} </span>
                    <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4 ml-auto ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                </svg>

            </button>
            <ul v-show="menuOpen"
                class="absolute z-10 bg-slate-700  border border-slate-500 rounded-md shadow-lg w-full top-0 ">
                <button @click="toggleMenu"
                    class="relative flex items-center px-2 py-1 text-left rounded-md text-white w-full">
                    <img class="w-6 h-6 rounded-full border mr-4" :src="(selected_subreddit?.image_url as string)"
                        alt="">

                    <div class="ml-1 ">
                    <span v-if="selected_subreddit==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selected_subreddit.name }}</span>
                        <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                    </div>


                </button>

                <div class="overflow-auto">
                    <li v-for='sub in subreddits'
                         @click="subredditSellected(sub)"
                         :key="sub.name"
                         v-show="sub.name != selected_subreddit?.name"
                        class="flex px-2 py-1 hover:bg-slate-600 cursor-pointer text-white">

                        <img class="w-6 h-6 rounded-full border mr-4"
                            :src="(sub.image_url as string)" alt="">

                        <span class="text-sm block m-0 p-0"> {{ sub.name }} </span>
                    </li>
                </div>



            </ul>
        </div>
    </span>
</template>



<script setup lang="ts">
import type { Subreddit } from '~/types';

// const props = defineProps(['subreddit'])
const route = useRoute();

const target = ref<HTMLElement | null>(null)
onClickOutside(target, event => menuOpen.value = false)

const { getSubreddits } = useApi();


const selected_subreddit = ref<Subreddit|null>()

const router = useRouter();

// Define reactive state for menu
const menuOpen = ref(false)

const { data: subreddits } = await useAsyncData('subreddits', async () => {
    try {
        const subs = await getSubreddits();
        // console.log(sub);
        return subs;
    } catch (e) {
        console.error(e);
    }

    return null;
})

if (subreddits.value) {
    console.log("Subreddits", subreddits.value);
    selected_subreddit.value = subreddits.value.find((subreddit: Subreddit) => subreddit.name == route.params.id)
    console.log("Selected Sub" ,selected_subreddit.value);
}



// Define function to toggle menu
function toggleMenu() {
    menuOpen.value = !menuOpen.value;
}

const subredditSellected = (subreddit: Subreddit) => {
    console.log("Subreddit Selected: ",subreddit, subreddit.name)
    router.push(`/createpost/${subreddit.name}`)
    toggleMenu()
}





</script>