<!--TODO Daten einfuegen, wenn sie vom Backend bereitgestellt werden oder woher auch immer-->
<template>
    <v-container>
        <v-card  class="mx-auto"
                 max-width="344"
        >
            <v-row  align="center" >
                <v-col  cols="8">
                    <v-list-item three-line>
                        <v-list-item-content>
                            <div class="overline mb-4">DGS-Dolmetscher</div>
                            <v-list-item-title class="headline mb-1"  >Max Mustermann </v-list-item-title>
                            <v-list-item-subtitle>Tess : </v-list-item-subtitle>
                            <v-list-item-subtitle>TeleSign:  </v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>

                </v-col>
                <v-col cols="4">
                    <v-icon x-large>
                        mdi-card-account-phone
                    </v-icon>
                </v-col>
            </v-row>


        </v-card>
    </v-container>
</template>

<script>
    export default {
        name: "DolmetscherKontakt"
    }
</script>

<style scoped>

</style>