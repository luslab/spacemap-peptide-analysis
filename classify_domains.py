#!/usr/bin/env python

import re
import sys
import os
import xml.etree.ElementTree as ET


inputFileName = 'input/interpro82.xml'


""" Create a temporary dir
"""
print("Create tmp dir if does not exist...", file = sys.stderr)
try:
    os.makedirs("tmp")
except FileExistsError:
    # directory already exists
    pass
print("Done", file = sys.stderr)


""" Remove citations
"""
print('Remove citations in square brackets... ', file = sys.stderr)
with open(inputFileName , 'r') as inputFile, \
     open('tmp/interpro82_nocit.xml', 'w') as outputFile:
    inputXML = inputFile.read()
    outputXML = re.sub(r"\[[^\[\]]*\]", \
                       "", \
                       inputXML)
    outputFile.write(outputXML)
print('Done', file = sys.stderr)


""" Parse InterPro entries 
"""
print('Parse InterPro entries... ', file = sys.stderr)
tree = ET.parse('tmp/interpro82_nocit.xml')
root = tree.getroot()
print('Done', file = sys.stderr)


""" Classify domains into 'Putative_DBD' and 'Other'
"""
print('Classify domains... ', file = sys.stderr)
iprClassification = dict()
for ipr in root:
    if ipr.tag == 'interpro':
        iprAccession = ipr.get('id')
        iprName = ipr.find('name').text
        if ipr.find('abstract'):
            iprAbstract = '\n'.join(p.text for p in ipr.find('abstract').iter(tag = 'p'))
        else:
            iprAbstract = ''
        if ipr.find('class_list'):
            iprGOTerms = ipr.find('class_list')
            goDescriptions = '; '. join(goTermDescription.text for goTermDescription in iprGOTerms.iter('description'))
        else:
            goDescriptions = ''
        if (not re.search('DNA', iprName)) and \
           (not re.search('DNA', iprAbstract)) and \
           (not re.search('DNA', goDescriptions)):
            iprClassification[iprAccession] = 'Other'
        else:
            iprClassification[iprAccession] = 'DNA-related'
print('Done', file = sys.stderr)


""" Output the classification table
"""
print('Output classification table... ', file = sys.stderr)
outputTSV = '\n'.join(iprAccession + '\t' + iprClassification[iprAccession] for iprAccession in iprClassification) + '\n'
outputTSV = 'ipr_accession' + '\t' + 'category' + '\n' + outputTSV 
with open('output/interpro82_domain_binary_classification.tsv', 'w') as outputFile:
    outputFile.write(outputTSV)
print('Done', file = sys.stderr)

