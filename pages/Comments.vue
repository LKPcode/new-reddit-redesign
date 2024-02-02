<template>
    <div class="w-[900px] m-auto flex ">

        <div class="w-4/6">

        <!-- Post -->
        <Post :post="post" />

        <!-- Create Comment -->
        <div class="mt-4">
            <p class="text-gray-500 text-sm">Comment as <span class="hover:underline cursor-pointer text-orange-500">u/GeniusPrompter</span> </p>
            <div class="relative">
                <textarea
                v-model="newComment"
                 class="w-full h-24  rounded-md my-2 p-2 px-4 bg-slate-700 text-white" name="create-comment" id="" cols="30"
                rows="10" placeholder="What are your thoughts?"></textarea>

                <div class="flex justify-end absolute bottom-6 right-2">
                    <button @click="createCommentHandler()" class="bg-orange-400 text-white rounded-md px-3 py-1">Publish</button>
                </div>
            </div>
        </div>

        <!-- Comments -->
        <div class="mb-4">
            <p class="text-gray-500 text-sm">Comments sorted by Best</p>
            <SortBy @selected="sortByFunc" />
            <Comment v-if="comments!=null" :comments="comments"/>
        </div>
    </div>

    <div class="w-2/6  p-2">
        <AboutCommunity />
    </div>

    </div>

</template>

<script setup>


const post = ref(null);
// Dummy comments 3 levels deep
const comments = ref(null)

const newComment = ref('')





onMounted(async () => {

})


const createCommentHandler = async () => {
   
}


const sortByFunc = (sortBy) => {

}




</script>
