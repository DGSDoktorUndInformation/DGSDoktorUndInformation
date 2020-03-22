<template>
    <v-container>
        <v-row align="center">
            <v-col>
                <v-row justify="center" align="center">
                    <v-form
                            lazy-validation
                            ref="form"
                            v-model="valid"
                            @submit="submit"
                    >
                        <v-text-field
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
            async submit() {
                this.$refs.form.validate();
                const result = await axios.get("/session/" + this.sessionkey);
                await this.$router.push({name: "Session", params: {data: result.data}});
            }

        }
    }
</script>

<style scoped>

</style>
