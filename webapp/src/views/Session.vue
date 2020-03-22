<template>
    <v-container fluid>
        <v-row>
            <v-row class="ma-3 pa-3">
                <v-card class="col-12">
<!--                    Dolmetscher, Kontakt, Selbsttest -->
                </v-card>
            </v-row>
            <v-row class="ma-3 pa-3" >
                <v-card class="col-12">
                    <suche :sessionkey="data.patientenCode"/>
                </v-card>
            </v-row>
            <v-row class="ma-3 pa-3">
                <v-card color="#374151" class="col-12">
                    <chat :sessionkey="data.patientenCode"></chat>
                </v-card>
            </v-row>
        </v-row>


    </v-container>

</template>

<script>
    import Suche from "../components/Suche";
    import Chat from "../components/Chat";

    export default {
        name: "Session",
        components: {Chat, Suche},
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