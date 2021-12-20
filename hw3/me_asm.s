.data
arr: .word 1, 2, 2, 5, 2, 2, 4, 1, 2, 2
len: .word 10
str: .string "The majority element is %d\n"

.text

.global main
main:
    addi    sp, sp, -4
    sw      ra, 0(sp)

    # majorityElement
    la      a0, arr
    lw      a1, len
    call    majorityElement
    mv      a3, a0              # save return value to a3

    # print integer
    la      a0, str      
    mv      a1, a3
    call    printf

    # restore ra
    lw      ra, 0(sp)
    addi    sp, sp, 4

    # exit
    li 		a0, 0
    ret

majorityElement:
    #addi    sp, sp, -4
    #sw      ra, 0(sp)
    mv      t1, a0              # t1: base_addr of arr
    li      t2, 1               # cnt = 1
    li      t3, 1               # i = 1
    lw      a0, 0(t1)           # major = num[0]
    addi    t1, t1, 4           # base_addr += 4 (Because array start from index 1)
for:
    bge     t3, a1, exit        # if i < len, branch to label "loop"
    #lw      ra, 0(sp)
    #addi    sp, sp, 4
    lw      t5, 0(t1)          # t5 = num[i]
    beq     t5, a0, if         # if(num[i] == major)
    beqz    t2, elseif         # else if(cnt == 0)
    addi    t2, t2, -1         # cnt--
increment:
    addi    t1, t1, 4          # base_addr += 4
    addi    t3, t3, 1          # i++
    j       for
if:
    addi    t2, t2, 1          # cnt++
    j       increment
elseif:
    mv      a0, t5             # major = num[i];
    li      t2, 1              # cnt=1
    j       increment

exit:
    ret
