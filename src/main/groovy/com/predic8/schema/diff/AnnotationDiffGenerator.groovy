/* Copyright 2012 predic8 GmbH, www.predic8.com

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. */

package com.predic8.schema.diff

import com.predic8.soamodel.*

class AnnotationDiffGenerator extends UnitDiffGenerator{

  def removed = {new Difference(description:"Annotation removed.", type: 'annotation', safe:true)}

  def added = {new Difference(description:"Annotation added.", type: 'annotation', safe:true)}

  def changed = {new Difference(description:"Annotation has changed.", type: 'annotation', safe:true)}

  List<Difference> compareUnit(){
    if(!a.equals(b)){
      return [new Difference(description:"Content of annotation changed.", type: 'annotation', safe:true)]
    }
    []
  }
}

