<template>
    <v-container >
 
        <v-form v-model="isValid">  
            <v-text-field
            v-model="content.link"
            :rules="linkRules"
            label="Link zum Video/Artikel" 
            required
            />
            <v-item-group v-model="isValid" :mandatory="true">
            <v-checkbox
            hide-details
            v-model="selectedCheckboxen"
            :rules="checkboxRules "
            label="DGS"
            value="DGS"

            />
             <v-checkbox
             hide-details
             v-model="selectedCheckboxen"
             :rules="checkboxRules"
            label="Untertitel"
            value="Untertitel"

            />  
            <v-checkbox
            v-model="selectedCheckboxen"
            :rules="checkboxRules"
            label="Leichte/Einfache Sprache"
            value="Leichte/Einfache Sprache"
            />
            </v-item-group>

        <v-btn @click="inhaltAnlegen()" :disabled="!isValid">
            Senden
        </v-btn>
        </v-form>





    </v-container>
</template>

<script>
import axios from 'axios'
export default {
    name : "Inhaltserstellung",
    data() {
    return {
        content:{
            "gebaerdensprachVideo" : false,
            "untertitel" : false,
            "leichteSprache" : false,
            "link" : null,
            "erfassungsZeit" :null
        },
        selectedCheckboxen: []
        ,
        isValid : true,
        linkRules:[v=>/^(https:|http:|www\.)\S*/.test(v)|| "Bitte geben Sie eine gültige URL ein."],
        checkboxRules: [selectedCheckboxen=>selectedCheckboxen.length>0||"Bitte wählen Sie mindestens eine der Optionen aus. "]
    }
},
methods: {
    ermittleDatum(){
        //Zeitformat abklaeren yyyy-dd-mm oder yyyy-mm-dd
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1;
        var yyyy = today.getFullYear();
        if(dd<10) dd='0'+dd;
        if(mm<10) mm='0'+mm;
        this.content.erfassungsZeit=yyyy+"-"+dd+"-"+mm
    },
    fuelleContentBools(){
        if(this.selectedCheckboxen.includes('DGS')){
            this.content.gebaerdensprachVideo=true;
        }
        if(this.selectedCheckboxen.includes('Untertitel')){
            this.content.untertitel=true;
        }
          if(this.selectedCheckboxen.includes('Leichte/Einfache Sprache')){
            this.content.leichteSprache=true;
        }
    },
    validiereCheckboxen(){
        if(this.content.gebaerdensprachVideo==false && this.content.untertitel==false && this.content.leichteSprache==false ){
            return false;
        }
        return true;

    }
    ,
    async inhaltAnlegen(){
        this.ermittleDatum();
        this.fuelleContentBools();
        await axios.post("http://localhost:5984/dgsinfo", this.content,{withCredentials:true});
    }

},
}

</script>

<style>

</style>