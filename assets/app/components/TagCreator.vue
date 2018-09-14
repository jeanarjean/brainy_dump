<template>
  <div class="tag-creator">
      <h1> name </h1>
      <input v-model="data.name">
      <br/>
      <button v-on:click="this.createTag">Send</button>

      <h1> {{response}} </h1>
  </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "tag-creator",
  data() {
    return {
      data: {},
      response: {},
    };
  },
  methods: {
      createTag(){
        tag_api.create_tag(this.data, (response) => {
            this.response = response;
        })
        // this.$router.go(-1);
      }
  }
};
</script>
<style>
</style>