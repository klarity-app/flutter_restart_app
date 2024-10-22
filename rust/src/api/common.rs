#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}


#[flutter_rust_bridge::frb(sync)]
pub fn restart_app_smoke_test() -> bool {
    true
}


#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn restart_app() -> Result<(), String> {
    #[cfg(target_os = "macos")]
    {
        use std::process::Command;
        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        Command::new("open")
            .arg("-n")
            .arg(current_exe)
            .spawn()
            .map_err(|e| e.to_string())?;
        std::process::exit(0);
    }

    #[cfg(target_os = "windows")]
    {
        use std::process::Command;
        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        Command::new("cmd")
            .args(&["/C", "start", "", &current_exe.to_string_lossy()])
            .spawn()
            .map_err(|e| e.to_string())?;
        std::process::exit(0);
    }

    #[cfg(target_os = "linux")]
    {
        use std::process::Command;
        let current_exe = std::env::current_exe().map_err(|e| e.to_string())?;
        Command::new(current_exe)
            .spawn()
            .map_err(|e| e.to_string())?;
        std::process::exit(0);
    }

    #[cfg(not(any(target_os = "macos", target_os = "windows", target_os = "linux")))]
    {
        Err("Restarting is not implemented for this platform".to_string())
    }
}


