<template>
  <div class="tag-creator">
      <input class="tag-form-name" placeholder="Tag Name" v-model="data.name">
      <br/>
      <br/>
      <button v-on:click="this.editTag">Send</button>
  </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "tag-editor",
  data() {
    return {
      data: {},
      response: {}
    };
  },
  methods: {
    editTag() {
      tag_api.update_tag(this.data, response => {
        this.respose = response;
      });
    }
  },
  beforeRouteLeave(to, from, next) {
    const answer = window.confirm(
      "Do you really want to leave? you have unsaved changes!"
    );
    if (answer) {
      next();
    } else {
      next(false);
    }
  },
  mounted: function() {
    var id = this.$route.params.id;
    tag_api.get_tag(id, response => {
      this.data = response;
    });
  }
};
</script>
<style lang="scss">
.tag-form-name {
  height: 40px;
  width: 100%;
  font-size: 40px;
  border: 0;
  text-decoration: underline;

  &::-moz-placeholder {
    text-decoration: underline;
  }

  &::-webkit-input-placeholder {
    text-decoration: underline;
  }

  &::-ms-input-placeholder {
    text-decoration: underline;
  }
}
</style>