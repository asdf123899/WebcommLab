import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { CaseReqViewPage } from './case-req-view.page';

const routes: Routes = [
  {
    path: '',
    component: CaseReqViewPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [CaseReqViewPage]
})
export class CaseReqViewPageModule {}
