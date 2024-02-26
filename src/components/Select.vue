<template>
  <select v-model="model">
    <slot></slot>
  </select>
</template>

<script>
export default {
  props: {
    modelValue: {},
  },

  emits: ['update:modelValue'],

  computed: {
    model: {
      get () {
        return this.modelValue
      },
      set (value) {
        this.$emit('update:modelValue', value);
      }
    }
  }
}
</script>