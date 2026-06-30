#!/usr/bin/env python3
"""
Granger 因果检验框架 —— 3 变量系统

TIFM Rev.1 修正: 格兰杰 3 变量 + 季度 N≈64、面板 VAR

输入: TFR 二阶导数序列 + σ 分量序列
输出: Granger 因果检验结果表

版本: TIFM 4.1-REVISED
标签: DRAFT
"""

import numpy as np
import pandas as pd
from pathlib import Path
from typing import List, Dict

DATA_DIR = Path(__file__).parent.parent / "data"


def granger_3var_test(
    y: pd.Series,
    x1: pd.Series,
    x2: pd.Series,
    max_lag: int = 4
) -> Dict:
    """
    3 变量 Granger 因果检验
    
    检验: x1 和 x2 是否 Granger-引起 y
    
    Returns:
        {
            'f_statistic': float,
            'p_value': float,
            'lags': int,
            'n_obs': int,
            'significant': bool
        }
    """
    # 对齐时间索引
    aligned = pd.concat([y, x1, x2], axis=1).dropna()
    aligned.columns = ['y', 'x1', 'x2']
    
    n = len(aligned)
    if n < max_lag + 3:
        return {
            'f_statistic': np.nan,
            'p_value': np.nan,
            'lags': max_lag,
            'n_obs': n,
            'significant': False,
            'note': 'SORRY: 样本量不足'
        }
    
    # 构建滞后矩阵
    data = aligned.copy()
    for lag in range(1, max_lag + 1):
        data[f'y_lag{lag}'] = data['y'].shift(lag)
        data[f'x1_lag{lag}'] = data['x1'].shift(lag)
        data[f'x2_lag{lag}'] = data['x2'].shift(lag)
    
    data = data.dropna()
    
    if len(data) < 5:
        return {
            'f_statistic': np.nan,
            'p_value': np.nan,
            'lags': max_lag,
            'n_obs': len(data),
            'significant': False,
            'note': 'SORRY: 滞后调整后样本量不足'
        }
    
    # 简化实现: 使用线性回归 F 检验
    from sklearn.linear_model import LinearRegression
    from sklearn.metrics import r2_score
    
    # 受限模型: 仅用 y 的滞后
    y_lag_cols = [c for c in data.columns if c.startswith('y_lag')]
    X_restricted = data[y_lag_cols].values
    y_target = data['y'].values
    
    # 非受限模型: 加入 x1, x2 的滞后
    x_lag_cols = [c for c in data.columns if c.startswith(('x1_lag', 'x2_lag'))]
    X_unrestricted = data[y_lag_cols + x_lag_cols].values
    
    # 拟合
    reg_r = LinearRegression().fit(X_restricted, y_target)
    reg_u = LinearRegression().fit(X_unrestricted, y_target)
    
    y_pred_r = reg_r.predict(X_restricted)
    y_pred_u = reg_u.predict(X_unrestricted)
    
    rss_r = np.sum((y_target - y_pred_r) ** 2)
    rss_u = np.sum((y_target - y_pred_u) ** 2)
    
    q = len(x_lag_cols)  # 约束数
    n_obs = len(y_target)
    k = X_unrestricted.shape[1]  # 非受限模型参数数
    
    if rss_u == 0 or (n_obs - k) <= 0:
        return {
            'f_statistic': np.nan,
            'p_value': np.nan,
            'lags': max_lag,
            'n_obs': n_obs,
            'significant': False,
            'note': 'SORRY: 数值问题'
        }
    
    f_stat = ((rss_r - rss_u) / q) / (rss_u / (n_obs - k))
    
    from scipy import stats
    p_value = 1 - stats.f.cdf(f_stat, q, n_obs - k)
    
    return {
        'f_statistic': f_stat,
        'p_value': p_value,
        'lags': max_lag,
        'n_obs': n_obs,
        'significant': p_value < 0.05,
        'note': 'OK' if p_value >= 0.05 or f_stat < 0 else 'Significant'
    }


def main():
    print("Fc Granger 因果检验框架 (3 变量)")
    print("=" * 50)
    print("\n检验假设:")
    print("H0: σ_c 和 σ_e 不 Granger-引起 σ_b 的变化")
    print("H1: σ_c 和/或 σ_e Granger-引起 σ_b")
    print("\n状态: DRAFT — 等待完整面板数据到位")
    print("\nTIFM Rev.1 修正项:")
    print("- 格兰杰 3 变量系统")
    print("- 季度频率 N≈64")
    print("- 面板 VAR 结构")


if __name__ == "__main__":
    main()
