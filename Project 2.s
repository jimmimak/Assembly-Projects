# Athanasios Gkamplias, 3212019029
# Dimitrios Makris, 3212019119

# Enarjh programmatos
.data												# Oi dhlwseis twn metablhtwn tou programmatos
str1:	.asciiz "Enter how many numbers will the Fibonacci sequence print: "			# string gia thn ektupwsh mhnumatos pou zhtaei apo ton xrhsth na eisagei to plhthos twn orwn ths akolouthias Fibonacci pou epithimei na ektupwthoun

.text												# kurio meros programmatos
main:												# label pou deixnei to kurio meros tou programmatos
	li $t0, 0										# fortwsh ths timhs 0 ston kataxwrhth $t0
	li $t1, 1										# fortwsh ths timhs 1 ston kataxwrhth $t1

	la $a0, str1										# apothhkeuw auto pou thelw na emfanisw sto register $a0
	li $v0, 4 										# thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall											# ektelw system call gia na emfanisw to string
 	
	li $v0, 5										# thetw thn timh 5 sto $v0 gia na diabasw enan integer
	syscall											# ektelw system call gia na diabasw ton integer
    
	move $t2, $v0										# antigrafei thn timh tou kataxwrhth $v0 ston kataxwrhth $t2
               
loop:												# label pou deixnei thn arxh tou brogxou epanalhjhs
	move $a0, $t0										# antigrafei thn timh tou kataxwrhth $t0 ston kataxwrhth $a0
	li $v0, 1										# thetw thn timi 1 sto $v0 gia na emfanisw enan akeraio
	syscall											# ektelw system call gia na emfanisw ton akeraio
    
	li $a0, 32 										# dhmiourgia space sumfwna me ton pinaka ascii
	li $v0, 11										# thetw thn timi 11 sto $v0 gia na emfanisw enan xarakthra, dhladh to space
   	syscall											# ektelw system call gia na emfanisw to space
    
    	add $t3, $t0, $t1									# $t3 = $t0 + $t1
	move $t0, $t1										# antigrafei thn timh tou kataxwrhth $t1 ston kataxwrhth $t0
	move $t1, $t3										# antigrafei thn timh tou kataxwrhth $t3 ston kataxwrhth $t1
    
 	addi $t2, $t2, -1									# meiwsh metrhth
	beq $t2,$zero, end									# otan h timh tou kataxwrhth $t2 ginei ish me to 0 ($t2 = 0) tote phgaine sto label end
 	j loop											# epistrofh sto label loop    
 	   
end:												# label end
   	li $v0, 10										# thetw thn timh 10 sto $v0 wste na teramtisw to programma
   	syscall											# ektelw system call gia na termatisw to programma
    
# Telos programmatos
