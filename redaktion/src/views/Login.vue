<template>
    <v-form>
        <v-text-field label="Username" v-model="username"></v-text-field>
        <v-text-field label="Passwort" v-model="password" :type="'password'"></v-text-field>
        <v-btn @click="login">Login</v-btn>
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
            async login() {
                const requestParams = {
                    name: this.username,
                    password: this.password
                }
                await axios.post("/_session", requestParams, {withCredentials: true});
                await this.$router.push({name: "ArtikelErfassung"});
            }
        }
    }
</script>

<style scoped>

</style>