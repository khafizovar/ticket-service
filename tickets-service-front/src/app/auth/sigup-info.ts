import {City} from '../app.component';

export class SignUpInfo {
  username: string;
  email: string;
  password: string;
  city: City;
  phone: string;

  constructor(username: string, email: string, password: string) {
    this.username = username;
    this.email = email;
    this.password = password;
  }
}
