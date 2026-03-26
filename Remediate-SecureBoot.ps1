# Intune Proactive Remediation - Remediation Script
# Enables Secure Boot on Dell machines using Dell Command Configure
# Exit 0 = Success, Exit 1 = Failure

$cctkPath = "${env:ProgramFiles(x86)}\Dell\Command Configure\X86_64\cctk.exe"

# Optional: Set BIOS password if required (uncomment and set password)
# $biosPassword = "YourBiosPassword"

# Check if Dell Command Configure is installed
if (-not (Test-Path $cctkPath)) {
    Write-Output "Dell Command Configure not installed"
    exit 1
}

try {
    # Build command arguments
    $arguments = @("--SecureBoot=Enabled")
    
    # Add BIOS password if defined
    # if ($biosPassword) {
    #     $arguments += "--ValSetupPwd=$biosPassword"
    # }
    
    # Enable Secure Boot
    $result = & $cctkPath $arguments 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Output "Secure Boot enabled successfully. Reboot required."
        exit 0  # Success
    }
    else {
        Write-Output "Failed to enable Secure Boot. Exit code: $LASTEXITCODE. Output: $result"
        exit 1  # Failure
    }
}
catch {
    Write-Output "Error enabling Secure Boot: $_"
    exit 1
}
