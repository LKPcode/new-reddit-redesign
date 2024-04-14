// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  
  devtools: { enabled: true },
  
  modules: ['@nuxtjs/supabase', '@nuxt/ui', '@vueuse/nuxt'],

  supabase: {
    redirect: false
  },

  imports: {
    dirs: [
      // https://nuxt.com/docs/guide/directory-structure/composables
      // scan all modules within given directory (Scan nested directories)
      'composables/**'
    ]
  }

})
