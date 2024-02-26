import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import Field from './components/Field.vue'
import Message from './components/Message.vue'
import Button from './components/Button.vue'
import Select from './components/Select.vue'

const app = createApp(App)
app.component('Field', Field)
app.component('Message', Message)
app.component('Button', Button)
app.component('Select', Select)

app.mount('#app')