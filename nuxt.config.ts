// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  
  devtools: { enabled: true },
  
  modules: ['@nuxtjs/supabase', '@nuxt/ui', '@vueuse/nuxt'],

  supabase: {
    redirect: false
  }

})
