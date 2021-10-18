.data
arr: .word 1, 2, 2, 5, 4, 2, 2, 1, 2, 2
len: .word 10
str: .string "The majority element is "

.text

main:
    jal ra, majorityElement
    j print

majorityElement:
    li t4, 1               # t4: i
    la t3, len
    lw t3, 0(t3)           # t3: len
    la t2, arr             # t2: arr base_addr
    li t5, 1               # cnt = 1
    lw t6, 0(t2)           # major = num[0]
for:
    blt t4, t3, loop       # if i < n, branch to label "loop"
    jr ra

loop:
    lw s5, 0(t2)
    beq s5, t6, if         # if(num[i] == major)
    beq t5, zero, elseif   # else if(cnt == 0)
    addi t5, t5, -1        # cnt--
increment:
    addi t2, t2, 4         # base_addr += 4
    addi t4, t4, 1         # i++
    j for

if:
    addi t5, t5, 1         # cnt++
    j increment

elseif:
    addi t6, s5, 0         # major = num[i];
    addi t5, t5, 1         # cnt++
    j increment

# ---- print ----
print:
    la a0, str
    li a7,4                # print string
    ecall 
    mv a0, t6
    li a7, 1               # print integer
    ecall
exit:
    li a7, 10              # exit
    ecall