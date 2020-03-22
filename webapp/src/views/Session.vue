<template>
    <v-container fluid>
        <v-row>
            <v-row class="ma-3 pa-3">
                <v-container class="col-12">
                    <DolmetscherKontakt></DolmetscherKontakt>
                    <ErreichbarePerson v-if="!(data.kontaktPerson.telefonNummer===null && data.kontaktPerson.eMailAdresse===null) "   :data="data.kontaktPerson"></ErreichbarePerson>
<!--                    <CoronaSelbsttestInfo v-if="data.selbstTest!==null"></CoronaSelbsttestInfo>-->
                </v-container>
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
    import DolmetscherKontakt from "../components/DolmetscherKontakt";
    import ErreichbarePerson from "../components/ErreichbarePerson";
  //  import CoronaSelbsttestInfo from "../components/CoronaSelbsttestInfo";

    export default {
        name: "Session",
         components: { ErreichbarePerson, DolmetscherKontakt, Chat, Suche},
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