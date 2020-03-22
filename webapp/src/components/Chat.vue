<template>
    <v-container fluid>
        <div v-for="i in messages" :key="i.id">
            <v-row v-if="i.fromPatient" class="col-12 md1 pa-1" justify="start">
                <div class="speech-bubble-patient">{{i.nachrichtenText}}</div>
            </v-row>
            <v-row v-else class="col-12 md1 pa-1" justify="end">
                <div class="speech-bubble-arzt">{{i.nachrichtenText}}</div>
            </v-row>
        </div>
    </v-container>
</template>

<script>
    import axios from "axios";

    export default {
        name: "Chat",
        data: () => ({
            polling: null,
            messages: []
        }),
        props: {
            sessionkey: {
                type: String,
                required:
                    true
            }
        },
        methods: {
            pollData () {
                this.polling = setInterval(async () => {
                    const response = await axios.get("/session/" + this.sessionkey + "/message");
                    this.messages = response.data;
                }, 1000)
            }
        },
        created () {
            this.pollData()
        },
        beforeDestroy () {
            clearInterval(this.polling)
        }

    }
</script>

<style scoped>
    .speech-bubble-arzt {
        font-size: 0.85em;
        color: white;
        position: relative;
        background: darkgrey;
        border-radius: .4em;
        padding: 5px 10px;
    }

    .speech-bubble-arzt:after {
        content: '';
        position: absolute;
        right: 0;
        top: 50%;
        width: 0;
        height: 0;
        border: 0.594em solid transparent;
        border-left-color: darkgrey;
        border-right: 0;
        margin-top: -0.594em;
        margin-right: -0.594em;
    }

    .speech-bubble-patient {
        font-size: 0.85em;
        color: white;
        position: relative;
        background: #A7DDD1;
        border-radius: .4em;
        padding: 5px 10px;
    }

    .speech-bubble-patient:after {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 0;
        height: 0;
        border: 0.594em solid transparent;
        border-right-color: #A7DDD1;
        border-left: 0;
        margin-top: -0.594em;
        margin-left: -0.594em;
    }
</style>