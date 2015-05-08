.data

Mystr: .asciiz"Input: \n"
Mystr1: .asciiz"Output: \n"
Mystr2: .asciiz"move "
Mystr3: .asciiz" -> "
endl: .asciiz"\n"
A: .asciiz"a"
B: .asciiz"b"
C: .asciiz"c"

.text

main:

li $v0, 4         # from=t1 via=t2 to= t3
la $a0, Mystr
syscall

li $v0,5   #cin n to a1
syscall
move $a1,$v0

la $t1,A
la $t2,B
la $t3,C

li $v0,4
la $a0, Mystr1
syscall

jal hanoi

li $v0,10
syscall

hanoi:

addi $sp,$sp,-20
sw $t3,16($sp)
sw $t2,12($sp)
sw $t1,8($sp)
sw $ra,4($sp)
sw $a1,0($sp)

bne $a1,1,loop

li $v0, 4
la $a0, Mystr2
syscall

li $v0, 4
move $a0, $t1
syscall

li $v0, 4
la $a0, Mystr3
syscall

li $v0,4
move $a0,$t3
syscall

li $v0,4
la $a0, endl
syscall

addi $sp,$sp,20

jr $ra



loop:

addi $a1,$a1,-1
move $t4,$t2
move $t2,$t3
move $t3,$t4

jal hanoi


lw $a1,0($sp)
lw $ra,4($sp)
lw $t1,8($sp)
lw $t2,12($sp)
lw $t3,16($sp)


li $v0, 4
la $a0, Mystr2
syscall

li $v0, 4
move $a0, $t1
syscall

li $v0, 4
la $a0, Mystr3
syscall

li $v0,4
move $a0,$t3
syscall


li $v0,4
la $a0, endl
syscall


addi $a1,$a1,-1
move $t4,$t1
move $t1,$t2
move $t2,$t4


jal hanoi

lw $a1,0($sp)
lw $ra,4($sp)
lw $t1,8($sp)
lw $t2,12($sp)
lw $t3,16($sp)


addi $sp,$sp,20

jr $ra

