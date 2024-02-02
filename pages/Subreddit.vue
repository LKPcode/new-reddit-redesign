<template>

   <SubredditJumbo :subreddit="subreddit" />

 
    <!-- Main Content that has two Collumns -->
    <div class="flex m-auto w-[900px] ">

        <!-- Left Column -->
        <div class="w-4/6 ">
            <!-- Sort By -->
            <SortBy />

            <!-- Posts -->
            <Post v-for="post in posts" :key="post.id" :post="post" />


        </div>
        <!-- Right Column -->
        <div class="w-2/6 m-2">
      
            <!-- About Community -->
            <AboutCommunity />
            
            <!-- Subreddit Rules -->
            <SubredditRules />


        </div>
    </div>

</template>

<script setup>

const posts = ref([]);

const subreddit = ref(null);

onMounted(async () => {

})



</script>