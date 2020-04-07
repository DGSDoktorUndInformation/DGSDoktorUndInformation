<template>
    <v-container class="ma-0 pa-0">
        <v-card>
            <v-row align="center">
                <v-col>
                    <v-list-item three-line>
                        <v-list-item-content>
                            <div class="overline mb-4">Patient</div>
                            <v-list-item-title class="headline mb-1">{{name}}</v-list-item-title>
                            <v-list-item-subtitle><v-icon small>mdi-cake</v-icon> {{birthday}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-col>
            </v-row>
        </v-card>
    </v-container>
</template>

<script>
    import moment from "moment";

    export default {
        name: "Patient",
        props: {
            data: {
                type: Object,
                required: true
            }
        },
        computed: {
            name() {
                if(!this.data.vorname && !this.data.name) {
                    return "Kein Name angegeben";
                }

                return this.data.name;
            },
            birthday() {
                if(!this.data.geburtstag){
                    return "Kein Geburtsdatum angegeben";
                }

                return moment(this.data.geburtstag).locale("de").format("L");
            }
        }
    }
</script>
