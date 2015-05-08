.data

Mystr: .asciiz"Input: \n"
Mystr1: .asciiz"x= "
Mystr2: .asciiz"y= "
Mystr3: .asciiz"Output: \n"
Mystr4: .asciiz"gcd(x,y)= "
Mystr5: .asciiz"\n"

.text

main:


li $v0, 4
la $a0, Mystr
syscall

li $v0, 4
la $a0, Mystr1
syscall

li $v0, 5
syscall

move $a1, $v0

li $v0, 4
la $a0, Mystr2
syscall

li $v0, 5
syscall
move $a2, $v0

jal loop




li $v0, 10
syscall


loop:


bne $a1,$0,loop1
move $a3, $a2
b cout

loop1:

bne $a2,$0,loop2
move $a3, $a1
b cout

loop2:

div $a1, $a2
move $a1, $a2
mfhi $a2
jal loop

cout:

li $v0,4
la $a0,Mystr3
syscall


li $v0,4
la $a0,Mystr4
syscall

li $v0,1
move $a0,$a3
syscall

li $v0,4
la $a0,Mystr5
syscall

j main



