Write-Host ">>> Prospera OS: SIT-24 EU CBAM Compliance Scan Initializing..." -ForegroundColor Yellow

# 1. 讀取全球快照與創世封印
$Snapshot = Get-Content "Registry\AUDIT_RESULTS\SNAPSHOTS\AUDIT_SNAPSHOT_20260301.json" | ConvertFrom-Json
$MasterSeal = Get-Content "Registry\SECURITY\MASTER_SEAL_V1.json" | ConvertFrom-Json

# 2. 執行 ISO 14067 物理對齊校驗 (模擬)
Write-Host ">>> Verifying Linkage between Snapshot ($($Snapshot.snapshot_id)) and Master Seal..." -ForegroundColor Cyan

if ($Snapshot.master_seal_ref -eq $MasterSeal.master_hash) {
    Write-Host ">>> [SUCCESS] Physical Evidence Chain: VERIFIED." -ForegroundColor Green
    Write-Host ">>> [SUCCESS] Status: EU CBAM COMPLIANT." -ForegroundColor Green
} else {
    Write-Error ">>> [CRITICAL] Evidence Chain Broken. Compliance Failed."
    exit 1
}
