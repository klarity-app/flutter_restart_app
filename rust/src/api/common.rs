#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}


#[flutter_rust_bridge::frb(sync)]
pub fn restart_app_smoke_test() -> bool {
    true
}


#[flutter_rust_bridge::frb(sync)]
pub fn restart_app() -> Result<(), String> {
    #[cfg(target_os = "macos")]
    {
        use std::process::Command;

        // Retrieve the path to the current executable
        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        let exe_path = current_exe.to_str().ok_or("Invalid executable path")?;

        // Use AppleScript to relaunch the application silently
        let script = format!(
            "tell application \"{}\" to activate",
            exe_path
        );

        Command::new("osascript")
            .arg("-e")
            .arg(script)
            .spawn()
            .map_err(|e| e.to_string())?;

        // Exit the current instance
        std::process::exit(0);
    }

    #[cfg(target_os = "windows")]
    {
        use std::process::Command;

        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        Command::new(&current_exe)
            .creation_flags(0x08000000) // CREATE_NO_WINDOW
            .spawn()
            .map_err(|e| e.to_string())?;
        std::process::exit(0);
    }

    #[cfg(target_os = "linux")]
    {
        use std::process::Command;

        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        Command::new(&current_exe)
            .spawn()
            .map_err(|e| e.to_string())?;
        std::process::exit(0);
    }

    #[cfg(not(any(target_os = "macos", target_os = "windows", target_os = "linux")))]
    {
        Err("Restarting is not implemented for this platform".to_string())
    }
}



