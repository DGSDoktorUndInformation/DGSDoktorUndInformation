<template>
    <v-container fluid>
        <v-row>
            <v-col cols="auto"></v-col>
            <v-row class="flex-column ma-3 pa-6">
                <v-card>
<!--                    Dolmetscher, Kontakt, Selbsttest -->
                </v-card>
            </v-row>
            <v-row class="flex-column ma-3 pa-6" >
                <v-card>
                    <suche :sessionkey="data.patientenCode"/>
                </v-card>
            </v-row>
            <v-row class="flex-column ma-3 pa-6">
                <v-card>
<!--                    Chat           -->
                </v-card>
            </v-row>
        </v-row>


    </v-container>

</template>

<script>
    import Suche from "../components/Suche";

    export default {
        name: "Session",
        components: {Suche},
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