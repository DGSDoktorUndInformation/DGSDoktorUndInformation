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
                                   <template v-slot:activator="{ on }">
                                       <v-btn primary v-on="on">
                                           Ergebnisse einsehen
                                       </v-btn>
                                   </template>
                                    <Selbsttest  @destroyModal="toogleDialog"  :data="data"></Selbsttest>
                                </v-dialog>

                            </v-card-actions>
                </v-col>
            </v-row>
        </v-card>
    </v-container>

</template>

<script>
    import Selbsttest from "./Selbsttest";
    export default {
        name: "CoronaSelbsttestInfo",
        components: {Selbsttest},
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
        },
        methods:{
            toogleDialog(){
                if(this.dialog===false){
                    this.dialog=true;
                }
                else this.dialog=false
            }
    }
    }
</script>

<style scoped>

</style>