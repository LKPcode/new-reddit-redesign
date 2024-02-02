<template>

    <div class="bg-slate-700 overflow-auto">
      <div class="flex m-auto w-full px-4 text-white cursor-pointer">
        <div
          v-for="tab in tabs"
          :key="tab"
          :class="{ 'px-4 mt-2 font-medium test-sm': true, 'border-b-2': activeTab === tab }"
        >
         <NuxtLink :to="`/profile/${tab.toLowerCase()}`"> {{ tab }} </NuxtLink>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import { useRouter, useRoute } from 'vue-router'

    let router = useRouter()
    let route = useRoute()

    let  activeTab = ref('POSTS')
    let tabs = ref(['POSTS', 'COMMENTS', 'OVERVIEW', 'SAVED', 'HIDDEN', 'UPVOTED', 'DOWNVOTED', 'SUBSCRIPTIONS'])
   

    // Set active tab on page load
    var splitedUrl = route.path.split('/');   
    var lastPath = splitedUrl[splitedUrl.length - 1];
    activeTab.value = lastPath.toUpperCase();

    // set active tab on route change
    router.afterEach((to, from) => {
        var splitedUrl = to.path.split('/');   
        var lastPath = splitedUrl[splitedUrl.length - 1];
        activeTab.value = lastPath.toUpperCase();
    })

  </script>

  
  
  
  
  