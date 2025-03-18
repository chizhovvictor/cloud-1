<template>
  <div>
    <div class="collection row">
      <div class="flex-center collection-item">
        <div class="col m1 l1 s1">
          <a @click.prevent="goBack()" href="#" class="secondary-content flex-center">
            <i class="material-icons light-green-text">chevron_left</i>
          </a>
        </div>
        <div class="col m10 l10 s10 text-center">
          <h6>{{ $route.params.id }}</h6>
        </div>
        <div class="col m1 l1 s1"></div>
      </div>
    </div>
    <ul v-for="item in infoOne" :key="item.id" class="collection row">
      <li
        v-for="tarif in item.tarifs"
        :key="tarif.id"
        class="collection-item col s12 m6 l4 mb-em-2"
      >
        <h6 class="light-green-text">{{ tarif.pay_period }} месяц{{ mounth(tarif.pay_period) }}</h6>

        
        <div class="divider"></div>

        <div class="flex-center-between">
          <div>
            <h6 class="grey-text text-darken-4">{{ tarif.price / tarif.pay_period }} &#8381;/мес</h6>
            <div>
              <p
                class="mt-0 mb-1 grey-text text-darken-4"
              >Разовый платеж - {{ tarif.price }} &#8381;</p>
              <p
                class="mt-0 mb-1 grey-text text-darken-4"
                v-if="min(item.tarifs) * tarif.pay_period - tarif.price > 0"
              >Скидка - {{ min(item.tarifs) * tarif.pay_period - tarif.price }} &#8381;</p>
            </div>
          </div>
          <router-link
            :to="{ name: 'change', params: { title: item.title, id: tarif.ID }}"
            class="secondary-content flex-center"
          >
            <i class="material-icons grey-text text-lighten-1">chevron_right</i>
          </router-link>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ["json"],
  methods: {
    goBack() {
      window.history.length > 1 ? this.$router.go(-1) : this.$router.push("/");
    },
    min(param) {
      var arr = [];

      for (let i = 0; i < param.length; i++) {
        const element = param[i];
        var price = element.price;
        //
        arr.push(price);
      }

      let min = Math.min(...arr);

      return min;
    },
    mounth(param) {
      if (param > 1) {
        return "а";
      } else if (param > 5) {
        return "ев";
      } else {
        return "";
      }
    }
  },
  computed: {
    infoOne() {
      return this.json.filter(i => i.title === this.$route.params.id);
    }
  }
};
</script>