return {
    s("cmake", fmt([[
    CC=gcc
    CFLAGS=-Wall -Wextra -Wuninitialized -MMD -g -fdiagnostics-color=auto
    LDFLAGS=
    SRC=$(wildcard *.c)
    OBJ=$(addprefix build/,$(SRC:.c=.o))
    DEP=$(addprefix build/,$(SRC:.c=.d))

    prog: $(OBJ)
    	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

    build/%.o: %.c
    	@mkdir -p build
    	$(CC) $(CFLAGS) -o $@ -c $<

    clean:
    	rm -rf build

    -include $(DEP)
    ]], { }, { })),

    s("cppmake", fmt([[
    CC=g++
    CXXFLAGS=-Wall -Wextra -Wuninitialized -MMD -g -fdiagnostics-color=auto
    LDFLAGS=
    SRC=$(wildcard *.cpp)
    OBJ=$(addprefix build/,$(SRC:.cpp=.o))
    DEP=$(addprefix build/,$(SRC:.cpp=.d))

    prog: $(OBJ)
    	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

    build/%.o: %.cpp
    	@mkdir -p build
    	$(CC) $(CXXFLAGS) -o $@ -c $<

    clean:
    	rm -rf build

    -include $(DEP)
    ]], { }, { })),
}, {
}
