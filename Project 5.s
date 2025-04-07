# Athanasios Gkamplias, 3212019029
# Dimitrios Makris, 3212019119

# Enarjh Programmatos
.data
array: .word	0:10				# orismos pinaka sth mnhmh (desmeyei enan pinaka 10 akeraiwn)
input_msg: .asciiz "Give integer "		# String pou protrepei ton xrhsth na eisagei enan akeraio (output message)
str: .asciiz ": "				# String gia thn emfanish ths anw kai katw teleias (output message)
unsorted_msg: .asciiz "Unsorted array:\n"	# String gia thn ektupwsh tou mhnumatos "Unsorted array:" (output message)
sorted_msg: .asciiz "\nSorted array:\n"		# String gia thn ektupwsh tou mhnumatos "Sorted array:" (output message)

.text						# kurio meros programmatos
main:						# label pou deixnei to kurio meros tou programmatos

insert_numbers:					# label pou eisagwntai ta 10 stoixeia tou pinaka

la $a0, input_msg				# apothhkeuw auto pou thelw na emfanisw (dhladh to input_msg) sto register $a0
li $v0, 4					# thetw thn timi 4 sto $v0 gia na emfanisw ena string
syscall						# ektelw system call gia na emfanisw to string

addi $t1, $t1, 1				# Aujhsh tou metrhth kata 1

move $a0, $t1					# antigrafoume thn timh tou kataxwrhth $t1 ston kataxwrhth $a0 
li $v0, 1					# thetoume thn timh 1 sto $v0 gia na ektupwsoume enan integer
syscall						# ektelw system call gia na emfanisw ton integer

la $a0, str					# apothhkeuw auto pou thelw na emfanisw (dhladh to str) sto register $a0
li $v0, 4					# thetw thn timi 4 sto $v0 gia na emfanisw ena string
syscall						# ektelw system call gia na emfanisw to string

li $v0, 5					# thetoume thn timh 5 sto $v0 gia na diabasoume enan integer
syscall						# ektelw system call gia na diabasw ton integer

sw $v0, array($t0)				# oi arithmoi pou eisagei o xrhsths apothikeuonai sthn antistoixh thesh mnhmhs pou desmeuei o pinakas
addi $t0, $t0, 4				# metakinhsh tou deikth kata mia thesi mprosta(prosthetoume 4 gia na deijei sthn epomenh thesi mnhmhs)

blt $t1, 10, insert_numbers                     # oso o metrhths einai mikroteros tou 10 epanelabe to insert_numbers			

la $a0, unsorted_msg				# apothhkeuw auto pou thelw na emfanisw (dhladh to unsorted_msg) sto register $a0
li $v0, 4					# thetw thn timi 4 sto $v0 gia na emfanisw ena string
syscall						# ektelw system call gia na emfanisw to string

li $t0, 0					# thetoume thn trexousa thesi tou pinaka sthn arxikh

display:					# label gia thn ektupwsh twn stoixeiwn tou pinaka

lw $a0, array($t0)				# o $a0 fortwnetai me ton arithmo pou brisketai sthn trexousa thesi tou pinaka kathe fora
li $v0, 1					# thetoume thn timh 1 sto $v0 gia na ektupwsoume enan integer (olous tous akeraious tou pinaka)
syscall						# ektelw system call gia na emfanisw ton integer

li $a0, 32                                      # ascii: space 
li $v0, 11                                      # thetw thn timi 11 sto $v0 gia na emfanisw enan xarakthra
syscall                                         # ektelw system call gia na emfanisw ton xarakthra

addi $t0, $t0, 4				# metakinhsh tou deikth kata mia thesi mprosta(prosthetoume 4 gia na deijei sthn epomenh thesi mnhmhs)

blt $t0, 40, display				# oso h trexousa thesi tou pinaka einai mikroterh tou 40 epanelabe to display          

