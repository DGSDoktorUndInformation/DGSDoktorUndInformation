<template>
    <v-container fluid>
        <v-row class="ma-3">
            <v-col cols="3">
                <Patient :data="data.patient" class="mb-3"></Patient>
                <DolmetscherKontakt class="mb-3"></DolmetscherKontakt>
                <ErreichbarePerson v-if="!(data.kontaktPerson.telefonNummer===null && data.kontaktPerson.eMailAdresse===null)" :data="data.kontaktPerson" class="mb-3"></ErreichbarePerson>
                <CoronaSelbsttestInfo v-if="data.selbstTest!==null" :data="data.selbstTest" class="mb-3"></CoronaSelbsttestInfo>
            </v-col>
            <v-col cols="5">
                <v-card class="col-12">
                    <suche :sessionkey="data.patientenCode"/>
                </v-card>
            </v-col>
            <v-col cols="4">
                <v-card color="#374151" class="col-12">
                    <chat :sessionkey="data.patientenCode"></chat>
                </v-card>
            </v-col>
        </v-row>


    </v-container>

</template>

<script>
    import Suche from "../components/Suche";
    import Chat from "../components/Chat";
    import DolmetscherKontakt from "../components/DolmetscherKontakt";
    import ErreichbarePerson from "../components/ErreichbarePerson";
    import Patient from "../components/Patient";
    import CoronaSelbsttestInfo from "../components/CoronaSelbsttestInfo";

    export default {
        name: "Session",
        components: {ErreichbarePerson, DolmetscherKontakt, Chat, Suche, Patient, CoronaSelbsttestInfo},
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
