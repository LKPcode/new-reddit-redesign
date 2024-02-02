<template>

    <!-- Main Content that has two Collumns -->
    <div class="flex m-auto sm:w-[900px] ">

        <!-- Left Column -->
        <div class="sm:w-4/6">
        
            <SortBy @selected="(event)=>{selected(event)}"/>

            <Post v-for="post in posts" :key="post.id" :post="post" />

        </div>
        <!-- Right Column -->
        <div class="w-2/6 m-2 md:block hidden">
            <SubredditList/>

        </div>
    </div>

</template>

<script setup>

const posts = ref([]);

onMounted(async () => {
   
})


// Select Sort by value
const selectedSortBy = ref("best");
const selected = async (event) => {

}


</script>