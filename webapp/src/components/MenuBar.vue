<template>


    <v-app-bar
            app
            color="primary"
            dark
    >
        <!--  TODO nerviger Button, ander Loesung finden   -->
        <v-btn  text to="/Home"><v-toolbar-title >
            DGSDocInfo
        </v-toolbar-title>
        </v-btn>

        <v-spacer></v-spacer>
        <v-btn  text to="/Faq" >FAQ</v-btn>

    </v-app-bar>

</template>

<script>
    export default {
        name: "MenuBar"
    }
</script>

<style scoped>

</style>