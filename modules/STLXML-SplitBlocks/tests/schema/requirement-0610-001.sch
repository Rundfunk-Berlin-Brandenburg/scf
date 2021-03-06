<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright 2018 Institut für Rundfunktechnik GmbH, Munich, Germany

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License.
You may obtain a copy of the License 

at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, the subject work
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron"  queryBinding="xslt" schemaVersion="ISO19757-3">
    <title>Testing Split TTI blocks if TF size exceeded - TF field</title>
    <pattern>
        <rule context="/">
            <assert test="count(StlXml/BODY/TTICONTAINER/TTI) = 3">
                Exactly three TTI blocks must be present.
            </assert> 
            <assert test="StlXml/BODY/TTICONTAINER/TTI[2]/TF">
                The TF element of the second TTI block must be present.
            </assert> 
        </rule>
        <rule context="StlXml/BODY/TTICONTAINER/TTI[2]/TF">
            <assert test="count(child::node()) = 3">
                Exactly three TF node children must belong to the second TTI block's TF field.
            </assert> 
            <assert test="child::node()[1] = 'Test'">
                Expected value: "Test" Value from test: "<value-of select="child::node()[1]"/>"
            </assert>
            <assert test="child::node()[2]/self::space">
                The child must be a space element.
            </assert>
            <assert test="child::node()[3] = 'text'">
                Expected value: "text" Value from test: "<value-of select="child::node()[3]"/>"
            </assert>
        </rule>
    </pattern>
</schema>
