import { Pipe, PipeTransform } from '@angular/core';

import { IMentorList } from '../home/IMentorList.Module';
@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {
  transform(mentors: IMentorList[], searchText: string): any[] {
    if(!mentors) return [];
    if(!searchText) return mentors;
searchText = searchText.toLowerCase();
return mentors.filter( it => {
      return it.skName.toLowerCase().includes(searchText);
    });
   }
}

