
CC := gcc
PC := fpc

C_EXAMPLES := easter lazarus

default: $(C_EXAMPLES)

%: %.c calfaq.c
	$(CC) -o $@ $^

demo1: demo1.pas calfaq.o
	$(PC) $<

calfaq.o: calfaq.c
	$(CC) $< -c -fPIC

demo2: demo2.pas libcalfaq.a
	$(PC) $<

libcalfaq.a: calfaq.o
	ar cr $@ $<

demo3: demo3.pas libcalfaq.so
	$(PC) $<

libcalfaq.so: calfaq.o
	$(CC) -o $@ $< -shared -fPIC

run: demo3
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. && ./demo3

demo: demo.pas calfaq.o
	$(PC) $<

clean:
	rm -fv *.a *.o *.so demo? $(C_EXAMPLES)
