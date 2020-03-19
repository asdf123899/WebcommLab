import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { CaseReqSearchPage } from './case-req-search/case-req-search.page';
import { CaseReqSearchResultPage } from './case-req-search-result/case-req-search-result.page';
import { CaseReqCreatePage } from './case-req-create/case-req-create.page';
import { CaseReqUpdatePage } from './case-req-update/case-req-update.page';
import { CaseReqViewPage } from './case-req-view/case-req-view.page';

const routes: Routes = [
  { path: '', redirectTo: 'oa/caseReq/index', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then( m => m.HomePageModule)},
  { path: 'oa/caseReq/index', component: CaseReqSearchPage } ,
  { path: 'oa/caseReq/caseReqSearchResult', component: CaseReqSearchResultPage },
  { path: 'oa/caseReq/caseReqCreate', component: CaseReqCreatePage },
  { path: 'oa/caseReq/caseReqUpdate/:caseNo', component: CaseReqUpdatePage },
  { path: 'oa/caseReq/caseReqView/:caseNo', component: CaseReqViewPage  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
