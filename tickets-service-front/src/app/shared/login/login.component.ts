import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {Router} from '@angular/router';
import {UserloginService} from '../../services/userlogin.service';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {User} from '../../app.component';
import {TicketUserService} from "../../services/ticket-user.service";
import {AuthService} from '../../services/auth.service';
import {TokenStorageService} from '../../services/token-storage.service';
import {AuthLoginInfo} from '../../auth/login-info';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {
  @Output() loginSelectedEvent = new EventEmitter();
  @Output() loginSelectedUser: EventEmitter<User> = new EventEmitter<User>();
  @Output() loginCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  public userLogin;
  public userPassword;
  public isLoggedIn = false;
  public isLoginFailed = false;
  public errorMessage = '';
  private loginInfo: AuthLoginInfo;

  form: FormGroup;

  public user: User;

  constructor(private router: Router,
              public userloginService: UserloginService,
              private authService: AuthService,
              private tokenStorage: TokenStorageService,
              public ticketUserService: TicketUserService) {
  }

  onClose($event: MouseEvent) {
    this.loginCloseEvent.emit($event);
  }

  onClickEnter() {
    //работа обработчика
    const that = this;
    if (this.form.valid) {
      this.loginInfo = new AuthLoginInfo(
        'Имя пользователя',
        this.form.get('userLogin').value,
        this.form.get('userPassword').value);

      this.authService.login(this.loginInfo).subscribe(
        data => {
          this.tokenStorage.saveToken(data.accessToken);
          this.tokenStorage.saveUsername(data.username);
          this.tokenStorage.saveAuthorities(data.roles);
          this.tokenStorage.saveUser(data);

          this.isLoginFailed = false;
          this.isLoggedIn = true;

          this.user = {
            userCitySelect: data.user.city,
            userConfirmPassword: '',
            userFirstName: data.user.firstName,
            userId: data.user.id,
            userLastName: data.user.lastName,
            userLogin: data.user.firstName + ' ' + data.user.middleName,
            userMiddleName: data.user.middleName,
            userPassword: data.user.password,
            userPhoneNumber: data.user.phone
          }

          this.userloginService.setCurrentUser(this.user);
          // то передаем юзера в главную страницу
          this.loginSelectedUser.emit(this.user);
        },
        error => {
          console.log(error);
          this.errorMessage = error.error.message;
          this.isLoginFailed = true;
        }
      );
      // ищем пользователя в базе
      this.userloginService.findUser(this.form.get('userLogin').value, this.form.get('userPassword').value).subscribe(item => {
        // получили юзверька item.userLogin удаляем иконку загрузки
        that.user = item;
        // то передаем юзера в главную страницу
        that.loginSelectedUser.emit(this.user);
      });
    }
  }

  onClickReg() {
    this.loginSelectedEvent.emit(this.userloginService.getCurrentCity());
  }

  ngOnInit() {
    this.form = new FormGroup({
      userLogin: new FormControl('', [
        Validators.required,
        Validators.email
      ]),
      userPassword: new FormControl(null, [
        Validators.required,
        Validators.minLength(6)
      ])
    });

    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
    }
  }
}
