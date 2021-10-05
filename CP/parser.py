from gedcom.element.individual import IndividualElement
from gedcom.parser import Parser
import os

file_path = 'tree.ged'

gedcom_parser = Parser()

gedcom_parser.parse_file(file_path, False)

root_child_elements = gedcom_parser.get_root_child_elements()

father_facts = open('father_facts.txt', 'w+')
mother_facts = open('mother_facts.txt', 'w+')
result_facts = open('facts.txt', 'w')

for element in root_child_elements:
    if isinstance(element, IndividualElement):
        if len(gedcom_parser.get_parents(element, "ALL")) != 0:
            (father, mother) = gedcom_parser.get_parents(element, "ALL")
            (father_first_name, father_last_name) = father.get_name()
            (mother_first_name, mother_last_name) = mother.get_name()
            (child_first_name, child_last_name) = element.get_name()
            if mother_first_name != "NULL":
                mother_facts.write('mother(\'' + mother_first_name + ' ' + mother_last_name + '\', \'' + child_first_name + ' ' + child_last_name + '\').\n')
            if father_first_name != "NULL":
                father_facts.write('father(\'' + father_first_name + ' ' + father_last_name + '\', \'' + child_first_name + ' ' + child_last_name + '\').\n')

father_facts.close()
mother_facts.close()

filenames = ['father_facts.txt', 'mother_facts.txt']
with open('facts.txt', 'w') as outfile:
    for fname in filenames:
        with open(fname) as infile:
            outfile.write(infile.read())

os.remove('father_facts.txt')
os.remove('mother_facts.txt')

            
