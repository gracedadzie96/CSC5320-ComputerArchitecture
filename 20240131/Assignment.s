.data
ax: .word 5

.text
# Problem 1: If statement
# int a,b,c;
# int main(){
#   if(a > 0){
#       b = 22;
#   }
# }
main_1:
    li t0, 1                # a = 1
    li t1, 0                # b = 0 (Default)
    ble t0, zero, end_1     # if: a > 0, else: goto end_1
    li t1, 22               #   b = 22
end_1:
    nop # Pause here to allow for debugging

# Problem 2: While loop
# i = 0
# while i < 10
#   i = i + 1
main_2:
    li t0, 0            # i = 0
    li t1, 10           # lim = 10
loop_start_2:
    bge t0, t1, end_2   # if: i < 10, else: goto end_2
    addi t0, t0, 1      #   i += 1
    j loop_start_2      # goto loop_start
end_2:
    nop # Pause here to allow for debugging

# Problem 3: Summation without array
# int a, b, c;
# int main() {
#   sum = a + b +c;
# }
main_3:
    li t0, 1        # a = 1
    li t1, 2        # b = 2
    li t2, 3        # c = 3
    add t3, t0, t1  # sum = a + b
    add t3, t2, t3  # sum += c
    nop # Pause here to allow for debugging

# Problem 4: Summation using array
# ax[5]
# s = 0
# i = 0
# while i < 5
#   s = s + ax[i]
#   i = i + 1
main_4:
    la t0, ax       # Store pointer to ax[0] in t0
    li t1, 0        # s = 0
    li t2, 0        # i = 0
    li t3, 5        # lim = 5 (size of ax)
loop_start_4:
    bge t2, t3, end_4 # if i > 5: goto end_4
    add t1, t1, t0
end_4:
    nop # Pause here to allow for debugging
    