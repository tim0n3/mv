# Text File Mover Script

This Bash script (`move`) is designed to move `.txt` files from a source directory to a specified destination directory. It also provides an option for verbose mode to display detailed information about the file movements.

## Usage

To use the script, follow these instructions:

1. Make sure you have Bash installed on your system.

2. Save the script to a file named `move`.

3. Make the script executable by running the following command:

   ```bash
   chmod +x move
   ```

4. Run the script with the following command:

   ```bash
   ./move [-v] [source_directory]
   ```

   - `-v`: Enable verbose mode to display detailed information about the file movements.
   - `source_directory` (optional): Specify the source directory from which to move the `.txt` files. If not provided, the current directory will be used as the source directory.

## Configuration

You can configure the script by modifying the following variables at the beginning of the script:

- `DEST_DIR`: Set the destination directory where the `.txt` files will be moved to.

   ```bash
   DEST_DIR="/home/pi/data/hotfolder/2023/August"
   ```

- `VERBOSE`: Set to `false` by default. Change it to `true` if you want to enable verbose mode.

   ```bash
   VERBOSE=false
   ```

- `LOG_FILE`: Define the log file to record the script's activities.

   ```bash
   LOG_FILE="/home/pi/textfilemover.log"
   ```

## Logging

The script includes functions for logging messages:

- `log()`: Logs messages to the specified log file with timestamps.

- `log_or_print()`: Logs messages and, if verbose mode is enabled, also prints them to the console.

## Example

Here's an example of how to use the script:

```bash
./move -v /path/to/source/directory
```

This will move all `.txt` files from the specified source directory to the destination directory while displaying detailed information if verbose mode is enabled.

## License

This script is provided under the [MIT License](LICENSE). Feel free to use and modify it as needed.