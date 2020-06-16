<template>
    <v-container fluid class="fill-height">
        <v-row justify="center">
            <v-col cols="11" md="4">
                <v-form v-model="valid">
                    <Alert v-if="message && !alertmessage" type="error">{{message}}</Alert>
                    <v-text-field label="Username" v-model="username" :rules="usernameRules"></v-text-field>
                    <v-text-field label="Passwort" v-model="password" :type="'password'" :rules="passwordRules"></v-text-field>
                    <v-row justify="end" class="ma-0">
                        <v-btn color="primary" :disabled="!valid" @click="login">Login</v-btn>
                    </v-row>
                </v-form>
                <Alert v-if="alertmessage" type="error" class="mb-4 mt-4">{{alertmessage}} </Alert>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import Alert from "../components/Alert";

    export default {
        name: "Login",
        components: {Alert},
        data() {
            return {
                username: "",
                password: "",
                alertmessage: "",
                valid: false,
                usernameRules: [v => v.length !== 0 || "Bitte geben Sie einen Username ein."],
                passwordRules: [v => v.length !== 0 || "Bitte geben Sie ein Passwort ein."]
            }
        },
        props: {
            message: {
                type: String,
                required: false,
                default: null
            }
        },
        methods: {
            async login() {
                const requestParams = {
                    name: this.username,
                    password: this.password
                }
                await this.$axios.post("/_session", requestParams)
                        .then(response => {
                            if (response.status === 200 && response.data.roles.includes("publisher")) {
                                this.$router.push({name: "ArtikelErfassung"});
                            } else {
                                this.alertmessage = "Username und/oder Passwort sind falsch."
                            }
                        });
            }
        }
    }
</script>

<style scoped>

</style>