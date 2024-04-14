<script setup lang="ts">

const dropZoneRef = ref<HTMLDivElement>()
const selected_files = ref<File[]>([])

const emit = defineEmits(['fileSelected'])

function onDrop(files: File[] | null) {
  // called when files are dropped on zone

    console.log(files)
    if (files) {
        

        selected_files.value = files
        emit("fileSelected", files[0])
        console.log("files", selected_files.value)
    }
}

const { isOverDropZone } = useDropZone(dropZoneRef, {
  onDrop,
  // specify the types of data to be received.
  dataTypes: ['image/jpeg', 'image/png', 'image/gif'],
})
</script>

<template>
  <div 
    :class="{
      'border-2 border-dashed border-slate-700': !isOverDropZone,
      'border-2 border-dashed border-orange-400': isOverDropZone,
    }"
    class="w-full h-24 text-sm flex justify-center items-center rounded-md my-2 p-2 px-4 bg-slate-800  text-white" ref="dropZoneRef">
   <div v-if="!isOverDropZone && selected_files.length==0" class="text-gray-300">
        Drag And Drop Image Here 
    </div>
    <div v-else-if="isOverDropZone && selected_files.length==0" class="text-gray-300">
        Let go! 
    </div>
    <div v-else-if="selected_files.length>0" class="text-gray-300">
        Image Selected
    </div>

  </div>
</template>