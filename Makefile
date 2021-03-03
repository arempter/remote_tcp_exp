simple_buffer:
	gcc -m64 -fno-stack-protector simple_buffer.c -o simple_buffer -D_FORTIFY_SOURCE=0
reverse_tcp:
	gcc -g -m64 -fno-stack-protector reverse_tcp.c -o reverse_tcp -D_FORTIFY_SOURCE=0
clean:
	rm simple_buffer && rm reverse_tcp
