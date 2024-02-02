<template>
    <nav class="fixed w-full flex items-center  bg-slate-700 shadow-lg px-3 py-1 z-10">
        <!-- logo -->
        <NuxtLink to="/">
        <div class="flex items-center flex-shrink-0 text-white mr-6 cursor-pointer">
            <span class="font-semibold text-xl tracking-tight">Reddit Clone</span>
        </div>
        </NuxtLink>
        <!-- Search Bar -->
        <div class="flex-grow"></div>
        <!-- <div class=" flex flex-grow items-center">
                <input class="px-3 py-2 text-sm leading-tight text-white w-full
                 bg-slate-600 border border-gray-500 rounded-md 
                shadow appearance-none focus:outline-none focus:shadow-outline" 
                id="search" type="text" placeholder="Search">
        </div> -->
        <Dropdown class="ml-6" />
    </nav>

</template>

<script setup>

const router = useRouter();

const goToHome = () => {

}


</script>