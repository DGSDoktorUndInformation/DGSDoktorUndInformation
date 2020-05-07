<!--TODO Daten einfuegen, wenn sie vom Backend bereitgestellt werden-->
<template>
    <v-container class="ma-0 pa-0">
        <v-card>
            <v-row>
                <v-col>
                    <v-list-item three-line>
                        <v-list-item-content>
                            <v-list-item-title class="headline mb-1">Selbsttest</v-list-item-title>
                            <v-list-item-subtitle> Getestet am : {{testdatum}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    <v-card-actions>
                        <v-dialog max-width="600px" v-model="dialog" persistent>
                            <template v-slot:activator="{ on }">
                                <v-btn primary v-on="on">
                                    Ergebnisse einsehen
                                </v-btn>
                            </template>
                            <Selbsttest @destroyModal="toogleDialog" :data="data"></Selbsttest>
                        </v-dialog>
                    </v-card-actions>
                </v-col>
            </v-row>
        </v-card>
    </v-container>

</template>

<script>
    import Selbsttest from "./Selbsttest";
    import moment from "moment";

    export default {
        name: "CoronaSelbsttestInfo",
        components: {Selbsttest},
        data() {
            return {
                dialog: false,
            }
        },
        props: {
            data: {
                type: Object,
                required: true
            }
        },
        computed: {
            testdatum() {
                if (!this.data.datum) {
                    return "Kein Datum angegeben";
                }

                return moment(this.data.datum).locale("de").format("L");
            }
        },
        methods: {
            toogleDialog() {
                this.dialog = this.dialog === false;
            }
        }
    }
</script>

<style scoped>

</style>