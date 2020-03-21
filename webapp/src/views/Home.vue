<template>
    <div>
        <v-container fluid>
            <v-row>
                <session-start></session-start>
            </v-row>
            <v-row justify="center">
                <router-link to="/anleitung-aerzte" replace>Anleitung für Ärzte</router-link>
            </v-row>


            <!--    <router-link to="/anleitung-angehoerige">Anleitung für Angehörige</router-link>-->
        </v-container>
    </div>
</template>

<script>
    // @ is an alias to /src

    import SessionStart from "../components/SessionStart";

    export default {
        name: 'Home',
        components: {
            SessionStart
        },
    }
</script>
