<template>
 <v-container>

  <v-list>
  <v-list-item>
   <v-list-item-title v-for="i in data" :key="i.key()">
    {{i.key()}} : {{i.value()}}
   </v-list-item-title>
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
    }
</script>

<style scoped>

</style>