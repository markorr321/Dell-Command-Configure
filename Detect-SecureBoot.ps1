# Intune Proactive Remediation - Detection Script
# Detects if Secure Boot is disabled on Dell machines
# Exit 0 = Compliant (Secure Boot enabled), Exit 1 = Non-compliant (needs remediation)

$cctkPath = "${env:ProgramFiles(x86)}\Dell\Command Configure\X86_64\cctk.exe"

# Check if Dell Command Configure is installed
if (-not (Test-Path $cctkPath)) {
    Write-Output "Dell Command Configure not installed"
    exit 0  # Exit compliant - can't remediate without CCTK
}

try {
    # Query current Secure Boot status
    $result = & $cctkPath --SecureBoot 2>&1
    
    if ($result -match "SecureBoot=Enabled") {
        Write-Output "Secure Boot is already enabled"
        exit 0  # Compliant
    }
    elseif ($result -match "SecureBoot=Disabled") {
        Write-Output "Secure Boot is disabled - remediation required"
        exit 1  # Non-compliant
    }
    else {
        Write-Output "Unable to determine Secure Boot status: $result"
        exit 0  # Exit compliant if status unknown
    }
}
catch {
    Write-Output "Error querying Secure Boot status: $_"
    exit 0  # Exit compliant on error
}
