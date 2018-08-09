<template>
  <div class="friendlist">
    <h1>friend list</h1>

    <b-card-group>
      <b-card v-for="profile in profiles" :key="profile.address" v-bind:title="profile.name"
        v-bind:img-src="profile.img"
        img-alt="Img"
        img-top>
        <p class="card-text">
          {{profile.desc}}
        </p>
        <div slot="footer">
          <small class="text-muted">{{profile.uptodate}}</small>
        </div>
      </b-card>
      
    </b-card-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
        profiles: [
          {
            address: '0x1233123asdasdf',
            name: 'Alice',
            img: 'https://placekitten.com/g/300/450',
            desc: 'Hi, my name is Alice who really love crypto.',
            uptodate: 'Last updated 3 mins ago'
          },
          {
            address: '0x2233123asdasdf',
            name: 'Alice',
            img: 'https://placekitten.com/g/300/450',
            desc: 'Hi, my name is Alice who really love crypto.',
            uptodate: 'Last updated 3 mins ago'
          },
          {
            address: '0x3233123asdasdf',
            name: 'Alice',
            img: 'https://placekitten.com/g/300/450',
            desc: 'Hi, my name is Alice who really love crypto.',
            uptodate: 'Last updated 3 mins ago'
          }
        ]
    }
  }
}
</script>

<style scoped>

</style>