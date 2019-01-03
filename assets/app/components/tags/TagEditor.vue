<template>
  <div class="tag-creator">
    <md-field class="input">
      <label>Tag Name</label>
      <md-input v-model="data.name"></md-input>
      <md-button class="md-raised md-primary" v-on:click="this.editTag">Edit</md-button>
    </md-field>
  </div>
</template>

<script>
import tag_api from "../../api/tag_api";

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

.input {
  width: 700px;
}
@media only screen and (max-width: 600px) {
  .input {
    width: 300px;
  }
}

@media only screen and (max-width: 400px) {
  .input {
    width: 100vw;
  }
}
</style>