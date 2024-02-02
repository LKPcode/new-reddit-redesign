<template>
    <span class="cursor-pointer">
        <div class="relative w-[250px]">
            <button @click="toggleMenu"
                class="relative flex items-center  border border-slate-700 hover:border-slate-500 px-2 py-1 text-left rounded-md text-white w-full">
                <img class="w-6 h-6 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg"
                    alt="">

                <div class="ml-1 ">
                    <span v-if="selectedSub==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selectedSub.name }} </span>
                    <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4 ml-auto ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                </svg>

            </button>
            <ul v-if="menuOpen"
                class="absolute z-10 bg-slate-700  border border-slate-500 rounded-md shadow-lg w-full top-0 ">
                <button @click="toggleMenu"
                    class="relative flex items-center px-2 py-1 text-left rounded-md text-white w-full">
                    <img class="w-6 h-6 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg"
                        alt="">

                    <div class="ml-1 ">
                    <span v-if="selectedSub==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selectedSub.name }}</span>
                        <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                    </div>


                </button>

                <div class="overflow-auto">
                    <li v-for='(sub, id) in subreddits'
                         @click="subredditSellected(sub)" 
                         :key="sub.id"
                        class="flex px-2 py-1 hover:bg-slate-600 cursor-pointer text-white">

                        <img class="w-6 h-6 rounded-full border mr-4"
                            src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">

                        <span class="text-sm block m-0 p-0"> {{ sub.name }} </span>
                    </li>
                </div>



            </ul>
        </div>
    </span>
</template>



<script setup>


const emit = defineEmits(['selected'])

const selectedSub = ref(null)
const subreddits = ref([])

const router = useRouter();

// Define reactive state for menu
const menuOpen = ref(false)

onMounted(async () => {

})


// Define function to toggle menu
function toggleMenu() {
    menuOpen.value = !menuOpen.value;
}

const goTo = (path) => {
    toggleMenu();
}

const subredditSellected = (subreddit) => {
    console.log("Subreddit Selected: ",subreddit, subreddit.id)
    toggleMenu()
}


</script>