.data

Mystr: .asciiz"Input: \n"
Mystr1: .asciiz"n= "
Mystr2: .asciiz"k= "
Mystr3: .asciiz"Output: \n"
Mystr4: .asciiz"Last suvivor= "
Mystr5: .asciiz"\n"

.text

main:


li $v0, 4
la $a0, Mystr
syscall

li $v0, 4
la $a0, Mystr1
syscall

li $v0, 5   #cin n = a1
syscall
move $a1, $v0

li $v0, 4
la $a0, Mystr2
syscall

li $v0, 5 #cin k = a2
syscall
move $a2, $v0

li $t4, 0 #int g=0
li $t5, 1 #int i=1
jal loop


li $v0, 10
syscall


loop:



bgt $t5,$a1,cout 

add $t0,$a2,$t4

div $t0,$t5

mfhi $t4

addi $t5,$t5,1

j loop

cout:

move $t7,$t4
addi $t7,$t7,1

li $v0,4
la $a0, Mystr3
syscall

li $v0,4
la $a0, Mystr4
syscall

li $v0,1
move $a0, $t7
syscall

li $v0,4
la $a0, Mystr5
syscall

j main