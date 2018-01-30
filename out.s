.data
str_g5900: .asciiz "True"
str_g5901: .asciiz "False"
str_g5915: .asciiz "IndexError: string index out of range"
str_g5919: .asciiz "ZeroDivisionError: division by zero"
str_g5930: .asciiz " "
str_g5932: .asciiz "a"
str_g5934: .asciiz "e"
str_g5936: .asciiz "i"
str_g5938: .asciiz "i"
str_g5940: .asciiz "u"
str_g5942: .asciiz "y"
str_g5944: .asciiz "0"
str_g5946: .asciiz "1"
str_g5948: .asciiz "2"
str_g5950: .asciiz "3"
str_g5952: .asciiz "4"
str_g5954: .asciiz "5"
str_g5956: .asciiz "6"
str_g5958: .asciiz "7"
str_g5960: .asciiz "8"
str_g5962: .asciiz "9"
str_g5964: .asciiz "0"
str_g5966: .asciiz "1"
str_g5968: .asciiz "2"
str_g5970: .asciiz "3"
str_g5972: .asciiz "4"
str_g5974: .asciiz "5"
str_g5976: .asciiz "6"
str_g5978: .asciiz "7"
str_g5980: .asciiz "8"
str_g5982: .asciiz "9"
str_g5985: .asciiz ""
str_g5989: .asciiz ""
str_g5995: .asciiz "ius"
str_g5996: .asciiz "s"
str_g5998: .asciiz "children"
str_g5999: .asciiz "child"
str_g6001: .asciiz "atoes"
str_g6002: .asciiz "ato"
str_g6004: .asciiz "ives"
str_g6005: .asciiz "ife"
str_g6007: .asciiz "men"
str_g6008: .asciiz "man"
str_g6010: .asciiz "ies"
str_g6011: .asciiz "y"
str_g6013: .asciiz "i"
str_g6014: .asciiz "ius"
str_g6016: .asciiz "ches"
str_g6017: .asciiz "ch"
str_g6019: .asciiz "shes"
str_g6020: .asciiz "sh"
str_g6022: .asciiz "xes"
str_g6023: .asciiz "x"
str_g6025: .asciiz ""
str_g6028: .asciiz " "
str_g6029: .asciiz " is "
str_g6030: .asciiz " "
str_g6031: .asciiz " is "
str_g6032: .asciiz " "
str_g6033: .asciiz ""
str_g6034: .asciiz "what do you want your poetry to be about? > "
str_g6037: .asciiz "please enter a subject > "
str_g6038: .asciiz "please enter a simpler subject > "
str_g6039: .asciiz "one a scale of 1 to 9, how poetic do you want to be? > "
str_g6041: .asciiz "0"
str_g6042: .asciiz "please enter a digit between 1 and 9 > "
str_g6044: .asciiz "an"
str_g6045: .asciiz "a"
.text
.globl main
# func str_len
func_g5892:
lw $a0 -4($sp)
li $v0 0
while_g5893:
lb $t0 0($a0)
beqz $t0 endwhile_g5893
addi $a0 $a0 1
addi $v0 $v0 1
b while_g5893
endwhile_g5893:
jr $ra
# func eq_strs
func_g5894:
lw $a0 -4($sp)
lw $a1 -8($sp)
while_g5895:
lb $t0 0($a0)
lb $t1 0($a1)
if_g5896:
beq $t0 $t1 endif_g5896
li $v0 0
jr $ra
endif_g5896:
beqz $t0 endwhile_g5895
beqz $t1 endwhile_g5895
addi $a0 $a0 1
addi $a1 $a1 1
b while_g5895
endwhile_g5895:
li $v0 1
jr $ra
# func str_to_bool
func_g5897:
lw $a0 -4($sp)
lb $a0 0($a0)
sne $v0 $a0 0
jr $ra
# func print_bool
func_g5898:
lw $a0 -4($sp)
li $v0 4
if_g5899:
beqz $a0 else_g5899
la $a0 str_g5900
b endif_g5899
else_g5899:
la $a0 str_g5901
endif_g5899:
syscall
li $a0 10
li $v0 11
syscall
jr $ra
# func lnot_str
func_g5902:
lw $a0 -4($sp)
lb $a0 0($a0)
seq $v0 $a0 0
jr $ra
# func neq_strs
func_g5903:
lw $a0 -4($sp)
lw $a1 -8($sp)
while_g5904:
lb $t0 0($a0)
lb $t1 0($a1)
if_g5905:
beq $t0 $t1 endif_g5905
li $v0 1
jr $ra
endif_g5905:
beqz $t0 endwhile_g5904
beqz $t1 endwhile_g5904
addi $a0 $a0 1
addi $a1 $a1 1
b while_g5904
endwhile_g5904:
li $v0 0
jr $ra
# func input
func_g5906:
lw $a0 -4($sp)
li $v0 4
syscall
li $a0 256
li $v0 9
syscall
move $a0 $v0
li $a1 256
li $v0 8
syscall
move $v0 $a0
while_g5907:
lb $t0 0($a0)
beq $t0 10 endwhile_g5907
addi $a0 $a0 1
b while_g5907
endwhile_g5907:
sb $zero 0($a0)
jr $ra
# func add_strs
func_g5908:
lw $a0 -4($sp)
li $v0 0
while_g5911:
lb $t0 0($a0)
beqz $t0 endwhile_g5911
addi $a0 $a0 1
addi $v0 $v0 1
b while_g5911
endwhile_g5911:
sw $v0 -12($sp)
lw $a0 -8($sp)
li $v0 0
while_g5912:
lb $t0 0($a0)
beqz $t0 endwhile_g5912
addi $a0 $a0 1
addi $v0 $v0 1
b while_g5912
endwhile_g5912:
lw $t0 -4($sp)
lw $t1 -8($sp)
lw $t2 -12($sp)
move $t3 $v0
add $a0 $t2 $t3
addi $a0 $a0 1
li $v0 9
syscall
move $t4 $v0
while_g5909:
lb $t5 0($t0)
beqz $t5 endwhile_g5909
sb $t5 0($t4)
addi $t0 $t0 1
addi $t4 $t4 1
b while_g5909
endwhile_g5909:
while_g5910:
lb $t5 0($t1)
beqz $t5 endwhile_g5910
sb $t5 0($t4)
addi $t1 $t1 1
addi $t4 $t4 1
b while_g5910
endwhile_g5910:
sb $zero 0($t4)
jr $ra
# func char_at_index
func_g5913:
lw $a0 -4($sp)
lw $a1 -8($sp)
li $t0 0
while_g5916:
lb $t1 0($a0)
beqz $t1 err_g5914
beq $t0 $a1 endwhile_g5916
addi $a0 $a0 1
addi $t0 $t0 1
b while_g5916
endwhile_g5916:
li $a0 2
li $v0 9
syscall
sb $t1 0($v0)
sb $zero 1($v0)
jr $ra
err_g5914:
la $a0 str_g5915
li $v0 4
syscall
li $a0 10
li $v0 11
syscall
li $v0 10
syscall
# func div_ints
func_g5917:
lw $a0 -4($sp)
lw $a1 -8($sp)
beqz $a1 err_g5918
div $v0 $a0 $a1
jr $ra
err_g5918:
la $a0 str_g5919
li $v0 4
syscall
li $a0 10
li $v0 11
syscall
li $v0 10
syscall
# func has_space
func_g5920:
lw $t9 -4($sp)
sw $t9 -32($sp)
sw $ra -24($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -28($sp)
addi $sp $sp -28
jal func_g5892
addi $sp $sp 28
lw $ra -24($sp)
sw $v0 -8($sp)
li $t9 0
sw $t9 -12($sp)
while_g5928:
lw $a0 -12($sp)
lw $a1 -8($sp)
slt $t9 $a0 $a1
beqz $t9 endwhile_g5928
if_g5929:
lw $t9 -4($sp)
sw $t9 -32($sp)
lw $t9 -12($sp)
sw $t9 -36($sp)
sw $ra -24($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -28($sp)
addi $sp $sp -28
jal func_g5913
addi $sp $sp 28
lw $ra -24($sp)
sw $v0 -16($sp)
move $t9 $v0
sw $t9 -32($sp)
la $t9 str_g5930
sw $t9 -36($sp)
sw $ra -24($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -28($sp)
addi $sp $sp -28
jal func_g5894
addi $sp $sp 28
lw $ra -24($sp)
move $t9 $v0
beqz $t9 else_g5929
li $v0 1
jr $ra
b endif_g5929
else_g5929:
nop
endif_g5929:
lw $a0 -12($sp)
li $a1 1
add $t4 $a0 $a1
sw $t4 -12($sp)
b while_g5928
endwhile_g5928:
li $v0 0
jr $ra
jr $ra
# func is_vowel
func_g5921:
if_g5931:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5932
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5931
li $v0 1
jr $ra
b endif_g5931
else_g5931:
nop
endif_g5931:
if_g5933:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5934
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5933
li $v0 1
jr $ra
b endif_g5933
else_g5933:
nop
endif_g5933:
if_g5935:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5936
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5935
li $v0 1
jr $ra
b endif_g5935
else_g5935:
nop
endif_g5935:
if_g5937:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5938
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5937
li $v0 1
jr $ra
b endif_g5937
else_g5937:
nop
endif_g5937:
if_g5939:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5940
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5939
li $v0 1
jr $ra
b endif_g5939
else_g5939:
nop
endif_g5939:
if_g5941:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5942
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5941
li $v0 1
jr $ra
b endif_g5941
else_g5941:
nop
endif_g5941:
li $v0 0
jr $ra
jr $ra
# func is_single_digit
func_g5922:
if_g5943:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5944
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5943
li $v0 1
jr $ra
b endif_g5943
else_g5943:
nop
endif_g5943:
if_g5945:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5946
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5945
li $v0 1
jr $ra
b endif_g5945
else_g5945:
nop
endif_g5945:
if_g5947:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5948
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5947
li $v0 1
jr $ra
b endif_g5947
else_g5947:
nop
endif_g5947:
if_g5949:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5950
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5949
li $v0 1
jr $ra
b endif_g5949
else_g5949:
nop
endif_g5949:
if_g5951:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5952
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5951
li $v0 1
jr $ra
b endif_g5951
else_g5951:
nop
endif_g5951:
if_g5953:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5954
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5953
li $v0 1
jr $ra
b endif_g5953
else_g5953:
nop
endif_g5953:
if_g5955:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5956
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5955
li $v0 1
jr $ra
b endif_g5955
else_g5955:
nop
endif_g5955:
if_g5957:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5958
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5957
li $v0 1
jr $ra
b endif_g5957
else_g5957:
nop
endif_g5957:
if_g5959:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5960
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5959
li $v0 1
jr $ra
b endif_g5959
else_g5959:
nop
endif_g5959:
if_g5961:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5962
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5961
li $v0 1
jr $ra
b endif_g5961
else_g5961:
nop
endif_g5961:
li $v0 0
jr $ra
jr $ra
# func letter_to_digit
func_g5923:
if_g5963:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5964
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5963
li $v0 0
jr $ra
b endif_g5963
else_g5963:
nop
endif_g5963:
if_g5965:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5966
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5965
li $v0 1
jr $ra
b endif_g5965
else_g5965:
nop
endif_g5965:
if_g5967:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5968
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5967
li $v0 2
jr $ra
b endif_g5967
else_g5967:
nop
endif_g5967:
if_g5969:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5970
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5969
li $v0 3
jr $ra
b endif_g5969
else_g5969:
nop
endif_g5969:
if_g5971:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5972
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5971
li $v0 4
jr $ra
b endif_g5971
else_g5971:
nop
endif_g5971:
if_g5973:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5974
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5973
li $v0 5
jr $ra
b endif_g5973
else_g5973:
nop
endif_g5973:
if_g5975:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5976
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5975
li $v0 6
jr $ra
b endif_g5975
else_g5975:
nop
endif_g5975:
if_g5977:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5978
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5977
li $v0 7
jr $ra
b endif_g5977
else_g5977:
nop
endif_g5977:
if_g5979:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5980
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5979
li $v0 8
jr $ra
b endif_g5979
else_g5979:
nop
endif_g5979:
if_g5981:
lw $t9 -4($sp)
sw $t9 -20($sp)
la $t9 str_g5982
sw $t9 -24($sp)
sw $ra -12($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -16($sp)
addi $sp $sp -16
jal func_g5894
addi $sp $sp 16
lw $ra -12($sp)
move $t9 $v0
beqz $t9 else_g5981
li $v0 9
jr $ra
b endif_g5981
else_g5981:
nop
endif_g5981:
jr $ra
# func get_prefix
func_g5924:
lw $t9 -4($sp)
sw $t9 -40($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5892
addi $sp $sp 36
lw $ra -32($sp)
sw $v0 -12($sp)
if_g5983:
lw $a0 -8($sp)
li $a1 0
slt $t9 $a0 $a1
beqz $t9 else_g5983
li $t9 0
sw $t9 -8($sp)
b endif_g5983
else_g5983:
nop
endif_g5983:
if_g5984:
lw $a0 -8($sp)
lw $a1 -12($sp)
sgt $t9 $a0 $a1
beqz $t9 else_g5984
lw $t9 -12($sp)
sw $t9 -8($sp)
b endif_g5984
else_g5984:
nop
endif_g5984:
li $t9 0
sw $t9 -16($sp)
la $t9 str_g5985
sw $t9 -20($sp)
while_g5986:
lw $a0 -16($sp)
lw $a1 -8($sp)
slt $t9 $a0 $a1
beqz $t9 endwhile_g5986
lw $t9 -4($sp)
sw $t9 -40($sp)
lw $t9 -16($sp)
sw $t9 -44($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5913
addi $sp $sp 36
lw $ra -32($sp)
sw $v0 -24($sp)
lw $t9 -20($sp)
sw $t9 -40($sp)
lw $t9 -24($sp)
sw $t9 -44($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5908
addi $sp $sp 36
lw $ra -32($sp)
sw $v0 -20($sp)
lw $a0 -16($sp)
li $a1 1
add $t4 $a0 $a1
sw $t4 -16($sp)
b while_g5986
endwhile_g5986:
lw $v0 -20($sp)
jr $ra
jr $ra
# func get_suffix
func_g5925:
lw $t9 -4($sp)
sw $t9 -48($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5892
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -12($sp)
if_g5987:
lw $a0 -8($sp)
li $a1 0
slt $t9 $a0 $a1
beqz $t9 else_g5987
li $t9 0
sw $t9 -8($sp)
b endif_g5987
else_g5987:
nop
endif_g5987:
if_g5988:
lw $a0 -8($sp)
lw $a1 -12($sp)
sgt $t9 $a0 $a1
beqz $t9 else_g5988
lw $t9 -12($sp)
sw $t9 -8($sp)
b endif_g5988
else_g5988:
nop
endif_g5988:
la $t9 str_g5989
sw $t9 -16($sp)
li $t9 0
sw $t9 -20($sp)
while_g5990:
lw $a0 -20($sp)
lw $a1 -8($sp)
slt $t9 $a0 $a1
beqz $t9 endwhile_g5990
lw $a0 -12($sp)
lw $a1 -8($sp)
sub $t4 $a0 $a1
sw $t4 -24($sp)
move $a0 $t4
lw $a1 -20($sp)
add $t4 $a0 $a1
sw $t4 -28($sp)
lw $t9 -4($sp)
sw $t9 -48($sp)
lw $t9 -28($sp)
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5913
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -32($sp)
lw $t9 -16($sp)
sw $t9 -48($sp)
lw $t9 -32($sp)
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5908
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -16($sp)
lw $a0 -20($sp)
li $a1 1
add $t4 $a0 $a1
sw $t4 -20($sp)
b while_g5990
endwhile_g5990:
lw $v0 -16($sp)
jr $ra
jr $ra
# func replace_suffix
func_g5926:
lw $t9 -4($sp)
sw $t9 -40($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5892
addi $sp $sp 36
lw $ra -32($sp)
sw $v0 -16($sp)
move $a0 $v0
lw $a1 -8($sp)
sub $t4 $a0 $a1
sw $t4 -20($sp)
lw $t9 -4($sp)
sw $t9 -40($sp)
lw $t9 -20($sp)
sw $t9 -44($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5924
addi $sp $sp 36
lw $ra -32($sp)
sw $v0 -24($sp)
move $t9 $v0
sw $t9 -40($sp)
lw $t9 -12($sp)
sw $t9 -44($sp)
sw $ra -32($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -36($sp)
addi $sp $sp -36
jal func_g5908
addi $sp $sp 36
lw $ra -32($sp)
jr $ra
jr $ra
# func seems_singular
func_g5991:
lw $t9 -4($sp)
sw $t9 -24($sp)
li $t9 3
sw $t9 -28($sp)
sw $ra -16($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -20($sp)
addi $sp $sp -20
jal func_g5925
addi $sp $sp 20
lw $ra -16($sp)
sw $v0 -8($sp)
if_g5994:
lw $t9 -8($sp)
sw $t9 -24($sp)
la $t9 str_g5995
sw $t9 -28($sp)
sw $ra -16($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -20($sp)
addi $sp $sp -20
jal func_g5894
addi $sp $sp 20
lw $ra -16($sp)
move $t9 $v0
beqz $t9 else_g5994
li $v0 1
jr $ra
b endif_g5994
else_g5994:
nop
endif_g5994:
lw $t9 -4($sp)
sw $t9 -24($sp)
li $t9 1
sw $t9 -28($sp)
sw $ra -16($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -20($sp)
addi $sp $sp -20
jal func_g5925
addi $sp $sp 20
lw $ra -16($sp)
sw $v0 -8($sp)
move $t9 $v0
sw $t9 -24($sp)
la $t9 str_g5996
sw $t9 -28($sp)
sw $ra -16($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -20($sp)
addi $sp $sp -20
jal func_g5903
addi $sp $sp 20
lw $ra -16($sp)
jr $ra
jr $ra
# func singularize
func_g5992:
if_g5997:
lw $t9 -4($sp)
sw $t9 -48($sp)
la $t9 str_g5998
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g5997
la $v0 str_g5999
jr $ra
b endif_g5997
else_g5997:
nop
endif_g5997:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 5
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6000:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6001
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6000
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 5
sw $t9 -52($sp)
la $t9 str_g6002
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6000
else_g6000:
nop
endif_g6000:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6003:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6004
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6003
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
la $t9 str_g6005
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6003
else_g6003:
nop
endif_g6003:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6006:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6007
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6006
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
la $t9 str_g6008
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6006
else_g6006:
nop
endif_g6006:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6009:
lw $t9 -8($sp)
sw $t9 -48($sp)
li $t9 0
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5913
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -12($sp)
move $t9 $v0
sw $t9 -48($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5921
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -16($sp)
move $a0 $v0
seq $t4 $a0 0
sw $t4 -20($sp)
lw $t9 -8($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -24($sp)
move $t9 $v0
sw $t9 -48($sp)
la $t9 str_g6010
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -28($sp)
lw $a0 -20($sp)
lw $a1 -28($sp)
and $t9 $a0 $a1
beqz $t9 else_g6009
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
la $t9 str_g6011
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6009
else_g6009:
nop
endif_g6009:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 1
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6012:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6013
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6012
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 1
sw $t9 -52($sp)
la $t9 str_g6014
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6012
else_g6012:
nop
endif_g6012:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6015:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6016
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6015
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
la $t9 str_g6017
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6015
else_g6015:
nop
endif_g6015:
if_g6018:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6019
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6018
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 4
sw $t9 -52($sp)
la $t9 str_g6020
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6018
else_g6018:
nop
endif_g6018:
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5925
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -8($sp)
if_g6021:
lw $t9 -8($sp)
sw $t9 -48($sp)
la $t9 str_g6022
sw $t9 -52($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5894
addi $sp $sp 44
lw $ra -40($sp)
move $t9 $v0
beqz $t9 else_g6021
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 3
sw $t9 -52($sp)
la $t9 str_g6023
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6021
else_g6021:
nop
endif_g6021:
if_g6024:
lw $t9 -4($sp)
sw $t9 -48($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5991
addi $sp $sp 44
lw $ra -40($sp)
sw $v0 -32($sp)
move $a0 $v0
seq $t9 $a0 0
beqz $t9 else_g6024
lw $t9 -4($sp)
sw $t9 -48($sp)
li $t9 1
sw $t9 -52($sp)
la $t9 str_g6025
sw $t9 -56($sp)
sw $ra -40($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -44($sp)
addi $sp $sp -44
jal func_g5926
addi $sp $sp 44
lw $ra -40($sp)
jr $ra
b endif_g6024
else_g6024:
lw $v0 -4($sp)
jr $ra
endif_g6024:
jr $ra
# func add_more_poetry
func_g6026:
if_g6027:
lw $a0 -12($sp)
seq $t9 $a0 0
beqz $t9 else_g6027
move $t7 $sp
lw $t7 0($t7)
lw $t7 0($t7)
lw $t9 -44($t7)
sw $t9 -68($sp)
la $t9 str_g6028
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -16($sp)
move $t9 $v0
sw $t9 -68($sp)
lw $t9 -8($sp)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -20($sp)
move $t9 $v0
sw $t9 -68($sp)
la $t9 str_g6029
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -24($sp)
move $t9 $v0
sw $t9 -68($sp)
move $t7 $sp
lw $t7 0($t7)
lw $t7 0($t7)
lw $t9 -44($t7)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -28($sp)
move $t9 $v0
sw $t9 -68($sp)
la $t9 str_g6030
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -32($sp)
move $t9 $v0
sw $t9 -68($sp)
lw $t9 -8($sp)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
jr $ra
b endif_g6027
else_g6027:
lw $a0 -12($sp)
li $a1 1
sub $t4 $a0 $a1
sw $t4 -36($sp)
lw $t9 -4($sp)
sw $t9 -68($sp)
lw $t9 -8($sp)
sw $t9 -72($sp)
lw $t9 -36($sp)
sw $t9 -76($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g6026
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -40($sp)
move $t9 $v0
sw $t9 -68($sp)
la $t9 str_g6031
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -44($sp)
move $t9 $v0
sw $t9 -68($sp)
move $t7 $sp
lw $t7 0($t7)
lw $t7 0($t7)
lw $t9 -44($t7)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -48($sp)
move $t9 $v0
sw $t9 -68($sp)
la $t9 str_g6032
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -52($sp)
move $t9 $v0
sw $t9 -68($sp)
lw $t9 -8($sp)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5908
addi $sp $sp 64
lw $ra -60($sp)
jr $ra
endif_g6027:
jr $ra
# func poetize
func_g5993:
la $t9 str_g6033
sw $t9 -24($sp)
lw $t9 -4($sp)
sw $t9 -28($sp)
lw $t9 -8($sp)
sw $t9 -32($sp)
sw $ra -16($sp)
la $t9 0($sp)
sw $t9 -20($sp)
addi $sp $sp -20
jal func_g6026
addi $sp $sp 20
lw $ra -16($sp)
jr $ra
jr $ra
# func generate_poetry
func_g5927:
la $t9 str_g6034
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5906
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -4($sp)
while_g6035:
lw $t9 -4($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5892
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -8($sp)
move $a0 $v0
li $a1 0
seq $t4 $a0 $a1
sw $t4 -12($sp)
lw $t9 -4($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5920
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -16($sp)
lw $a0 -12($sp)
lw $a1 -16($sp)
or $t9 $a0 $a1
beqz $t9 endwhile_g6035
if_g6036:
lw $t9 -4($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5892
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -20($sp)
move $a0 $v0
li $a1 0
seq $t9 $a0 $a1
beqz $t9 else_g6036
la $t9 str_g6037
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5906
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -4($sp)
b endif_g6036
else_g6036:
la $t9 str_g6038
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5906
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -4($sp)
endif_g6036:
b while_g6035
endwhile_g6035:
la $t9 str_g6039
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5906
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -24($sp)
while_g6040:
lw $t9 -24($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5922
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -28($sp)
move $a0 $v0
seq $t4 $a0 0
sw $t4 -32($sp)
lw $t9 -24($sp)
sw $t9 -68($sp)
la $t9 str_g6041
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5894
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -36($sp)
lw $a0 -32($sp)
lw $a1 -36($sp)
or $t9 $a0 $a1
beqz $t9 endwhile_g6040
la $t9 str_g6042
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5906
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -24($sp)
b while_g6040
endwhile_g6040:
lw $t9 -4($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5992
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -4($sp)
if_g6043:
lw $t9 -4($sp)
sw $t9 -68($sp)
li $t9 1
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5924
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -40($sp)
move $t9 $v0
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5921
addi $sp $sp 64
lw $ra -60($sp)
move $t9 $v0
beqz $t9 else_g6043
la $t9 str_g6044
sw $t9 -44($sp)
b endif_g6043
else_g6043:
la $t9 str_g6045
sw $t9 -44($sp)
endif_g6043:
lw $t9 -24($sp)
sw $t9 -68($sp)
sw $ra -60($sp)
la $t9 0($sp)
lw $t9 0($t9)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5923
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -48($sp)
lw $t9 -4($sp)
sw $t9 -68($sp)
lw $t9 -48($sp)
sw $t9 -72($sp)
sw $ra -60($sp)
la $t9 0($sp)
sw $t9 -64($sp)
addi $sp $sp -64
jal func_g5993
addi $sp $sp 64
lw $ra -60($sp)
sw $v0 -52($sp)
move $a0 $v0
li $v0 4
syscall
li $a0 10
li $v0 11
syscall
jr $ra
main:
sw $ra -4($sp)
la $t9 0($sp)
sw $t9 -8($sp)
addi $sp $sp -8
jal func_g5927
addi $sp $sp 8
lw $ra -4($sp)
jr $ra
