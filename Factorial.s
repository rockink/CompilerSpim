# ./Factorial.s
# Source file: Factorial.java
# Compiled: Mon May 08 09:37:03 EDT 2017

.text

pass/Factorial.<clinit>:
    subu    $sp,$sp,8 	 # Stack frame is 8 bytes long
    sw      $ra,4($sp) 	 # Save return address
    sw      $fp,0($sp) 	 # Save frame pointer
    addiu   $fp,$sp,4 	 # Save frame pointer

pass/Factorial.<clinit>.0:

pass/Factorial.<clinit>.1:
    li null,5
    NLIRPutField.toSpim() not yet implemented!
    j pass/Factorial.<clinit>.restore

pass/Factorial.<clinit>.restore:
    lw      $ra,4($sp) 	 # Restore return address
    lw      $fp,0($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,8 	 # Pop stack
    jr      $ra 	 # Return to caller



.text

main:
    subu    $sp,$sp,8 	 # Stack frame is 8 bytes long
    sw      $ra,4($sp) 	 # Save return address
    sw      $fp,0($sp) 	 # Save frame pointer
    addiu   $fp,$sp,4 	 # Save frame pointer

main.0:

main.1:
    NLIRGetField.toSpim() not yet implemented!
    NLIRGetField.toSpim() not yet implemented!
    jal java.lang.StringBuilder.__init__
    la null,Constant..String0+12
    move null,null
    move null,null
    jal pass.Factorial.factorial
    move null,null
    move null,null
    j main.restore

main.restore:
    lw      $ra,4($sp) 	 # Restore return address
    lw      $fp,0($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,8 	 # Pop stack
    jr      $ra 	 # Return to caller

.data

Constant..String0:
    .word 2 # Tag 2 indicates a string
    .word 20 # Size of object in bytes
    .word 4 # String length (not including null terminator)
    .asciiz "! = " # String terminated by null character 0
    .align 3 # Next object is on a word boundary


.text

pass/Factorial.factorial:
    subu    $sp,$sp,8 	 # Stack frame is 8 bytes long
    sw      $ra,4($sp) 	 # Save return address
    sw      $fp,0($sp) 	 # Save frame pointer
    addiu   $fp,$sp,4 	 # Save frame pointer

pass/Factorial.factorial.0:

pass/Factorial.factorial.1:
    li null,0
    bgt null,null,pass/Factorial.factorial.4
    j pass/Factorial.factorial.2

pass/Factorial.factorial.2:
    li null,1
    move null,null
    j pass/Factorial.factorial.restore

pass/Factorial.factorial.4:
    li null,1
    sub null,null,null
    move null,null
    move null,null
    jal pass.Factorial.factorial
    move null,null
    move null,null
    mul null,null,null
    move null,null
    j pass/Factorial.factorial.restore

pass/Factorial.factorial.restore:
    lw      $ra,4($sp) 	 # Restore return address
    lw      $fp,0($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,8 	 # Pop stack
    jr      $ra 	 # Return to caller



# SPIM Runtime

# Copyright 2013 Bill Campbell, Swami Iyer and Bahar Akbal-Delibas

# SPIM.s 

.text

# Print the integer value passed as parameter.

spim.SPIM.printInt:

    subu $sp,$sp,32     # Stack frame is 32 bytes long
    sw $fp,28($sp)      # Save frame pointer
    addu $fp,$sp,3      # Set up frame pointer

    li $v0,1            # Syscall code to print an integer
    syscall	        # Prints the arg value

    lw $fp,28($sp)      # Restore frame pointer
    addiu $sp,$sp,32    # Restore the stack pointer
    jr $ra              # Return to caller

# Print the float value passed as parameter.

spim.SPIM.printFloat:

    subu $sp,$sp,32     # Stack frame is 32 bytes long
    sw $fp,28($sp)      # Save frame pointer
    addu $fp,$sp,32     # Set up frame pointer

    li $v0,2            # Syscall code to print a float
    syscall             # Prints the arg value

    lw $fp,28($sp)      # Restore frame pointer
    addiu $sp,$sp,32    # Restore the stack pointer
    jr $ra              # Return to caller

# Print the double value passed as parameter.
	
spim.SPIM.printDouble:
    subu $sp,$sp,32    # Stack frame is 32 bytes long
    sw $fp,28($sp)     # Save frame pointer
    addu $fp,$sp,32    # Set up frame pointer

    li $v0,3           # Syscall code to print a double
    syscall            # Prints the arg value

    lw $fp,28($sp)     # Restore frame pointer
    addiu $sp,$sp,32   # restore the stack pointer
    jr $ra             # Return to caller

# Print the string value passed as parameter.

spim.SPIM.printString:
    subu $sp,$sp,32    # Stack frame is 32 bytes long
    sw $fp,28($sp)     # Save frame pointer
    addu $fp,$sp,32    # Set up frame pointer

    li $v0,4           # Syscall code to print a string
    syscall            # Print the string value

    lw $fp,28($sp)     # Restore frame pointer
    addiu $sp,$sp,32   # Restore the stack pointer
    jr $ra             # Return to caller

# Print the char value passed as parameter.

spim.SPIM.printChar:
	subu $sp,$sp,32	   # Stack frame is 32 bytes long
	sw $fp,28($sp)     # Save frame pointer
	addu $fp,$sp,32    # Set up frame pointer


	li $v0,11          # Syscall code to print a char
	syscall            # Print the char value

	lw $fp,28($sp)     # Restore frame pointer
	addiu $sp,$sp,32   # Restore the stack pointer
	jr $ra             # Return to caller

# Read the integer value from the user through console.

spim.SPIM.readInt:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,5                # Syscall code to read an integer
	syscall                 # Load the integer value read from console into $v0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Read the float value from the user through console.
	
spim.SPIM.readFloat:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,6                # Syscall code to read a float
	syscall	                # Load the float value read from console into $f0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Read the double value from the user through console.

spim.SPIM.readDouble:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,7                # Syscall code to read a double
	syscall	                # Load the float value read from console into $f0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller
   
# Read the string value from the user through console.

spim.SPIM.readString:
	subu $sp,$sp,32		# Stack frame is 32 bytes long
	sw $fp,28($sp)		# Save frame pointer
	addu $fp,$sp,32		# Set up frame pointer

	li $v0,8		# Syscall code to read a string
	syscall			# Load the string value; $a0 = buffer, $a1 = length

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32	# Restore the stack pointer
	jr $ra 			# Return to caller

# Read the char value from the user through console.

spim.SPIM.readChar:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,12               # Syscall code to read a char
	syscall	                # Load the char value read from console into $a0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller
	
# Opens a file. This operation uses two arguments:
# $a0 = the address of the file name to open
# $a1 = flags  (0: read only, 1: write only, 2: read and write, 
#               100: create file, 8: append data)
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.open:
	subu $sp,$sp,32         # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,13       	# System call code for open file
  	syscall          	# Open a file (file descriptor returned in $v0)

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Reads from a file. This operation uses three arguments:
# $a0 = file descriptor
# $a1 = the address of input buffer
# $a2 = the length of bytes to read
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.read:
	subu $sp,$sp,32         # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,14               # System call code for read file
  	syscall                 # Read from file ($a0 contains file descriptor, $v0 contains 
  	                        # number of character read)

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Writes to a file. This operation uses three arguments:
# $a0 = file descriptor
# $a1 = the address of output buffer
# $a2 = the length of bytes to write
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.write:
	subu $sp,$sp,32     # Stack frame is 32 bytes long
	sw $fp,28($sp)      # Save frame pointer
	addu $fp,$sp,32     # Set up frame pointer

 	li $v0,15           # System call for write to file
  	syscall             # Write to file  ($a0 contains file descriptor)

	lw $fp,28($sp)      # Restore frame pointer
	addiu $sp,$sp,32    # Restore the stack pointer
	jr $ra              # Return to caller

# Close a file ($a0 contains file descriptor).

spim.SPIM.close:
	subu $sp,$sp,32	    # Stack frame is 32 bytes long
	sw $fp,28($sp)      # Save frame pointer
	addu $fp,$sp,32     # Set up frame pointer

	li $v0,16           # System call code for close
  	syscall		    # Close file

	lw $fp,28($sp) 	    # Restore frame pointer
	addiu $sp,$sp,32    # Restore the stack pointer
	jr $ra              # Return to caller

# Exit SPIM.
	
spim.SPIM.exit:
    li $v0,10        # Syscall code to exit
    syscall

# Exit SPIM with a specified code (in $a0).
	
spim.SPIM.exit2:
    li $v0,17        # Syscall code to exit2
    syscall
	
