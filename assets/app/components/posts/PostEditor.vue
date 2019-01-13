<template>
  <div class="post-creator">
    <div class="post-creator-inner">
      <input placeholder="Title (optional)" class="post-form-title" v-model="data.title">
      <br>
      <br>
      <TagAutoComplete v-model="data.tags"></TagAutoComplete>
      <br>
      <br>
      <quill-editor class="body-editor" v-model="data.body"/>
      <br>
      <div class="bottom">
        <div style="flex: 1;"></div>
        <md-button class="md-raised md-accent" v-on:click="this.editPost">Edit</md-button>
      </div>
    </div>
  </div>
</template>

<script>
import post_api from "../../api/post_api";
import TagAutoComplete from "../generic-components/TagAutoComplete";
import { quillEditor } from "vue-quill-editor";

export default {
  name: "post-creator",
  components: {
    quillEditor,
    TagAutoComplete
  },
  data() {
    return {
      data: { tags: "" },
      response: {}
    };
  },
  methods: {
    editPost() {
      post_api.update_post(this.data, response => {
        this.response = response;
      });
      this.$router.go(-1);
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
    post_api.get_post(id, response => {
      this.data = response;
    });
  }
};
</script>
<style lang="scss">
.post-body {
  height: 70vh;
  width: 70vw;
}

.post-form-title {
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

.post-form-tags {
  height: 20px;
  width: 100%;
  font-size: 20px;
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

.post-creator-inner {
  margin-top: 20px;
  width: 95%;
  background-color: white;
}

.body-editor {
  margin-bottom: 2vh;
}

.ql-container {
  height: 60vh;
}

.bottom {
  display: flex;
  align-content: space-between;
}
</style>