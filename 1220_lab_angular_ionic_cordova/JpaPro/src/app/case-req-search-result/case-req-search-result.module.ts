import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { CaseReqSearchResultPage } from './case-req-search-result.page';

const routes: Routes = [
  {
    path: '',
    component: CaseReqSearchResultPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [CaseReqSearchResultPage]
})
export class CaseReqSearchResultPageModule {}
