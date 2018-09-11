<template>
  <div class="home">
    fucking bitch
  </div>
</template>

<script>
import store from "../store/store";
import PostCreator from "./PostCreator";

export default {
  name: "Home",
  data() {
    return {
      topic: {}
    };
  },
  mounted() {
    this.topic = store.getters.getNodeById(1);
  }
};
</script>
<style>
</style>
