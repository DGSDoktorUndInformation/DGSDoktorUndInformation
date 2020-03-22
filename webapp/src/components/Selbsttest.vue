<template>
 <v-container>

  <v-list>
  <v-list-item>
   <v-row >
   <v-list-item-title align="center" v-for=" [key,value] in Object.entries(data)" :key="key">
    {{key}} : {{value}}
   </v-list-item-title>
   </v-row>
   <v-btn primary @click="destroy"></v-btn>
   </v-list-item>


  </v-list>



 </v-container>


</template>

<script>
    export default {
        name: "Selbsttest",
        props: {
            data: {
                type: Object,
                required: true
            }
        }
     ,methods:{
      destroy(){
       this.$emit('destroyModal')
      }
    }
    }
</script>

<style scoped>

</style>