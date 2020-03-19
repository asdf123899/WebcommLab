import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { CaseReqService } from './case-req.service';
import { CaseReqSearchPage } from './case-req-search/case-req-search.page';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { CaseReqSearchResultPage } from './case-req-search-result/case-req-search-result.page';
import { CaseReqCreatePage } from './case-req-create/case-req-create.page';
import { CaseReqUpdatePage } from './case-req-update/case-req-update.page';
import { CaseReqViewPage } from './case-req-view/case-req-view.page';
import { HTTP } from '@ionic-native/http/ngx';

@NgModule({
  declarations: [AppComponent, CaseReqSearchPage, CaseReqSearchResultPage, CaseReqCreatePage, CaseReqUpdatePage, CaseReqViewPage],
  entryComponents: [],
  imports: [BrowserModule, IonicModule.forRoot(), AppRoutingModule , FormsModule, ReactiveFormsModule, HttpClientModule],
  providers: [
    StatusBar,
    SplashScreen,
    HTTP,
    CaseReqService,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}


