export class AuthController {

    constructor($auth){
        this.$auth = $auth;
    }

    register() {
        this.$auth.signup({email: 'test@test.com'});
    }

}
