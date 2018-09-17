<template>
    <div class="header-container">
      <div>
      </div>
      <h1>
        Brainy Dump
      </h1>
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

<style>
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
  font-size: 50px
}
</style>