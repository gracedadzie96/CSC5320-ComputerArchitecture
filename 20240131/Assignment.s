.data
    ax: .word 5 # uint32_t ax[5]
    hello_world: .string "Hello World!" # char *hello_world = "Hello World!"

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
    li t1, 0        # s = 0, sum
    li t2, 0        # i = 0, iterator
    li t3, 5        # lim = 5 (size of ax)
setup_array: # Sets the array elements
    # ax[0] = 2
    li t4, 2
    sw t4, 0(t0)
    # ax[1] = 4
    li t4, 4
    sw t4, 4(t0)
    # ax[2] = 8
    li t4, 8
    sw t4, 8(t0)
    # ax[3] = 16
    li t4, 16
    sw t4, 12(t0)
    # ax[4] = 32
    li t4, 32
    sw t4, 16(t0)
loop_start_4:
    bge t2, t3, end_4   # if i > 5: goto end_4
    lw t4, 0(t0)        # Get value within ax[i]
    add t1, t1, t4      # s += ax[i]
    addi t0, t0, 4      # ax_ptr += sizeof(word)
    addi t2, t2, 1      # i++
    j loop_start_4      # goto loop_start_4
end_4:
    nop # Pause here to allow for debugging


# Problem 5: Print "Hello World"
# print("Hello World!")
main_5:
    addi a0, x0, 4      # Specify string to be printed
    la a1, hello_world  # a1 = &"Hello World!"
    ecall               # print(*a1)
end_5:
    nop # Pause here to allow for debugging


# Problem 6: Reverse the string "Hello, World!"
main_6:
    nop


# Problem 7: Implement subroutines
# int twice(int x){
#   return( x + x);
# }
# int main(){
#   int a;
#   a = twice(2);
# }
main_7:
    nop



# Problem 8: Solve a = b + c + d + e - f using any values
main_8:
    nop


# Problem 9: Swap the values of two variables
main_9:
    nop


# Problem 10: Calculate 10! (factorial)
main_10:
    nop


# Problem 11: Find largest of 3 numbers.
main_11:
    nop


# Problem 12: Find the smallest of 3 numbers.
main_12:
    nop


# Problem 13: Install RISCV extension and run a program.
main_13:
    nop


# Problem 14: Perform binary search on the array 1, 4, 8, 10, 24
main_14:
    nop

# Problem 15: Describe registers x0-x31
main_15:
    nop


# Problem 16: Describe each section in RISC-V and write a program that uses them
main_16:
    nop


# Problem 17: Program that uses `ecall`
main_17:
    addi a0, x0, 1      # Specify printing int
    addi a1, x0, 100    # Load 100 into stdout buffer
    ecall               # print(100)
end_17:
    nop # Pause here to allow for debugging

# Problem 18: Perform AND, OR, and XOR
#
main_18:
    addi t0, x0, 512  # a = 512
    addi t1, x0, 1024 # b = 1024
and_18:
    and t2, t0, t1          # c = a & b
or_18:
    or t3, t0, t1           # d = a | b
xor_18:
    xor t4, t0, t1          # e = a ^ b
end_18:
    nop # Pause here to allow for debugging


# Problem 19: Print numbers 1-10
# for(int i = 1; i <= 10; i++)
#   print(i)
main_19:
    addi t0, x0, 1      # int i = 1
    addi t1, x1, 10     # LOOP_LIMIT = 10
loop_start_19:
    addi a0, x0, 1      # Print int to output
    add a1, x0, t0      # Load int to stdout
    ecall               # Call print
    addi t0, t0, 1      # i++
    ble t0, t1, loop_start_19 # if i <= LOOP_LIMIT, continue
end_19:
    nop # Pause here to allow for debugging


# Problem 20: First 5 even and odd numbers.
# for(int i = 0; i < 10; i+=2)
#   print(i)
# for(int i = 1; i < 10; i+=2)
#   print(i)
main_20:
    addi t0, x0, 0      # int i = 0
    addi t1, x0, 10     # LOOP_LIMIT = 10
    addi a0, x0, 1      # Indicate integer as output
even_loop_start_20:
    add a1, x0, t0      # Set value to be printed
    ecall               # Call print
    addi t0, t0, 2      # i+=2
    blt t0, t1, even_loop_start_20 # if i < 10, continue
    addi t0, x0, 1      # int i = 1
odd_loop_start_20:
    add a1, x0, t0
    ecall
    addi t0, t0, 2
    blt t0, t1, odd_loop_start_20 # if i < 10, continue
end_20:
    nop # Pause here to allow for debugging

terminate_program:
    # exit(0)
    addi a0, x0, 10
    ecall
