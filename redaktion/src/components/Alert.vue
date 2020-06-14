<template>
    <v-alert dense outlined :type="type" v-if="visible">
        <slot/>
    </v-alert>
</template>

<script>
export default {
    name: "Alert",
    data() {
        return {
            visible: true
        }
    },
    props: {
        type: {
            type: String,
            required: false,
            default: ""
        },
        timeout: {
            type: Number,
            required: false,
            default: null
        }
    },
    created() {
        if(this.timeout) {
            setTimeout(() => this.visible = false, this.timeout)
        }
    }
}
</script>

<style scoped>

</style>