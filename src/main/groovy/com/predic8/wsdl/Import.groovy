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

package com.predic8.wsdl

import javax.xml.namespace.QName as JQName

import com.predic8.xml.util.*
import com.predic8.soamodel.Consts

class Import extends WSDLElement {

  public static final JQName ELEMENTNAME = new JQName(Consts.WSDL11_NS, 'import')
  String namespace
  String location
  def importedWSDL

  protected parseAttributes(token, params){
    namespace = token.getAttributeValue(null , 'namespace')
    location = token.getAttributeValue(null , 'location')
    parseImport(token, params)
  }

  private parseImport(token, params){
    params['input'] = location
    params.baseDir = definitions.baseDir
    importedWSDL = (new WSDLParser(resourceResolver: definitions.resourceResolver )).parse(params)
    if(importedWSDL.targetNamespace == definitions.targetNamespace) {
      definitions.bindings.addAll(importedWSDL.bindings)
      definitions.messages.addAll(importedWSDL.messages)
      definitions.portTypes.addAll(importedWSDL.portTypes)
      definitions.imports.addAll(importedWSDL.imports)
    }
  }

  def create(creator, ctx) {
    creator.createImport(this, ctx.clone())
  }
}

