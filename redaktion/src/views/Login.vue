<template>
    <v-form>
        <Alert v-if="message" type="error">{{message}}</Alert>
        <v-text-field label="Username" v-model="username"></v-text-field>
        <v-text-field label="Passwort" v-model="password" :type="'password'"></v-text-field>
        <v-btn @click="login">Login</v-btn>
    </v-form>
</template>

<script>
    import Alert from "../components/Alert";

    export default {
        name: "Login",
        components: {Alert},
        data() {
            return {
                username: "",
                password: ""
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
                await this.$axios.post("/_session", requestParams);
                await this.$router.push({name: "ArtikelErfassung"});
            }
        }
    }
</script>

<style scoped>

</style>