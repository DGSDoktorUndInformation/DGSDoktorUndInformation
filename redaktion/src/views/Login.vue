<template>
    <v-form>
        <v-text-field label="Username" v-model="username"></v-text-field>
        <v-text-field label="Passwort" v-model="password" :type="'password'"></v-text-field>
        <v-btn @click="registieren">Registrieren</v-btn>
    </v-form>
</template>

<script>
    import axios from "axios";

    export default {
        name: "Login",
        data() {
            return {
                username: "",
                password: ""
            }
        },
        methods: {
            async registieren() {
                const requestParams = {
                    name: this.username,
                    password: this.password
                }
                await axios.post("/_session", requestParams, {withCredentials: true});
                // TODO in eigene Komponente/View
                //  POST zum Speichern eines Dokumentes
                // await axios.post("http://localhost:5984/dgsinfo", {
                //     "gebaerdensprachVideo": true,
                //     "untertitel": true,
                //     "leichteSprache": true,
                //     "link": "http://localhost:8080",
                //     "erfassungsZeit": "2012-01-01"
                // }, {
                //     withCredentials: true
                // });
            }
        }
    }
</script>

<style scoped>

</style>