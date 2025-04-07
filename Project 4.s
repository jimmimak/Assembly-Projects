# Athanasios Gkamplias, 3212019029
# Dimitrios Makris, 3212019119

# Enarjh Programmatos
.data                                                                                 # Oi dhlwseis twn metablhtwn tou programmatos
array: .word 0:20                                                                     # orismos pinaka sth mnhmh (desmeyei enan pinaka 20 akeraiwn)
sum: .word 0									      # dhlwsh akeraias metablhths kai arxikopoihsh ths
msg_input1:   .asciiz "Enter the first term of the sequence: "                        # output message (string gia thn ektyposh mhnymatos)
msg_input2:   .asciiz "Enter the step of arithmetic progress: "                       # output message (string gia thn ektyposh mhnymatos)
sum_msg:   .asciiz "The sum of the 20 first terms of the sequence is: "               # output message (string gia thn ektyposh mhnymatos)

.text                                                                                 # kurio meros programmatos
main:                                                                                 # label pou deixnei to kurio meros tou programmatos (label gia thn eisodo twn dyo akeraiwn arithmwn)
        la $a0, msg_input1							      # apothhkeuw auto pou thelw na emfanisw sto register $a0 (mhnyma poy zhtaei apo ton xrhsth na eisagei ton prwto oro ths akolouthias)
	li $v0, 4 								      # thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall								              # ektelw system call gia na emfanisw to string
	
	li $v0, 5								      # thetw thn timh 5 sto $v0 gia na diabasw enan integer (o prwtos oros a0 ths akolouthias)
	syscall									      # ektelw system call gia na diabasw ton integer
	move $t1, $v0					                              # apothhkeuw auto pou thelw na emfanisw sto register $t1(h timh poy tha parei o prwtos oros ths akolouthias)
	
	la $a0, msg_input2						              # apothhkeuw auto pou thelw na emfanisw sto register $a0 (mhnyma pou zhtaei apo ton xrhsth na eisagei to bhma ths arithmitikhs proodou)
	li $v0, 4 								      # thetw thn timi 4 sto $v0 gia na emfanisw ena string
	syscall									      # ektelw system call gia na emfanisw to string
	
	li $v0, 5								      # thetw thn timh 5 sto $v0 gia na diabasw enan integer (to bhma ths arithmitikhs proodou)
	syscall									      # ektelw system call gia na diabasw ton integer
	move $t2, $v0					                              # apothhkeuw auto pou thelw na emfanisw ston register $t2 (h timh pou tha parei to bhma ths arithmitikhs proodou)
	
	
	move $t0, $zero                                                               # arxikopoihsh tou kataxwrhth $t0 me 0 o opoios kataxerhths sumbolizei tis theseis tou pinaka
	move $t6, $zero								      # arxikopoihsh tou kataxwrhth $t6 me 0 ($t6 -> kataxwrhths pou apothikeuei to athroisma twn 20 prwtwn orwn ths akolouthias)
	li $t7, 1								      # arxikopihsh tou kataxwrhth $t7 me 1 ($t7 -> metrhths tou brogxou)
	li $t5, 20                                                                    # to telos tou brogxou
        
        sw $t1, array($t0)                                                            # o prwtos oros tha mpei sth thesi tou pinaka + $t0 (thesi a0)
        add $t6, $t6, $t1							      # prosthiki tou prwtou orou ths akolouthias ston kataxwrhth athroismatos
        
loop1:                                                                                # label pou deixnei thn arxh tou brogxou epanalhchs(Loop gia ton ypologismo kai thn apothikeusi ton oron ths arithmitikhs proodou)
        lw $t1, array($t0)							      # o $t1 fortwnetai me thn timh ths akeraias metablhths h opoia brisketai sth dieuthini kurias mnhmhs array + ($t0 + 0)
        add $t4, $t1, $t2							      # prosthetoume to bhma ston trexwn arithmo gia na katalhjoume ston epomeno o opoios apothikeuetai ston kataxwrhth $t4
        addi $t0, $t0, 4							      # metakinhsh tou deikth kata mia thesi mprosta(prosthetoume 4 gia na deijei sthn epomenh thesi mnhmhs)
        sw $t4, array($t0)							      # apothikeuoume thn timh pou brisketai ston kataxwrhth $t4 sthn trexousa thesi tou pinaka 
        add $t6, $t6, $t4							      # prosthetoume thn timh pou brisketai ston kataxwrhth $t4 ston kataxwrhth athroismatos ($t6)
        addi $t7, $t7, 1							      # aujhsh tou metrhth kata 1
        blt $t7, $t5, loop1							      # oso o metrhths einai mikroteros tou 20 epanelabe to loop1

loop2:                                                                                # label pou deixnei thn arxh tou brogxou epanalhchs(Loop gia thn ektyposh twn orwn ths arithmitikhs proodou me antistrofh seira)
       lw $t3, array($t0)                                                             # fortwnoumai to trexwn stoixeio tou pinaka ston kataxwrhth $t3
       move $a0, $t3								      # antigrafoume thn timh tou kataxwrhth $t3 ston kataxwrhth $a0 
       li $v0, 1								      # thetoume thn timh 1 sto $v0 gia na ektupwsoume enan integer
       syscall									      # ektelw system call gia na emfanisw ton integer 
       
       li $a0, 32                                                                     # ascii: space 
       li $v0, 11                                                                     # thetw thn timi 11 sto $v0 gia na emfanisw enan xarakthra
       syscall                                                                        # ektelw system call gia na emfanisw ton xarakthra
       
       addi $t0, $t0, -4							      # metakinhsh tou deikth kata mia thesi pros ta pisw (afairoume 4 gia na deijei sthn prohgoumenh thesi mnhmhs)
       bge $t0, $zero, loop2							      # oso o kataxwrhths $t0 einai megaluteros h isos me to mhden epanelabe to loop2
       
        li $a0, 10 	                                                              # ascii 0xA: LF (line feed)
        li $v0, 11	                                                              # thetw thn timi 11 sto $v0 gia na emfanisw enan xarakthra
        syscall                                                                       # ektelw system call gia na emfanisw ton xarakthra
       
       la $a0, sum_msg								      # apothhkeuw auto pou thelw na emfanisw sto register $a0 (mhnyma pou dhlwnei oti akolouthei h emfanish tou athroismatos twn 20 prwtwn orwn ths akolouthias)
       li $v0, 4								      # thetw thn timi 4 sto $v0 gia na emfanisw ena string
       syscall									      # ektelw system call gia na emfanisw to string
       
       move $a0, $t6								      # antigrafoume thn timh tou kataxwrhth $t6 ston kataxwrhth $a0
       li $v0, 1								      # thetoume thn timh 1 sto $v0 gia na ektupwsoume enan integer
       syscall 									      # ektelw system call gia na emfanisw ton integer
       
       sw $t6, sum								      # apothikeuoume thn timh tou $t6 sth metablhth sum sthn kuria mnhmh
       
       li $v0, 10								      # thetw thn timh 10 sto $v0 wste na teramtisw to programma
       syscall									      # ektelw system call gia na termatisw to programma
# Telos programmatos