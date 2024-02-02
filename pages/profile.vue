<template>

    <ProfileTabs />
    <!-- Main Content that has two Collumns -->
    <div class="flex m-auto  mt-2 px-4">

        <!-- Left Column -->
        <div class="md:w-4/6 w-full">

            <NuxtPage/>

        </div>
        <!-- Right Column -->
        <div class="md:w-2/6 m-2 md:block hidden">
            <ProfileCard />
        </div>
    </div>

    <CreateSubreddit />

</template>

<script setup>



// Get the tab from the route
let tab = ref('')


</script>




