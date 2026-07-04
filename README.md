# Fc-public

Fc Formalism 公开层仓库 —— Feminist Calculus Framework（Fc）的核心文档、CCST 系统接口、TIFM 实证执行。

## 仓库定位

本仓库包含 Fc Formalism 系统中**可公开**的内容：

- **核心层**（`core/`）：当前主版本的所有冻结/草案文档
- **外围层**（`peripheral/`）：与其他理论的比较分析、衍生定理集
- **形式化层**（`formal/`）：Lean 4 推导链形式化（FcCore.lean）
- **案例层**（`cases/`）：框架应用案例
- **对话层**（`dialogue/`）：框架运行时的对话记录与框架发生史

## 目录结构

```
.
├── core/                    # 主文档
│   ├── Fc-v9.6.9-REVISED-Core.md        # Fc 框架主体（当前版本）
│   ├── Fc-Derived-008-A4配置族分化与Cb实证层-v1.0-DRAFT.md
│   ├── DFN-v2.5-HARDENED.md
│   ├── CCST-v3.10.0-HARDENED.md
│   ├── ChPP-v1.2-DRAFT.md
│   ├── DEG-v2.21.md
│   └── ...（TIFM、BET 等）
│
├── formal/                  # Lean 4 形式化
│   ├── FcCore.lean          # 15条推导链，所有SORRY已闭合
│   └── README.md
│
├── cases/                   # 应用案例
│   ├── Fc-CaseLibrary-v1.0-DRAFT.md
│   ├── Fc-Case-认知侵蚀与启动悖论.md   # AI认知卸载→启动悖论推导链
│   └── ...
│
├── peripheral/              # 外围分析与衍生定理
│   ├── Fc-RadFem-v1.0.1-HARDENED.md
│   ├── PCS_v0.3_DRAFT.md
│   ├── BET-v1.7-DRAFT.md
│   └── ...
│
├── data/                    # 实证数据
│   ├── education_collapse_report.md   # R_c退化多国实证
│   └── ...
│
├── dialogue/                # 对话记录与框架发生史
│   ├── Fc框架起源记录.md    # 框架从A1-A3到v9.6.9的发展史
│   └── ...
│
└── figures/                 # 数据可视化
```

## 阅读顺序建议

**第一次阅读**：
1. `core/Fc-v9.6.9-REVISED-Core.md`（主体框架）
2. `peripheral/Fc-RadFem-v1.0.1-HARDENED.md`（与现有理论的关系）
3. `dialogue/Fc框架起源记录.md`（框架如何生长）

**形式化层**：
- `formal/FcCore.lean`（15条推导链的Lean 4形式化，含机器可验证证明）

**深入数学层**：
- `core/CCST-v3.10.0-HARDENED.md`（崩溃理论）

**实证锚点**：
- `core/TIFM-4.0-Final-Summary.md`（11国×5分量×2017-2024）

## 版本标签规范

| 标签 | 含义 |
|------|------|
| `HARDENED` | 正文冻结，注释层可追加 |
| `REVISED` | 已经过审计修订，可能仍有 [CALIBRATE] 项 |
| `DRAFT` | 评审反馈驱动修订中 |
| `SORRY-XX` | 未决缺口，阻塞硬化 |
| `CALIBRATE-XX` | 参数验证中 |

## 引用指南

引用本仓库内容时，请同时注明：
- 文档名 + 版本号（如 `Fc v9.6.9-REVISED-Core`）
- 当前 commit 哈希（`git rev-parse HEAD`）

完整系统（含未公开诊断层细节、私人审计日志）位于私有仓库，邀请制访问。

## 免责声明

- 所有实证数据均来自公开来源（World Bank、OECD、UN Women SDG、WVS 等）
- 理论框架中的命题均为学术假设，不构成政策建议
- 部分子类型证伪条件仍处 [CALIBRATE] 状态，引用时请保留校准标签

## License

见 [LICENSE](./LICENSE)
