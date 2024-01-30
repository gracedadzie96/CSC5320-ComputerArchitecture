# Addition Exercise
add:
    li t0, 10       # t0 = 10
    li t1, 12       # t1 = 12
    add t2, t0, t1  # t2 = t0 + t1

# Subtraction Exercise
sub:
    li t0, 8        # t0 = 8
    li t1, 4        # t1 = 4
    sub t2, t0, t1  # t2 = t0 - t1

# Multiplication Exercise
mult: # Implements mult t2, t0, t1
    li t0, 2            # t0 = 2, op 1
    li t1, 4            # t1 = 4, op 2
    li t2, 0            # t2 = 0, register that will store product of t0 and t1
    li t3, 1            # t3 = 1, value to decrement t1 every iteration
    beqz t1, end_mult   # Don't bother with loop if t1 is 0
mult_start:
    add t2, t2, t0      # t2 += t0
    sub t1, t1, t3      # t1 -= t3
    bnez t1, mult_start # Goto `mult_start` if t1 != 0 (loop is not done yet)
end_mult:
    li t0, 128
