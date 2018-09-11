<template>
  <div class="post-creator">
      <h1> title </h1>
      <input v-model="data.title">
      <h5> body </h5>
      <textarea v-model="data.body" class="post-body"> </textarea>
      <br/>
      <h5> tags </h5>
      <textarea v-model="data.tags"></textarea>
      <br/>
      <button v-on:click="this.createPost">Send</button>

      <h1> {{response}} </h1>
  </div>
</template>

<script>
import post_api from "../api/post_api";

export default {
  name: "post-creator",
  props:{
    tag: String,
  },
  data() {
    return {
      data: {tags: this.tag},
      response: {},
    };
  },
  methods: {
      createPost(){
        console.log("asdasd");
        post_api.create_post(this.data, (response) => {
            this.response = response;
        })
        this.$router.go(-1);
      }
  }
};
</script>
<style>
.post-body {
  height: 70vh;
  width: 70vw;
}
</style>