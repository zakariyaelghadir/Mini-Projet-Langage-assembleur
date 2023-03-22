.data
msg1: .asciiz " saisir le nombre de ligne :  "
msg2: .asciiz "  "
ligne: .asciiz "\n"
.text
.globl main
main: 
   li $v0,4 # ligne 8
la $a0,msg1
syscall
li $v0,5
syscall
move $t7,$v0 # nombre de ligne n # ligne 13
li $t5,0 # p=0 # ligne 14
li $t1,1 # i=1
li $a2,2 # num=2 
 li $s7,2
for1: bgt $t1,$t7,finfor1
    sll $0,$0,0
   li $t2,1
   subu $t3,$t7,$t1
   for2: bgt $t2,$t3,finfor2
       li $v0,4
       la $a0,msg2
       syscall
       addiu $t2,$t2,1
   j for2
       finfor2: # ligne 28
       li $t4,1 # k=1
for3: bgt $t4,$t1,finfor3  # ligne 30
li $t5,0 # p=0
while: bnez $t5,finwhile
       sll $0,$0,0
                 li $t6,0 # flag=0
                 li $a1,2 # m=2
  for4:  bge $a1,$a2,finfor4
                sll $0,$0,0
                      div $a2,$a1
                      mfhi $a3  # $a3=$a2 % $a1
                      bne $a3,$0,flago
                       sll $0,$0,0
                      addiu $t6,$t6,1 # flag ++
                      flago:
                      addiu $a1,$a1,1 # m++
                j for4
                  finfor4:
                       beq $t6,$0,flago1
                   li $t5,0 # p=0
                       addiu $a2,$a2,1 # num++
                       flago1:
                         li $t5,1 # p=0
                        bne $a2,$s7,non
                         li $t5,1 # p=0
                         non:
                  finwhile:
                     li $v0,4
                     la $a0,msg2
                     syscall
                     li $v0,1
                     move $a0,$a2
                     syscall
                     li $v0,4
                     la $a0,msg2
                     syscall
             addiu $t4,$t4,1 # K++
                addiu $a2,$a2,1 # num++
                 b for3
                finfor3: # ligne 68
             li $v0,4  # ligne 69
                la $a0,ligne
               syscall
                addiu $t1,$t1,1 # i++
               j for1
               finfor1:
               li  $v0,10
             syscall   # ligne 76  