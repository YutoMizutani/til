## HttpClient

app/app.module.ts

```ts
import { NgModule }         from '@angular/core';
import { BrowserModule }    from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  imports: [
    BrowserModule,
    HttpClientModule,
  ],
  declarations: [
    AppComponent,
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule {}
```

app/app.component.ts

```ts
import { Component } from '@angular/core'
import { HttpClient } from '@angular/common/http'

import { map } from 'rxjs/operators'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  displayText: string = "Hello, world!!"

  constructor(
    private httpClient: HttpClient
  ) {}

  // $ curl http://httpbin.org/ip
  getFromHttpbin = () => this.httpClient.get("http://httpbin.org/ip")
    .pipe(
      map(obj => obj["origin"])
    )
    .pipe(
      map(origin => origin.split(", ")[0])
    )
    .subscribe(
      origin => console.log(origin)
    )
}
```

[HttpClient](https://angular.io/guide/http)
