<template>
  <div 
   ref="target" class="relative w-[250px]">
    <button  @click="toggleMenu"
      class="relative flex items-center  border border-slate-700 hover:border-slate-500 px-2 py-1 text-left rounded-md text-white w-full">
      <img class="w-8 h-8 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">

      <div class="ml-1 ">
        <span class="text-sm block m-0 p-0">{{user.username}}</span>
        <span class="text-xs block p-0 m-0 text-gray-400">10.2 Karma</span>
      </div>

    </button>
    <ul v-if="menuOpen"  class="absolute z-10 bg-slate-700  border border-slate-500 rounded-md shadow-lg w-full top-0 ">
      <button @click="toggleMenu" class="relative flex items-center px-2 py-1 text-left rounded-md text-white w-full">
        <img class="w-8 h-8 rounded-full border mr-4" src="../assets/75cce6fa16b14348860d4687049ed9d6.jpeg" alt="">

        <div class="ml-1 ">
          <span class="text-sm block m-0 p-0">{{user.username}}</span>
          <span class="text-xs block p-0 m-0 text-gray-400">10.2 Karma</span>

        </div>

      </button>

      <NuxtLink  @click="toggleMenu" :to="`/profile/${user.username}/posts`" >
        <li class="flex px-3 py-1 hover:bg-slate-600 cursor-pointer text-white">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
            class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>

          <span class="mx-4">Profile</span>
        </li>
      </NuxtLink>

      <NuxtLink  @click="toggleMenu" to="/profile/subscriptions" >
        <li @click="goTo('/profile/subscriptions')" class="flex px-3 py-1 hover:bg-slate-600 cursor-pointer text-white">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
            class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />
          </svg>

          <span class="mx-4">Subscriptions</span>
        </li>
      </NuxtLink>

      <li class="flex px-3 py-1 hover:bg-slate-600 cursor-pointer text-white">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
          class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
          <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg>


        <span class="mx-4">Settings</span>
      </li>
      <li class="flex px-3 py-1 hover:bg-slate-600 cursor-pointer text-white hover:text-orange-400">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
          class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75" />
        </svg>

        <span class="mx-4">Log Out</span>
      </li>

    </ul>
  </div>
</template>
  
<script setup>



const router = useRouter();
const route = useRoute();
const { user } = useAppUser();

console.log("Route: ", route.path);

// Define reactive state for menu
const menuOpen = ref(false)


const target = ref(null)
onClickOutside(target, event => menuOpen.value = false)


// Define function to toggle menu
function toggleMenu() {
  menuOpen.value = !menuOpen.value;
}

const goTo = (path) => {
  router.push(path);
  toggleMenu();
}


</script>