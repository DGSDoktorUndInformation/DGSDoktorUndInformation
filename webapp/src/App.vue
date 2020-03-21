<template>
  <v-app>
    <MenuBar></MenuBar>
    <v-content>
    </v-content>
    </v-app>
</template>

<script>

import MenuBar from "./components/MenuBar";
export default {
  name: 'App',

  components: {
    MenuBar
  },

  data: () => ({
    //
  }),
};
</script>
