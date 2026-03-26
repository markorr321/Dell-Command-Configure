# Dell Command | Configure - Intune Deployment Guide

## Package Location
The `.intunewin` package is located at:
```
c:\Win32\Output\Install.intunewin
```

---

## Intune Upload Instructions

### Step 1: Access Intune Admin Center
1. Go to [Microsoft Intune Admin Center](https://intune.microsoft.com)
2. Navigate to **Apps** > **Windows** > **+ Add**
3. Select **Windows app (Win32)** and click **Select**

---

### Step 2: App Information
Upload `Install.intunewin` and fill in the following:

| Field | Value |
|-------|-------|
| Name | Dell Command \| Configure |
| Description | Dell Command \| Configure utility for BIOS settings management |
| Publisher | Dell Inc. |
| Category | Computer Management (optional) |

---

### Step 3: Program Settings

| Field | Value |
|-------|-------|
| Install command | `Install.cmd` |
| Uninstall command | `Uninstall.cmd` |
| Install behavior | System |
| Device restart behavior | App install may force a device restart |
| Return codes | Use default return codes |

---

### Step 4: Requirements

| Field | Value |
|-------|-------|
| Operating system architecture | 64-bit |
| Minimum operating system | Windows 10 1809 |

---

### Step 5: Detection Rules

Choose **ONE** of the following options:

#### Option A: File Detection (Recommended)

| Setting | Value |
|---------|-------|
| Rule type | File |
| Path | `%ProgramFiles(x86)%\Dell\Command Configure\X86_64` |
| File or folder | `cctk.exe` |
| Detection method | File or folder exists |
| Associated with a 32-bit app on 64-bit clients | No |

#### Option B: Registry Detection

| Setting | Value |
|---------|-------|
| Rule type | Registry |
| Key path | `HKEY_LOCAL_MACHINE\SOFTWARE\Dell\CommandConfigure` |
| Detection method | Key exists |
| Associated with a 32-bit app on 64-bit clients | Yes |

---

### Step 6: Dependencies & Supersedence
- **Dependencies**: None required
- **Supersedence**: Configure if replacing an older version

---

### Step 7: Assignments
1. Click **Add group** under **Required** or **Available**
2. Select your target device groups
3. Click **Select**

---

### Step 8: Review + Create
1. Review all settings
2. Click **Create**

---

## Language Transforms Available

The package includes these language transforms (MST files):

| Code | Language |
|------|----------|
| 1028 | Chinese (Traditional) |
| 1031 | German |
| 1033 | English (US) - **Default** |
| 1034 | Spanish |
| 1036 | French |
| 1040 | Italian |
| 1041 | Japanese |
| 1043 | Dutch |
| 2052 | Chinese (Simplified) |
| 3076 | Chinese (Hong Kong) |

To change the installation language, edit `Install.cmd` and replace `1033.mst` with the desired language code.

---

## Troubleshooting

### Installation Logs
Logs are saved to:
- Install: `%TEMP%\DellCommandConfigure_Install.log`
- Uninstall: `%TEMP%\DellCommandConfigure_Uninstall.log`

### Verify Installation
Run in Command Prompt:
```cmd
"%ProgramFiles(x86)%\Dell\Command Configure\X86_64\cctk.exe" --version
```

---

## Files in This Package

| File | Purpose |
|------|---------|
| Command_Configure.msi | Main installer |
| Install.cmd | Silent install script |
| Uninstall.cmd | Silent uninstall script |
| *.mst | Language transform files |
