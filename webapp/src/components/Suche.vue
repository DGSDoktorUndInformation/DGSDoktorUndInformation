<template>
    <v-container>
        <v-text-field label="Begriffsuche für die Kommunikation" v-model="text"></v-text-field>
        <v-list>
            <v-list-item
                    v-for="i in items" :key="i.nachrichtenText"
                    @click="sendMessage(i)">
                <v-list-item-content>
                    <v-list-item-title v-text="i.nachrichtenText"></v-list-item-title>
                </v-list-item-content>
                <v-list-item-icon>
                    <v-icon>mdi-send</v-icon>
                </v-list-item-icon>
            </v-list-item>
        </v-list>
    </v-container>
</template>

<script>
    export default {
        name: "Suche",
        data: () => ({
            text: "",
        }),
        methods: {
            sendMessage(message) {
                console.log(message);
            }
        },
        computed: {
            items() {
                return [
                    {nachrichtenText: 'Haben Sie Fieber?'},
                    {nachrichtenText: 'Haben Sie erbrochen?'},
                    {nachrichtenText: 'Ist Ihnen Übel?'},
                    {nachrichtenText: 'Haben Sie Fieber2?'},
                    {nachrichtenText: 'Haben Sie Fieber3?'},
                    {nachrichtenText: 'Haben Sie Fieber4?'},
                    {nachrichtenText: 'Haben Sie Fieber5?'},
                    {nachrichtenText: this.text}
                ]
            }
        }
    }
</script>

<style scoped>

</style>