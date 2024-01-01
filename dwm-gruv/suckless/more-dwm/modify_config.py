def toggle_borderpx(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    for i, line in enumerate(lines):
        if "static const unsigned int borderpx" in line:
            current_value = int(line.split('=')[1].split(';')[0].strip())
            new_value = 0 if current_value == 2 else 2
            lines[i] = f'static const unsigned int borderpx = {new_value};\n'

    with open(file_path, 'w') as file:
        file.writelines(lines)

if __name__ == "__main__":
    config_file = "/home/termai/suckless/dwm/config.h"
    toggle_borderpx(config_file)
