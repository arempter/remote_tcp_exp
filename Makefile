all:
	gcc -m32 -fno-stack-protector simple_buffer.c -o simple_buffer -D_FORTIFY_SOURCE=0
clean:
	rm simple_buffer