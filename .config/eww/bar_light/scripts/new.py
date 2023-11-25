import Xlib.display

def get_focused_desktop():
    display = Xlib.display.Display()
    root = display.screen().root
    window_id = root.get_full_property(display.intern_atom('_NET_ACTIVE_WINDOW'), 0).value[0]
    window = display.create_resource_object('window', window_id)
    
    # Get the desktop property only if it's available
    desktop_prop = window.get_full_property(display.intern_atom('_NET_WM_DESKTOP'), 0)
    
    if desktop_prop is not None:
        desktop = desktop_prop.value[0]
        return desktop

    return None

def count_windows_in_desktop(desktop):
    display = Xlib.display.Display()
    root = display.screen().root
    window_ids = root.get_full_property(display.intern_atom('_NET_CLIENT_LIST'), 0).value
    window_count = 0

    for window_id in window_ids:
        window = display.create_resource_object('window', window_id)
        
        # Get the desktop property only if it's available
        desktop_prop = window.get_full_property(display.intern_atom('_NET_WM_DESKTOP'), 0)
        
        if desktop_prop is not None:
            window_desktop = desktop_prop.value[0]
            if window_desktop == desktop:
                window_count += 1

    return window_count

def main():
    focused_desktop = get_focused_desktop()
    
    if focused_desktop is not None:
        window_count = count_windows_in_desktop(focused_desktop)
        print(f"Number of windows in desktop {focused_desktop}: {window_count}")
    else:
        print("Could not determine the focused desktop.")

if __name__ == "__main__":
    main()
