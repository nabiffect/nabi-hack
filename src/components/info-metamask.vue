<template>
  <div>
    <b-btn v-b-toggle.collapse1 variant="primary">Metamask Status</b-btn>
    <b-collapse id="collapse1" class="mt-2">
      <b-card>
      <div class='metamask-info'>
        <p v-if="isInjected" id="has-metamask"><i aria-hidden="true" class="fa fa-check"></i> Metamask installed</p>
        <p v-else id="no-metamask"><i aria-hidden="true" class="fa fa-times"></i> Metamask not found</p>
        <p>Network: {{ network }}</p>
    	<p>Account: {{ coinbase }}</p>
    	<p>Balance: {{ balance }} Wei </p>
     </div>
    </b-card>
    </b-collapse>
  </div>
</template>

<script>
import {NETWORKS} from '../util/constants/networks'
import {mapState} from 'vuex'

export default {
 name: 'info-metamask',
 computed: mapState({
   isInjected: state => state.web3.isInjected,
   network: state => NETWORKS[state.web3.networkId],
   coinbase: state => state.web3.coinbase,
   balance: state => state.web3.balance
 })
}
</script>
<style scoped>
#has-metamask {
  color: green;
}
#no-metamask {
  color:red;
}
</style>