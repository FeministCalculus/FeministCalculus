#!/usr/bin/env python3
"""
Panel VAR 框架 —— 跨分量相关性矩阵

输入: σ_c / σ_b / σ_e / σ_i 面板数据
输出: 跨分量相关矩阵 + Granger 因果检验

版本: TIFM 4.1-DRAFT
标签: DRAFT (待数据到位后运行)
"""

import numpy as np
import pandas as pd
from pathlib import Path
from typing import Dict, Tuple

DATA_DIR = Path(__file__).parent.parent / "data"


def load_sigma_panels() -> Dict[str, pd.DataFrame]:
    """加载各 σ 分量面板"""
    panels = {}
    for component in ['sigma_c_unpaid_care', 'sigma_e_mental_health', 'sigma_i_ai_content']:
        path = DATA_DIR / f"{component}.csv"
        if path.exists():
            panels[component] = pd.read_csv(path, index_col=0)
        else:
            print(f"警告: {path} 不存在，跳过")
    return panels


def compute_correlation_matrix(panels: Dict[str, pd.DataFrame]) -> pd.DataFrame:
    """
    计算跨分量相关矩阵
    
    注意: σ_i 仅韩国数据，样本量不足，标记为 SORRY
    """
    # 提取各国时间序列
    countries = set()
    for panel in panels.values():
        countries.update(panel.index)
    
    # 构建对齐面板
    aligned_data = []
    for country in sorted(countries):
        row = {'country': country}
        for name, panel in panels.items():
            if country in panel.index:
                series = panel.loc[country].dropna()
                row[name] = series.mean() if len(series) > 0 else np.nan
            else:
                row[name] = np.nan
        aligned_data.append(row)
    
    df = pd.DataFrame(aligned_data).set_index('country')
    
    # 计算相关矩阵
    corr = df.corr(method='pearson')
    
    # 标记样本量不足的对
    if 'sigma_i_ai_content' in corr.columns:
        corr.loc['sigma_i_ai_content', :] = corr.loc['sigma_i_ai_content', :].apply(
            lambda x: f"{x:.3f} (SORRY: N=1)" if not pd.isna(x) else np.nan
        )
        corr.loc[:, 'sigma_i_ai_content'] = corr.loc[:, 'sigma_i_ai_content'].apply(
            lambda x: f"{float(str(x).split()[0]):.3f} (SORRY: N=1)" 
            if isinstance(x, str) and 'SORRY' in x else x
        )
    
    return corr


def granger_causality_test(
    x: pd.Series, 
    y: pd.Series, 
    max_lag: int = 2
) -> Tuple[float, float]:
    """
    简化的 Granger 因果检验
    
    Returns:
        (f_statistic, p_value)
    """
    from scipy import stats
    
    # 对齐并去除缺失值
    aligned = pd.concat([x, y], axis=1).dropna()
    if len(aligned) < max_lag + 2:
        return np.nan, np.nan
    
    x_aligned = aligned.iloc[:, 0].values
    y_aligned = aligned.iloc[:, 1].values
    
    # 简化实现: 使用滞后相关性作为代理
    # 完整实现需要 VAR 模型拟合
    correlations = []
    for lag in range(1, max_lag + 1):
        if len(x_aligned) > lag:
            corr = np.corrcoef(x_aligned[:-lag], y_aligned[lag:])[0, 1]
            correlations.append(corr)
    
    avg_corr = np.mean(correlations) if correlations else 0
    # 近似 p-value (简化)
    n = len(x_aligned) - max_lag
    t_stat = avg_corr * np.sqrt(n - 2) / np.sqrt(1 - avg_corr**2)
    p_value = 2 * (1 - stats.t.cdf(abs(t_stat), n - 2))
    
    return t_stat, p_value


def main():
    print("Fc Panel VAR 框架")
    print("=" * 50)
    
    panels = load_sigma_panels()
    print(f"加载面板: {list(panels.keys())}")
    
    if len(panels) >= 2:
        corr = compute_correlation_matrix(panels)
        print("\n跨分量相关矩阵:")
        print(corr)
    else:
        print("\n面板数据不足，无法计算相关矩阵")
        print("状态: SORRY — 等待数据补全")


if __name__ == "__main__":
    main()
