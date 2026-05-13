# SIT-ESG-01: Carbon Data Anomaly Detection Norms

## 1. 偏差臨界值 (Deviation Thresholds)
*   **Historical Variance:** 每一筆計量數據與該節點前 30 日平均值相比，若偏差超過 ±30%，系統必須標記為 `UNVERIFIED_ANOMALY`。
*   **Coefficient Misalignment:** 若提交數據所使用之 `coefficient_hash` 與 `REGIONAL_COEFFICIENTS.json` 當前有效值不符，系統將物理性阻斷證書核發。

## 2. 物理標記機制 (Flagging Mechanism)
*   **Status: RED** -> 數據異常，觸發 Repo #25 鎖定，禁止進入資產重估流程。
*   **Status: YELLOW** -> 數據完整性缺項（如漏填設備 ID），要求重新補發。
*   **Status: GREEN** -> 通過計量邏輯與偏差校驗，准予核發證書。

## 3. 自動化處置規範 (Automated Remediation)
*   異常數據必須隔離於 `Registry/AUDIT_RESULTS/QUARANTINE/` 目錄。
*   系統將自動生成 `AUDIT_EXCEPTION_REPORT.md`，要求節點維護者進行物理查證並通過 PR 解鎖。
