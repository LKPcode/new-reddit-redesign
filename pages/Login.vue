<template>
    <div class="flex items-center justify-evenly m-32">

    <div class="h-full  w-[400px]">
        <img class="rounded-full" src="../assets/tripy.jpeg" alt="">
    </div>
    
    <div>

    <form @submit.prevent="login" class="flex flex-col w-[400px] mx-auto  bg-slate-700 rounded-md p-4 shadow-lg">
        <h2 class="text-center text-white text-lg mb-4"> LOG IN</h2>
        <input v-model="user.email" placeholder="email" class="mt-4 px-3 py-2 text-sm leading-tight text-white w-full
                  bg-slate-600 border border-gray-500 rounded-md 
                  shadow appearance-none focus:outline-none focus:shadow-outline" type="email" />
        <input v-model="user.password" placeholder="password" class=" mt-4 px-3 py-2 text-sm leading-tight text-white w-full
                  bg-slate-600 border border-gray-500 rounded-md 
                  shadow appearance-none focus:outline-none focus:shadow-outline" type="password" />
        <button class=" bg-white inline rounded-md p-1 m-auto mt-4 text-black w-full font-medium" type="submit">Submit</button>
    </form>

    
</div>
</div>



</template>

<script setup>

const supabase = useSupabaseClient()
const toast = useToast()
const router = useRouter()

const user = ref({ username: "", password: "" })



// LOGIN FUNCTION
const login = async () => {

// Sing Up with Password
const { error } = await supabase.auth.signInWithPassword({
    email: user.value.email,
    password: user.value.password,
})

if (error) {
  toast.add( { title: 'There was a problem with login' } )
} else {
  toast.add( { title: 'Log In Successful!' } )
  // Navigate to home page
  router.push({ path: '/'})
}
}

</script>