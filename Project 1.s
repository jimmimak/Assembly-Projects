#Athanasios Gkamplias, 3212019029
#Dimitrios Makris, 3212019119
	
#Enarjh programmatos
	.data						#Oi dhlwseis twn metablhtwn tou programmatos
str1:	.asciiz "Enter an integer: "			#Mhnyma pou zhtaei apo ton xrhsth ton prwto akeraio (input message)
str2:	.asciiz "Enter another integer: "		#Mhnyma pou zhtaei apo ton xrhsth ton prwto akeraio (input message)
str3:	.asciiz "The result of the subtraction is: "	#output message
int1:	.word 0						#dhlwsh akeraias metablhths int1 kai arxikopoihsh ths me to 0
int2:	.word 0						#dhlwsh akeraias metablhths int2 kai arxikopoihsh ths me to 0
	
	.text						#kurio meros programmatos
 main:							#label pou deixnei to kurio meros tou programmatos
 	la $a0, str1					#apothhkeuw auto pou thelw na emfanisw sto register $a0
 	li $v0, 4 					#thetw thn timi 4 sto $v0 gia na emfanisw ena string
 	syscall						#ektelw system call gia na emfanisw to string
 	
 	li $v0, 5					#thetw thn timh 5 sto $v0 gia na diabasw enan integer
 	syscall						#ektelw system call gia na diabasw ton integer
 	move $t0, $v0					#apothhkeuw auto pou thelw na emfanisw sto register $t0
 	
 	
 	la $a0, str2 					#apothhkeuw auto pou thelw na emfanisw sto register $a0
 	li $v0, 4 					#thetw thn timi 4 sto $v0 gia na emfanisw ena string
 	syscall						#ektelw system call gia na emfanisw to string
 	
 	li $v0, 5					#thetw thn timh 5 sto $v0 gia na diabasw enan integer					
 	syscall						#ektelw system call gia na diabasw ton integer
 	move $t1, $v0					#apothhkeuw auto pou thelw na emfanisw sto register $t1
 	
 	sub $t1, $t0, $t1				#t1 = t0 - t1 
 	
 	la $a0, str3					#apothhkeuw auto pou thelw na emfanisw sto register $a0
 	li $v0, 4 					#thetw thn timi 4 sto $v0 gia na emfanisw ena string
 	syscall						#ektelw system call gia na emfanisw to string
 	
 	li $v0, 1					#thetw thn timh 1 sto $v0 gia na ektupwsw enan integer
 	move $a0, $t1					#apothhkeuw auto pou thelw na emfanisw sto register $a0
 	syscall						#ektelw system call gia na emfanisw ton integer
 	
 	li $v0, 10					#thetw thn timh 10 sto $v0 wste na teramtisw to programma 
	syscall						#ektelw system call gia na termatisw to programma
#Telos programmatos