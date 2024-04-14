<template>
    <span ref="target" class="cursor-pointer">
        <div class="relative w-[250px]">
            <button @click="toggleMenu"
                class="relative  flex items-center  border border-slate-700 hover:border-slate-500 px-2 py-1.5 text-left rounded-md text-white w-20  ">



                <div class="ml-1">
                    <span v-if="selected_type==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selected_type }} </span>
                    <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4 ml-auto ">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                </svg>

            </button>
            <ul v-show="menuOpen"
                class="absolute z-10 bg-slate-700  border border-slate-500 rounded-md shadow-lg w-20 top-0 ">
                <button @click="toggleMenu"
                    class="relative flex items-center px-2 py-1 text-left rounded-md text-white w-full">

                    <div class="ml-1 ">
                    <span v-if="selected_type==null" class="text-sm block m-0 p-0"> Select a Subreddit </span>
                    <span v-else class="text-sm block m-0 p-0"> {{ selected_type }}</span>
                        <!-- <span class="text-xs block p-0 m-0 text-gray-400"> 30k Members </span> -->
                    </div>


                </button>

                <div class="overflow-auto">
                    <li v-for='type in types'
                         @click="typeSellected(type)"
                         :key="type"
                         v-show="type != selected_type"
                        class="flex px-2 py-1 hover:bg-slate-600 cursor-pointer text-white">


                        <span class="text-sm block m-0 p-0"> {{ type }} </span>
                    </li>
                </div>



            </ul>
        </div>
    </span>
</template>



<script setup lang="ts">

const router = useRouter();
const target = ref<HTMLElement | null>(null)
onClickOutside(target, event => menuOpen.value = false)

const emits = defineEmits(['typeSelected'])

const selected_type = ref<string|null>('Text')

// Define reactive state for menu
const menuOpen = ref(false)

const types = ref<string[]>(['Text', 'Image'])


// Define function to toggle menu
function toggleMenu() {
    menuOpen.value = !menuOpen.value;
}

const typeSellected = (type: string) => {
    selected_type.value = type
    emits('typeSelected', type)
    toggleMenu()
}





</script>