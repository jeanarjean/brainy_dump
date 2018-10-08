<template>
    <div class="header-container">
      <div>
      </div>
      <div class="header-title">
        <router-link :to="{ name: 'Home'}" class="tag-action">
          Brainy Dump
        </router-link>
      </div>
      <div class="options">
        ons
      </div>
    </div>
</template>

<script>
export default {
  name: "header-component",
  data() {
    return {
      topic: {}
    };
  }
};
</script>

<style <style lang="scss" scoped>
.header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100vw;
  max-width: 100%;
  height: 8vh;
  grid-area: header;
  background-color: #fb0;
}

.options {
  font-size: 50px;
}

.header-title {
  font-size: 2rem;
  font-weight: 800;
}
</style>