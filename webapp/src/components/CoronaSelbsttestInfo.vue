<!--TODO Daten einfuegen, wenn sie vom Backend bereitgestellt werden-->
<template>
    <v-container>
        <v-card  class="mx-auto"
                 max-width="344"
        >
            <v-row >
                <v-col  >
                            <v-card-title class="headline">Selbsttest</v-card-title>
                            <v-card-subtitle>Durchgeführt am : </v-card-subtitle>
                            <v-card-actions>
                                <v-dialog v-model="dialog" persistent >
                                   
                                </v-dialog>
                                <v-btn primary> Ergebnisse einsehen</v-btn>
                            </v-card-actions>
                </v-col>
            </v-row>
        </v-card>
    </v-container>

</template>

<script>
    export default {
        name: "CoronaSelbsttestInfo",
        data () {
            return {
                dialog: false,
            }
        },
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