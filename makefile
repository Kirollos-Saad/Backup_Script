SCRIPT = backup.sh
SRC_DIR = /home/kiro/oslabs/assignments/lab1/sourcedir
DEST_DIR = /home/kiro/oslabs/assignments/lab1/backupdir
INTERVAL = 10
MAX_BACKUPS = 5

.PHONY: all
all: $(DEST_DIR)
	./$(SCRIPT) $(SRC_DIR) $(DEST_DIR) $(INTERVAL) $(MAX_BACKUPS)

# Target to create the destination directory if it doesn't exist
$(DEST_DIR):
	mkdir -p $(DEST_DIR)
