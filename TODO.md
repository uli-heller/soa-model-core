TODO
====

## Open Todos

## Closed Todos

### groovy.lang.MissingMethodException: No signature of method: com.predic8.soamodel.Difference.addAll() is applicable for argument types: (java.util.ArrayList) values: [[]]

We do get this exception when trying to create a wsdl diff for wsdl files containing `xs:all`.

```
$ bin/groovy.sh groovy-scripts/wsdlDiff.groovy   src/test/resources/uli/a.wsdl src/test/resources/uli/b.wsdl
Caught: groovy.lang.MissingMethodException: No signature of method: com.predic8.soamodel.Difference.addAll() is applicable for argument types: (java.util.ArrayList) values: [[]]
Possible solutions: findAll(), findAll(groovy.lang.Closure)
groovy.lang.MissingMethodException: No signature of method: com.predic8.soamodel.Difference.addAll() is applicable for argument types: (java.util.ArrayList) values: [[]]
Possible solutions: findAll(), findAll(groovy.lang.Closure)
	at java_util_List$addAll.call(Unknown Source)
	at com.predic8.schema.diff.ComplexTypeDiffGenerator.compareModel(ComplexTypeDiffGenerator.groovy:45)
	at com.predic8.schema.diff.ComplexTypeDiffGenerator.compareUnit(ComplexTypeDiffGenerator.groovy:31)
	at com.predic8.schema.diff.UnitDiffGenerator.compare(UnitDiffGenerator.groovy:24)
	at com.predic8.schema.diff.UnitDiffGenerator$compare.call(Unknown Source)
	at com.predic8.schema.diff.SchemaDiffGenerator.compareComplexType(SchemaDiffGenerator.groovy:60)
	at com.predic8.schema.diff.SchemaDiffGenerator.this$3$compareComplexType(SchemaDiffGenerator.groovy)
	at com.predic8.schema.diff.SchemaDiffGenerator$this$3$compareComplexType.call(Unknown Source)
	at com.predic8.schema.ComplexType.compare(ComplexType.groovy:72)
	at com.predic8.schema.ComplexType$compare.call(Unknown Source)
	at com.predic8.schema.diff.ComplexTypesDiffGenerator.compareUnit(ComplexTypesDiffGenerator.groovy:28)
	at com.predic8.schema.diff.ListDiffGenerator$_compare_closure1.doCall(ListDiffGenerator.groovy:25)
	at com.predic8.schema.diff.ListDiffGenerator.compare(ListDiffGenerator.groovy:24)
	at com.predic8.schema.diff.ListDiffGenerator$compare.call(Unknown Source)
	at com.predic8.schema.diff.SchemaDiffGenerator.compareComplexTypes(SchemaDiffGenerator.groovy:56)
	at com.predic8.schema.diff.SchemaDiffGenerator.compare(SchemaDiffGenerator.groovy:47)
	at com.predic8.schema.diff.SchemaDiffGenerator$compare.call(Unknown Source)
	at com.predic8.wsdl.diff.WsdlDiffGenerator$_compareSchemas_closure7.doCall(WsdlDiffGenerator.groovy:127)
	at com.predic8.wsdl.diff.WsdlDiffGenerator.compareSchemas(WsdlDiffGenerator.groovy:122)
	at com.predic8.wsdl.diff.WsdlDiffGenerator.compare(WsdlDiffGenerator.groovy:46)
	at com.predic8.wsdl.diff.WsdlDiffGenerator$compare.call(Unknown Source)
	at wsdlDiff.run(wsdlDiff.groovy:29)
```
