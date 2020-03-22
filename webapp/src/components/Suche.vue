<template>
    <v-container>
        <v-text-field label="Begriffsuche für die Kommunikation" v-model="text" clearable></v-text-field>
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
    import axios from "axios";

    export default {
        name: "Suche",
        data: () => ({
            text: "",
            items: []
        }),
        props: {
            sessionkey: {
                type: String,
                required: true
            }
        },
        methods: {
            async sendMessage(message) {
                await axios.post("/session/" + this.sessionkey + "/message", message);
                //    Fehlerhandling bei Nichterfolg
            }
        },
        watch: {
            async text() {
                if (!this.text) {
                    this.items = [];
                    return;
                }
                const response = await axios.get("/messageRepository?tag=" + this.text);
                if (response.data.message) {
                    this.items = response.data.message;
                } else {
                    this.items = []
                }
                const customMessage = {
                    nachrichtenText: this.text,
                    antwortOptionen: [],
                    links: []
                };
                this.items.push(customMessage);
            }
        }
    }
</script>

<style scoped>

</style>