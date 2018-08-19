<template>
  <div class="rootElem">    

    <b-card-group class="bcg">      
      <b-card class="cardG" v-for="profile in _orderProfiles(profiles)" :key="profile.address" v-bind:title="profile.name"
        v-bind:img-src="profile.img"
        v-on:click="onCardClick(profile)"        
        img-alt="Img"
        img-top>
        <p class="card-text">
          {{profile.cntFavorite}} 찜
        </p>
        <template v-if="profile.name === '파랑이'">
          <b-badge variant="success">Selected</b-badge>
        </template>        
        <div slot="footer">
          <small class="text-muted">{{profile.uptodate}}</small>          
        </div>
      </b-card>                      
    </b-card-group>

    <b-card-group class="bcg">
      <b-card class="cardG" v-for="profile in _orderProfiles(profiles2)" :key="profile.address" v-bind:title="profile.name"
        v-bind:img-src="profile.img"
        v-on:click="onCardClick(profile)"
        img-alt="Img"
        img-top>
        <p class="card-text">
          {{profile.cntFavorite}} 찜
        </p>
        <template v-if="profile.name === '차돌남'">
          <b-badge variant="success">Selected</b-badge>
        </template>
        <div slot="footer">
          <small class="text-muted">{{profile.uptodate}}</small>
        </div>
      </b-card>    
    </b-card-group>

    <b-button @click="estimate">
      Estimate
    </b-button>

    <!-- Modal Component -->
    <b-modal id="modalProfile" ref="myModalRef" v-bind:title="profileTxt" @ok="handleProfileOk(profileTxt)">
      <p class="my-4">{{profileTxt}}</p>

      <b-card
        v-bind:img-src="profileImg"
        img-top>
        <p class="card-text">
          {{profileDesc}}
        </p>        
      </b-card>
    </b-modal>
  </div>

</template>

<script>
export default {
  props: ['profileTxt', 'profileImg', 'profileDesc', 'selname'],  
  data() {
    return {
        profiles: [
          {
            address: '0x1233123asdasdf',
            name: '앨리스',
            img: 'https://i.imgur.com/H8mERhD.png',
            desc: '크립토를 사랑하는 앨리스에요',
            uptodate: 'Last updated 3 mins ago',
            cntFavorite: 1
          },
          {
            address: '0x2233123asdasdf',
            name: '파랑이',
            img: 'https://i.imgur.com/Z4GLMZn.png',
            desc: '파랑~파랑이에옄ㅋㅋ',
            uptodate: 'Last updated 3 hours ago',
            cntFavorite: 2
          },
          {
            address: '0x3233123asdasdf',
            name: '민낯요정',
            img: 'https://i.imgur.com/lUMpSZe.png',
            desc: '좋은 인연되었으면 해요~',
            uptodate: 'Last updated 1 day ago',
            cntFavorite: 0
          }
        ],

        profiles2: [
          {
            address: '0x1233123asdasdf',
            name: '공유',
            img: 'https://i.imgur.com/hiSJELS.png',
            desc: '제 마음을 공유해드릴게요',
            uptodate: 'Last updated 3 mins ago',
            cntFavorite: 1
          },
          {
            address: '0x2233123asdasdf',
            name: '바람의아들',
            img: 'https://i.imgur.com/0Usai0K.png',
            desc: '바람아 불어라~',
            uptodate: 'Last updated 3 hours ago',
            cntFavorite: 1
          },
          {
            address: '0x3233123asdasdf',
            name: '차돌남',
            img: 'https://i.imgur.com/4B2mNYz.png',
            desc: '차돌박이 좋아하는 남자',
            uptodate: 'Last updated 1 day ago',
            cntFavorite: 1
          }
        ],

        amount: null,
        pending: false,
        winEvent: null        
    }
  },

  mounted () {
    console.log('dispatching getContractInstance')
    this.$store.dispatch('getContractInstance')
  },

  methods: {
    _orderProfiles: function(profiles) {
      return profiles.sort(function(a,b) {
        return (a.cntFavorite - b.cntFavorite < 0);
      });
    },

    onCardClick: function(profile) {
      // this.$router.push({path: 'register'})      
      this.profileTxt = profile.name;
      this.profileDesc = profile.desc;
      this.profileImg = profile.img;
      this.$refs.myModalRef.show();
    },

    handleProfileOk: function(name) {       
      this.$refs.myModalRef.hide();      
    },

    estimate: function() {
      let Won = this.$store.state.contractInstance().Won()
      Won.watch((err, result) => {
        if (err) {
          console.log('could not get event Won()')
        } else {
          console.log("complete:"+result.args)
          this.winEvent = result.args
          this.winEvent._amount = parseInt(result.args._amount, 10)
          this.pending = false
        }
      })
      this.amount = 0.01;

      
      // console.log(event.target.innerHTML, this.amount)
      this.winEvent = null
      this.pending = true
      this.$store.state.contractInstance().bet(1, {
        gas: 300000,
        value: this.$store.state.web3.web3Instance().toWei(this.amount, 'ether'),
        from: this.$store.state.web3.coinbase
      }, (err, result) => {
        if (err) {
          console.log(err)
          this.pending = false
        } else {
          console.log("complete")
          this.pending = false
        }
      })
    }
  }
}
</script>

<style scoped>
  .cardG {
    max-width: 300px;

    cursor: pointer;
  }  

  .bcg {    
    margin-bottom: 35px;
  }

  #has-won {
    color: green;
  }
  #has-lost {
    color:red;
  }
</style>