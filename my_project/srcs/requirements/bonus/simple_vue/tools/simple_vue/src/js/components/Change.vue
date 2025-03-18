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
          <h6>Выбор тарифа</h6>
        </div>
        <div class="col m1 l1 s1"></div>
      </div>
    </div>
    <div class="collection row">
      <div class="collection-item s12 m6 l4 mb-em-2">
        <h6 class="light-green-text">Тариф "{{ $route.params.title }}"</h6>
        <!-- Line -->
        <div class="divider"></div>
        <!-- Line -->
        <div>
          <h6
            class="grey-text text-darken-4 mb-0"
          >Период оплаты - {{ infoOne(infoTitle[0].tarifs)[0].pay_period }} месяц{{ mounth(infoOne(infoTitle[0].tarifs)[0].pay_period) }}</h6>
          <h6 class="grey-text text-darken-4 mt-0">{{ min(infoTitle[0].tarifs) }} &#8381;/мес</h6>
          <div>
            <p
              class="mb-0 grey-text text-darken-4"
            >Разовый платеж - {{ infoOne(infoTitle[0].tarifs)[0].price }}&#8381;</p>
            <p
              class="mt-0 mb-1 grey-text text-darken-4"
            >Со счета спишется - {{ infoOne(infoTitle[0].tarifs)[0].price }}&#8381;</p>
          </div>
          <div>
            <p class="mb-0 grey-text text-lighten-1">Вступит в силу - сегодня</p>
            <p
              class="mt-0 mb-1 grey-text text-lighten-1"
            >Активно до - {{ date(infoOne(infoTitle[0].tarifs)[0].pay_period) }}</p>
          </div>
        </div>
        <!-- Line -->
        <div class="divider"></div>
        <!-- Line -->
        <div class="row mt-em-2">
          <a class="btn light-green grey-text text-lighten-4 col s12 m12 l12 inline-block">Выбрать</a>
        </div>
      </div>
    </div>
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
    infoOne(param) {
      return param.filter(i => i.ID === parseInt(this.$route.params.id));
    },
    mounth(param) {
      if (param > 1 && param < 5) {
        return "а";
      } else if (param > 5) {
        return "ев";
      } else {
        return "";
      }
    },
    date(param) {
      var date = new Date();
      var y = date.getFullYear();
      var d = date.getDate();
      var m = date.getMonth();

      var p = parseInt(param);

      m = m + p;

      return `${d}.${m}.${y}`;
    }
  },
  computed: {
    infoTitle() {
      return this.json.filter(i => i.title === this.$route.params.title);
    }
  }
};
</script>