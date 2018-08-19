<template>
  <div>
    <info-metamask />    
    <nabi-component />
  </div>
</template>

<script>
  import InfoMetamask from '@/components/info-metamask'
  import NabiComponent from '@/components/FriendList'
  export default {
  	name: 'nabi-dapp',
  	beforeCreate() {
  	  console.log('registerWeb3 Action dispatched from nabi-dapp.vue')
  	  this.$store.dispatch('registerWeb3')
  	},
  	components: {
  	  'info-metamask': InfoMetamask,
      'nabi-component': NabiComponent      
  	}
  }
</script>

<style scoped>
</style>