bnez $t3, end					# an h timh tou kataxwrhth $t3 ginei mhden tote termatise to programma (end label), $t3 -> h timh tou dhlwnei an exei ginei h oxi antallagh thesewn se ena perasma

li $t2, 32					# o arithmos twn sugkrisewn kata thn diarkeia tajinomhshs tou pinaka

bubble_sort:					# label sto opoio ta stoixeia tou pinaka tajinomountai kata aujousa seira

li $t0, 0					# thetoume thn trexousa thesi tou pinaka sthn arxikh
li $t1, 0					# metrhths tou opoiou h timh metabaletai me to pou ginei mia allagh stoixeiwn ston pinaka

swap:						# to label sto opoio ginontai oi sugkriseis kai oi allages metaju duo stoixeiwn

lw $t8, array($t0)				# o $t8 fortwnetai me ton arithmo pou brisketai sthn trexousa thesi tou pinaka kathe fora
lw $t9, array + 4($t0)				# o $t9 fortwnetai me ton arithmo pou brisketai sthn epomenh thesi tou pinaka kathe fora

blt $t8, $t9, skip_swap				# An h timh tou kataxwrhth $t8 einai mikroterh tou kataxwrhth $t9 tote phgaine sto label skip_swap wste oi dyo times na mhn allajoun theseis

# allgh twn duo timwn sthn periptwsh pou h prohgoumenh einai megaluterh ths epomenhs 
sw $t9, array($t0)				# h timh tou kataxwrhth $t9 apothikeuetai sthn dieythinsi mnhmhs tou pinaka ($t0)
sw $t8, array + 4($t0)				# h timh tou kataxwrhth $t8 apothikeuetai sthn dieythinsi mnhmhs tou pinaka ($t0 + 4)

li $t1, 1					# h timh tou metrhth metaballetai afou egine mia allagh metaju duo timwn

skip_swap:					# to label sto opoio ta stoixeia tou pinaka pou sugkrinontai den allazoun theseis

addi $t0, $t0, 4				# metakinhsh tou deikth kata mia thesi mprosta(prosthetoume 4 gia na deijei sthn epomenh thesi mnhmhs)

ble $t0, $t2, swap				# an h timh tou kataxwrhth $t0 (to trexwn stoixeio tou pinaka) einai mikroterh ths timhs tou kataxwrhth $t2 (tou arithmou sugkrisewn) tote phgaine sto label swap 
						# gia na epibebaiwthei oti ola ta zeugaria timwn tou pinaka exoun sugkrithei
						
addi $t2, $t2, -4				# meiwsh tou arithmou twn sugkrisewn

bnez $t1, bubble_sort				# an h timh tou katasxwrhth $t1 (metrhths allagwn metaju duo timwn) einai diaforh tou 0 tote phgaine sto label bubble_sort gia na diasfalisoume oti ola ta stoixeia tou pinaka exoun tajinomhthei swsta          

li $t3, 1					# h timh tou kataxwrhth $t3 (flag) metaballetai gia na epibebaiwsoume oti o pinakas exei tajinomhthei prwtou ektupwthei

la $a0, sorted_msg				# apothhkeuw auto pou thelw na emfanisw (dhladh to sorted_msg) sto register $a0
li $v0, 4					# thetw thn timi 4 sto $v0 gia na emfanisw ena string
syscall						# ektelw system call gia na emfanisw to string

li $t0, 0					# thetoume thn trexousa thesi tou pinaka sthn arxikh

bnez $t3, display				# an h timh tou kataxwrhth $t3 (flag) einai diaforh tou 0 tote phgaine sto label display gia na emfaniseis ola ta stoixeia tou tajinomhmenou pinaka          

end:						# label gia termatismo tou programmatos
li $v0, 10					# thetw thn timh 10 sto $v0 wste na teramtisw to programma                
syscall                                         # ektelw system call gia na termatisw to programma
# Telos programmatos