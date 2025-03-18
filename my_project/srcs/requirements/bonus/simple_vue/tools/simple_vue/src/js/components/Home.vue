<template>
  <ul class="collection row">
    <li
      v-for="(tarif, index) in json"
      :tarif="tarif"
      :key="tarif.id"
      :id="index"
      class="collection-item col s12 m6 l4 mb-em-2"
    >
      <h5 class="light-green-text">Тариф "{{ tarif.title }}"</h5>

      <!-- Line -->
      <div class="divider"></div>
      <!-- Line -->

      <div class="flex-center-between">
        <div
          :class="color(tarif.title) + ' inline-block mt-em-1 mb-em-1 pr-em-2 ml-px--20 pl-px-20'"
        >
          <h6 class="grey-text text-lighten-5">{{ tarif.speed }} Мбит/с</h6>
        </div>
        <router-link
          :to="{ name: 'detail', params: { id: tarif.title }}"
          class="secondary-content flex-center"
        >
          <i class="material-icons grey-text text-lighten-1">chevron_right</i>
        </router-link>
      </div>
      <div>
        <h6 class="mt-0 mb-1 grey-text text-darken-4">{{ Minmax(tarif.tarifs) }} &#8381;/мес</h6>
      </div>
      <div class="mb-em-1">
        <p v-for="item in tarif.free_options" v-bind:key="item.id" class="m-0">{{ item }}</p>
      </div>

      <!-- Line -->
      <div class="divider"></div>
      <!-- Line -->

      <div class="pb-em-1 pt-em-1">
        <a
          v-bind:href="tarif.link"
          class="blue-text text-darken-2"
        >узнать подробнее на сайте www.sknt.ru</a>
      </div>
    </li>
  </ul>
</template>

<script>
export default {
  props: ["json"],
  methods: {
    // Определение максимальной минимальной цены
    Minmax(param) {
      //
      var arr = [];

      for (let i = 0; i < param.length; i++) {
        const element = param[i];
        var price = element.price;
        var period = element.pay_period;
        //
        arr.push(price / period);
      }

      let min = Math.min(...arr);
      let max = Math.max(...arr);

      return `${min} - ${max}`;
    },
    // Определение цвета по заголовку
    /**
     * el {tarif.title} string
     */
    color(param) {
      //
      switch (param) {
        case "Земля":
          return "brown";
          break;

        case "Вода":
          return "blue darken-4";
          break;

        case "Огонь":
          return "orange darken-4";
          break;

        default:
          return "grey";
          break;
      }
    }
  }
};
</script>