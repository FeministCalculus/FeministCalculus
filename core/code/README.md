# core/code

TIFM 4.1 因果检验路线图的实证执行代码。

## 文件清单

| 文件 | 用途 | 标签 |
|------|------|------|
| `bootstrap_hk.py` | ℋ_k 分层触发频率 Bootstrap 置信区间 | HARDENED |
| `granger_framework.py` | 3 变量 Granger 因果检验（季度 N≈64） | DRAFT |
| `panel_var_framework.py` | σ 分量跨分量相关 + 面板 VAR | DRAFT |

## 状态

[DATA-PENDING]：依赖的 `data/tfr_panel_2017_2024.csv` 与 `data/sigma_*.csv` 当前未公开（在私有仓库 `Fc-Formalism-full`）。

代码可读、未跑通。数据释出窗口待 TIFM 4.1 完成因果检验后再定。

## 引用

参见 `core/TIFM-4.1-Roadmap.md`。
