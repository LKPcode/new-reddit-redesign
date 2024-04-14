<template>
  <div class=" bg-slate-800">
    <NavBar/>
    <div class="h-[54px]"></div>
      <NuxtPage />

    <UNotifications />
    <!-- <Notification/> -->
  </div>

    <Footer/>
</template>

<script setup>

const { getCustomUser } = useAppUser();

let data = await getCustomUser();
console.log("User: ",data);


</script>

<style>
html,body {
  --tw-bg-opacity: 1;
    background-color: rgb(30 41 59 / var(--tw-bg-opacity));
}

</style>