<template>
    <v-app>
        <MenuBar></MenuBar>
        <v-content>
            <router-view/>
        </v-content>
      <v-footer>
          <img src="./assets/Logo_Projekt_02.png" alt="Wir vs Virus Logo" height="65px">
      </v-footer>
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
