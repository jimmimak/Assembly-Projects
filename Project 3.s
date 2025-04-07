# Athanasios Gkamplias, 3212019029
# Dimitrios Makris, 3212019119

# Enarjh Programmatos
.data                                                                                           # Oi dhlwseis twn metablhtwn tou programmatos
msg:           .asciiz "Calculation of the Greatest Common Divisor of two integers using Euclid's algorithm\n"       # string gia thn ektyposh mhnymatos  
input_1:       .asciiz "Insert the first integer: "                                             # string gia thn ektupwsh mhnumatos pou zhtaei apo ton xrhsth na eisagei ton proto akeraio arithmo
input_2:       .asciiz "Insert the second integer: "                                            # string gia thn ektupwsh mhnumatos pou zhtaei apo ton xrhsth na eisagei ton deytero akeraio arithmo
result_msg:    .asciiz "The Greatest Common Divisor is: "                                       # output message (emfanizei to apotelesma dhladh ton megisto koino diaireth)
str:           .asciiz "Both numbers are 0s!!!"                                                 # String gia thn ektyposh mhnymatos (otan kai oi 2 akeraioi arithmoi einai isoi me to mhden)

.text                                                                                           # kurio meros programmatos
main:                                                                                           # label pou deixnei to kurio meros tou programmatos
        la $a0, msg										# apothhkeuw auto pou thelw na emfanisw sto register $a0
	li $v0, 4 										# thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall											# ektelw system call gia na emfanisw to string

input:                                                                                          # label gia thn eisodo ton dyo akeraion kai ton elegxo ton timon tous
        la $a0, input_1										# apothhkeuw auto pou thelw na emfanisw sto register $a0
	li $v0, 4 										# thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall											# ektelw system call gia na emfanisw to string
	
	li $v0, 5										# thetw thn timh 5 sto $v0 gia na diabasw enan integer
	syscall											# ektelw system call gia na diabasw ton integer
	move $t0, $v0					                                        # apothhkeuw auto pou thelw na emfanisw sto register $t0
	
	la $a0, input_2								                # apothhkeuw auto pou thelw na emfanisw sto register $a0
	li $v0, 4 										# thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall											# ektelw system call gia na emfanisw to string
	
	li $v0, 5										# thetw thn timh 5 sto $v0 gia na diabasw enan integer
	syscall											# ektelw system call gia na diabasw ton integer
	move $t1, $v0					                                        # apothhkeuw auto pou thelw na emfanisw sto register $t1
	
	beq $t0, $t1, check_if_int_zero                                                         # An oi arithmoi einai isoi tote synexise sto label check_if_int_zero gia na elegjei an oi aritmoi einai isoi me mhden
	beq $t0, $zero, first_int_zero				                                # An o prwtos arithmos einai mhden tote synexise sto label first_int_zero
        beq $t1, $zero, result				                                        # An o deyteros arithmos einai mhden tote synexise sto label result
        blt $t0, $zero, ntp_0				                                        # An o protos arithmos einai arnhtikos tote synexise sto label ntp_0 gia na ton metatrecei se thetiko
	
check_if_secint_zero:							                        # label check_if_secint_zero
        bltz $t1, ntp_0			                                                        # An o deyteros arithmos einai arnhtikos synexise sto label ntp_0 gia na metatrapei se thetiko
  
check_if_int_zero:						                                # label poy elegxei an kapoios apo tous akeraious arithmous isoutai me mhden (otan oi dyo arithmoi einai isoi)
        beq $t0, $zero, zero				                                        # An o prwtos arithmos einai mhden tote synexise sto label zero
        bne $t0, $zero, loop					                                # An o prwtos arithmos den einai mhden tote synexise sto label loop (ypologismos tou MKD)
        
first_int_zero:						                                        # An o prwtos akeraios einai mhden tote o deyteros einai o megistos koinos diaireths
        move $t0, $t1						                                # Metakinhse ton deytero kataxorhth $t1 ston proto kataxorhth $t0 ($t0 = $t1)
        j result						                                # Jump sto label result (emfanizei ton akeraio arithmo $t0)
  
ntp_0:						                                                # (label ntp_0) metatroph apo arnhtiko se thetiko gia ton prwto akeraio
        sub $t0, $zero, $t0					                                # $t0 = 0 - $t0
        j check_if_secint_zero						                        # Jump sto label next gia na elegjei an o deyteros arithmos einai arnhtikos

ntp_1:						                                                # (label ntp_1) metatroph apo arnhtiko se thetiko gia ton deytero akeraio
        sub $t1, $zero, $t1					                                # $t1 = 0 - $t1
        j loop							                                # Jump sto label loop gia ton ypologismo tou megistou koinou diaireth (MKD)
        
zero:							                                        # zero label (otan kai oi dyo arithmoi isoutai me mhden)
        la $a0, str					                                        # apothhkeuw to String pou thelw na emfanisw sto register $a0
        li $v0, 4					                                        # thetw thn timi 4 sto $v0 gia na emfanisw ena string
        syscall						                                        # ektelw system call gia na emfanisw to string
        
        li $a0, 10 	                                                                        # ascii 0xA: LF (line feed)
        li $v0, 11	                                                                        # thetw thn timi 11 sto $v0 gia na emfanisw enan char
        syscall                                                                                 # ektelw system call gia na emfanisw ton char
        
        j input						                                        # Jump sto label input (gia thn eisagwgh neon arithmon)
        
loop:                                                                                           # label pou deixnei thn arxh tou brogxou epanalhjhs (ypologismos tou MKD) 
        beqz $t1, result                                                                        # otan h timh tou kataxwrhth $t1 ginei ish me to 0 ($t1 = 0) tote phgaine sto label result
        div $t0, $t1						                                # diairesh ton 2 akeraion arithmon
        move $t0, $t1						                                # Metakinei ton deytero kataxorhth $t1 ston prwto kataxorhth ($t0 = $t1) etsi oste na pragmatopoihthei h epomenh diairesh
        mfhi $t1						                                # to ypoloipo ths diaireshs brisketai ston kataxorhth Hi
        j loop					                                                # epistrofh sto label loop

result:                                                                                         # label to opoio tha emfanizei to apotelesma tou megistou koinou diaireth
        la $a0, result_msg									# apothhkeuw auto pou thelw na emfanisw sto register $a0
        li $v0, 4 										# thetw thn timi 4 sto $v0 gia na emfanisw ena string
        syscall											# ektelw system call gia na emfanisw to string 
        
        move $a0, $t0						                                # apothhkeuw auto pou thelw na emfanisw sto register $a0
        li $v0, 1						                                # thetw thn timh 1 sto $v0 gia na ektupwsw enan integer
        syscall						                                        # ektelw system call gia na emfanisw ton integer (ektyposh apotelesmatos)
        
        li $a0, 10 	                                                                        # ascii 0xA: LF (line feed)
        li $v0, 11	                                                                        # thetw thn timi 11 sto $v0 gia na emfanisw enan char
        syscall                                                                                 # ektelw system call gia na emfanisw ton char
        
        j input						                                        # Jump sto label loop (synexizei me thn nea eisagvgh akeraion xoris thn ektyposh tou String str1)  
# Telos Programmatos
