<template>
  <div class="flex items-center justify-evenly m-32">

    <div class="h-full ">
        <img class=" w-[400px]  rounded-full" src="../assets/tripy.jpeg" alt="">
       
    </div>

    <div>

    <form @submit.prevent="signup" class="flex flex-col w-[400px] mx-auto  bg-slate-700 rounded-md p-4 shadow-lg">
      <h2 class="text-center text-white text-lg mb-4"> SIGN UP </h2>
      <input v-model="user.username" placeholder="username" class="px-3 py-2 text-sm leading-tight text-white w-full
                 bg-slate-600 border border-gray-500 rounded-md 
                shadow appearance-none focus:outline-none focus:shadow-outline" type="text" />
      <input v-model="user.email" placeholder="email" class="mt-4 px-3 py-2 text-sm leading-tight text-white w-full
                 bg-slate-600 border border-gray-500 rounded-md 
                shadow appearance-none focus:outline-none focus:shadow-outline" type="email" />
      <input v-model="user.password" placeholder="password" class=" mt-4 px-3 py-2 text-sm leading-tight text-white w-full
                 bg-slate-600 border border-gray-500 rounded-md 
                shadow appearance-none focus:outline-none focus:shadow-outline" type="password" />
      <button class=" bg-white inline rounded-md p-1 m-auto mt-4 text-black w-full" type="submit">submit</button>
    </form>
  

   
  
  </div>
  </div>

    

</template>

<script setup>

const supabase = useSupabaseClient()
const toast = useToast()


const user = ref({
  username: '',
  email: '',
  password: ''
})


// SIGNUP FUNCTION
const signup = async () => {

    // Sing Up with Password
    const { error } = await supabase.auth.signUp({
        email: user.value.email,
        password: user.value.password,
        options: {
          data: {
            username: user.value.username
          }
        }
    })

    if (error) {
      toast.add( { title:  error.message } )
      console.error('SignUp Error:', error)
    } else {
      toast.add( { title: 'Sugn Up Successful!' } )
    }

}


</script>