<template>
  <div id="register">
    <h2>Register Form</h2>
    <b-form @submit="onSubmit">
      <b-form-group id="nameGroup" label="Name" label-for="ipName" description="please fill in the name">
        <b-form-input id="ipName" placeholder="Name" class="form-control" v-model="form.name" required></b-form-input>
      </b-form-group>

      <b-form-group id="genderGroup" label="Gender">
        <b-form-radio-group id="rgGender" v-model="form.gender">
          <b-form-radio value="Male">Male</b-form-radio>          
          <b-form-radio value="Female">Female</b-form-radio>          
        </b-form-radio-group>
      </b-form-group>

      <b-button class="btn" type="submit" variant="primary">Sign up</b-button>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: '',
        gender: 'male'
      }
    }
  },

  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      alert(JSON.stringify(this.form));
    }
  }
}
</script>