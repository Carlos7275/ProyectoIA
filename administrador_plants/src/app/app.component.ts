import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'administrador_plants';
}
interface SideNavToggle{
  screenWidth: number;
  collapsed: boolean;
}