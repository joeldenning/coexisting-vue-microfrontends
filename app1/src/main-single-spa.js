import './set-public-path'
import Vue from 'vue';
import App from './App.vue';
import router from './router';
import singleSpaVue from 'single-spa-vue';

Vue.config.productionTip = false;


const vueLifecycles = singleSpaVue({
	Vue,
	appOptions: {
		render: (h) => h(App),
		router,
	},
});

export const bootstrap = process.env.NODE_ENV !== 'local' ? vueLifecycles.bootstrap : [];
export const mount = process.env.NODE_ENV !== 'local' ? vueLifecycles.mount : [];
export const unmount = process.env.NODE_ENV !== 'local' ? vueLifecycles.unmount : [];
