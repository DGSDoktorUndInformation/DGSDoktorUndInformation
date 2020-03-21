<template>
    <v-container>
        <v-row justify align="center">
            <v-col>
                <v-row justify="center" align="center">
                <v-form
                        lazy-validation
                        ref="form"
                        v-model="valid"
                >
                    <v-text-field
                            :counter="10"
                            :rules="sessionkeyRules"
                            v-model="sessionkey"
                            label="Code des Patienten"
                            required
                    ></v-text-field>
                    <v-btn :disabled="!valid" block color="primary" @click="submit">Weiter</v-btn>
                </v-form>
                </v-row>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import axios from "axios";
    export default {
        name: "SessionStart",
        data: () => ({
            valid: true,
            sessionkey: '',
            sessionkeyRules: [
                v => !!v || "Der Code ist erforderlich"
            ]
        }),
        methods: {
            submit() {
                if(this.sessionkey) {
                axios.get("http://localhost:8080/session/"+this.sessionkey).then(response => console.log(response.data))
            }}

        }
    }
</script>

<style scoped>

</style>