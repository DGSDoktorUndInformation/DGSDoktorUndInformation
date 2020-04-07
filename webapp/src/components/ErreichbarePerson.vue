<template>
    <v-container class="ma-0 pa-0">
        <v-card>
            <v-row align="center">
                <v-col cols="8">
                    <v-list-item three-line>
                        <v-list-item-content>
                            <div class="overline mb-4">Erreichbarer Kontakt</div>
                            <v-list-item-title class="headline mb-1">{{data.vorname}} {{data.name}}</v-list-item-title>
                            <v-list-item-subtitle>{{data.eMailAdresse}}</v-list-item-subtitle>
                            <v-list-item-subtitle>{{data.telefonNummer}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-col>
                <v-col cols="4">
                    <v-icon x-large>
                        mdi-card-account-phone
                    </v-icon>
                </v-col>
            </v-row>
        </v-card>
    </v-container>
</template>

<script>
    export default {
        name: "ErreichbarePerson",
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