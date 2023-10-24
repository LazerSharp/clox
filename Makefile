CC=gcc
BUILD_DIR=out

src_files= $(wildcard *.c)
header_files= $(wildcard *.h)
obj_files= $(src_files:%.c=$(BUILD_DIR)/%.o)


$(BUILD_DIR)/%.o: %.c $(header_files)
	$(CC) -c $< -o $@ -g
compile: $(obj_files)
	@ echo "compiled!"
$(BUILD_DIR)/clox: $(obj_files)
	$(CC) -o $(BUILD_DIR)/clox $(obj_files) -g
build: $(BUILD_DIR)/clox
	@ echo "built!"
fresh: clean $(BUILD_DIR)/clox
	@ echo "freshly backed!"
clean:
	rm -rf ./out
	mkdir out
run: $(BUILD_DIR)/clox
	@ ./$(BUILD_DIR)/clox ./lox-scripts/test.lox