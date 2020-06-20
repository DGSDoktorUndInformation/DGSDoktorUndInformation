<template>
    <v-container fluid class="fill-height">
        <v-row justify="center">
            <v-col cols="11" md="4">
                <v-form v-model="isValid" ref="form">
                    <v-tooltip right>
                        <template v-slot:activator="{on}">

                            <v-text-field
                                    v-model="content.link"
                                    :rules="linkRules"
                                    label="Link zum Artikel/Video"
                                    required
                            >
                                <span slot="append" v-on="on"><v-icon>mdi-help-circle-outline</v-icon></span>
                            </v-text-field>
                        </template>
                        <span>Ich bin ein Tooltip</span>
                    </v-tooltip>
                    <v-item-group v-model="isValid" :mandatory="true">
                        <v-tooltip right>
                            <template v-slot:activator="{on}">
                                <v-checkbox
                                        hide-details
                                        v-model="selectedCheckboxen"
                                        :rules="checkboxRules "
                                        label="DGS"
                                        value="DGS"
                                        v-on="on"
                                >
                                    <span slot="append" v-on="on"><v-icon>mdi-help-circle-outline</v-icon></span>
                                </v-checkbox>
                            </template>
                            <span>Ich bin ein Tooltip</span>
                        </v-tooltip>
                        <v-tooltip right>
                            <template v-slot:activator="{on}">
                                <v-checkbox
                                        hide-details
                                        v-model="selectedCheckboxen"
                                        :rules="checkboxRules"
                                        label="Untertitel"
                                        value="Untertitel"
                                        slot="activator"

                                >
                                    <span slot="append" v-on="on"><v-icon>mdi-help-circle-outline</v-icon></span>
                                </v-checkbox>
                            </template>
                            <span>Ich bin ein Tooltip</span>
                        </v-tooltip>
                        <v-tooltip right>
                            <template v-slot:activator="{on}">
                                <v-checkbox
                                        v-model="selectedCheckboxen"
                                        :rules="checkboxRules"
                                        label="Leichte/Einfache Sprache"
                                        value="Leichte/Einfache Sprache"
                                >
                                    <span slot="append" v-on="on"><v-icon>mdi-help-circle-outline</v-icon></span>
                                </v-checkbox>
                            </template>
                            <span>Ich bin ein Tooltip</span>
                        </v-tooltip>
                    </v-item-group>
                    <v-row justify="end" class="ma-0">
                        <v-btn color="primary" @click="inhaltAnlegen()" :disabled="!isValid">
                            Senden
                        </v-btn>
                    </v-row>
                    <Alert v-if="success" type="success" :timeout="timeoutDuration" class="mb-4 mt-4">
                        Artikel/Video erfolgreich erfasst.
                    </Alert>
                    <Alert v-if="error" type="error" class="mb-4 mt-4">
                        Es ist ein Fehler aufgetreten.
                    </Alert>
                </v-form>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import Alert from "../components/Alert";

    export default {
        name: "ArtikelErfassung",
        components: {Alert},
        data() {
            return {
                content: {
                    "gebaerdensprachVideo": false,
                    "untertitel": false,
                    "leichteSprache": false,
                    "link": "",
                    "erfassungsZeit": null
                },
                selectedCheckboxen: [],
                timeoutDuration: 30000,
                isValid: false,
                error: null,
                success: null,
                linkRules: [v => /^(https:|http:|www\.)\S*/.test(v) || "Bitte geben Sie eine gültige URL ein.", v => v.length <= 2048 || "Die URL ist zu lang."],
                checkboxRules: [selectedCheckboxen => selectedCheckboxen.length > 0 || "Bitte wählen Sie mindestens eine der Optionen aus. "]
            }
        },
        methods: {
            ermittleDatum() {
                this.content.erfassungsZeit = new Date().toDateString();
            },
            fuelleContentBools() {
                this.content.gebaerdensprachVideo = this.selectedCheckboxen.includes('DGS');
                this.content.untertitel = this.selectedCheckboxen.includes('Untertitel');
                this.content.leichteSprache = this.selectedCheckboxen.includes('Leichte/Einfache Sprache');
            },
            async inhaltAnlegen() {
                this.ermittleDatum();
                this.fuelleContentBools();
                await this.$axios.post("/dgsinfo", this.content)
                    .then(response => {
                        if(response.status === 201) {
                            this.resetFormular();
                            this.$refs.form.resetValidation();
                            this.setAlertStates(true)
                        } else {
                            this.setAlertStates(false)
                        }
                    });
            },
            resetFormular() {
                this.selectedCheckboxen = [];
                this.content.link = null;
            },
            setAlertStates(isSuccess) {
                this.error = !isSuccess
                this.success = isSuccess
            }
        },
        created() {
            this.$axios({
                url: "/_session"
            })
                    .then(response => {
                        if (!response.data.info.authenticated) {
                            this.$router.push({name: "Login"});
                        }
                    })
        }
    }

</script>

<style>

</style>