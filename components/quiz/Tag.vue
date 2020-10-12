<template>
  <v-chip
    class="ma-2"
    color="pink"
    label
    text-color="white"
    @click="searchTag(name)"
  >
    <v-icon left>
      mdi-label
    </v-icon>
    {{ name }}
  </v-chip>
</template>

<script>
export default {
  props: {
    name: String
  },
  methods: {
    searchTag (tagName) {
      alert(tagName)
    }
  }
}
</script>
