import {User} from "../app.component";

export class JwtResponse {
  accessToken: string;
  type: string;
  username: string;
  authorities: string[];
  user: User;
}
