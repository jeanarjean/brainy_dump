<template>
  <div class="post-creator">
      <h1> title </h1>
      <input v-model="data.title">
      <h5> body </h5>
      <textarea v-model="data.body"> </textarea>
      <button v-on:click="this.doSomething">Send</button>

      <h1> {{response}} </h1>
  </div>
</template>

<script>
import post_api from "../api/post_api";

export default {
  name: "post-creator",
  data() {
    return {
      data: {},
      response: {}
    };
  },
  methods: {
      doSomething(){
        console.log("asdasd");
        post_api.create_post(this.data, (response) => {
            this.response = response;
        })
        
      }
  }
};
</script>
