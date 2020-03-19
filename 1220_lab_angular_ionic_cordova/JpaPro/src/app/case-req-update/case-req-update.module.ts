import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { CaseReqUpdatePage } from './case-req-update.page';

const routes: Routes = [
  {
    path: '',
    component: CaseReqUpdatePage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [CaseReqUpdatePage]
})
export class CaseReqUpdatePageModule {}
