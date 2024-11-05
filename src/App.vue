<template>
  <div style="display: flex; justify-content: center; flex-direction: column; align-items: center; height: 100vh;">
    <Message title="VPN-Less Access to Finesse Desktop">
      <div style="display: flex; flex-direction: column; gap: 1rem;">
        <!-- datacenter -->
        <Field label="Data Center:">
          <Select
          v-model="form.datacenter"
          >
            <option
            v-for="option of options"
            :key="option.value"
            :value="option.value"
            >
              {{ option.label }}
            </option>
          </Select>
        </Field>

        <!-- Session ID -->
        <Field label="Session ID:">
          <input type="text" v-model="form.sessionId" />
        </Field>

        <!-- Submit button -->
        <div style="display: flex; justify-content: center;">
          <Button @click="submit">
            Go to VPN-Less Finesse Desktop
          </Button>
        </div>
      </div>

      <div v-show="error" style="color: red;">
        <strong>Error:</strong> {{ error }}
      </div>
    </Message>
  </div>
</template>

<script>
export default {
  data () {
    return {
      form: {
        datacenter: 'RTP',
        sessionId: '',
      },
      options: [
        {value: 'RTP', label: 'RTP'},
        {value: 'SJC', label: 'SJC'},
        {value: 'LON', label: 'LON'},
        {value: 'SNG', label: 'SNG'},
        {value: 'SYD', label: 'SYD'},
      ],
      error: null,
    }
  },

  methods: {
    async submit (e) {
      e.preventDefault();
      try {
        const url = `https://mm.cxdemo.net/api/v1/datacenters/${this.form.datacenter}/sessions/${this.form.sessionId}`;
        const options = {};
        const response = await fetch(url, options);
        if (response.ok) {
          const json = await response.json();
          const link = `https://${json.dns2}:8445/desktop/`;
          // use _self instead of _blank to open in same browser tab
          window.open(link, '_blank', 'noopener, noreferrer');
          // remove any previous error
          this.error = null;
        } else {
          this.error = await response.text();
        }
      } catch (e) {
        console.log(e);
      }
    },
  },
}
</script>