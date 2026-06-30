#!/usr/bin/env python3
"""
Bootstrap ℋ_k 触发条件检验

输入: TFR 面板数据 (data/tfr_panel_2017_2024.csv)
输出: ℋ_k(2/1/0) 分层触发频率的 Bootstrap 置信区间

版本: CALIBRATE-SWARM-04
标签: HARDENED
"""

import numpy as np
import pandas as pd
from pathlib import Path

DATA_DIR = Path(__file__).parent.parent / "data"

def load_tfr_panel() -> pd.DataFrame:
    """加载 TFR 面板数据"""
    path = DATA_DIR / "tfr_panel_2017_2024.csv"
    if not path.exists():
        raise FileNotFoundError(f"数据文件不存在: {path}")
    return pd.read_csv(path, index_col=0)


def compute_second_derivative(series: pd.Series) -> pd.Series:
    """计算二阶差分（离散二阶导数）"""
    return series.diff().diff()


def classify_hk(d2: float, threshold_2: float = -0.15, threshold_1: float = -0.05) -> int:
    """
    ℋ_k 分层分类
    
    Args:
        d2: 二阶导数值
        threshold_2: ℋ_k(2) 阈值（强触发）
        threshold_1: ℋ_k(1) 阈值（弱触发）
    
    Returns:
        2: 强触发
        1: 弱触发
        0: 无触发
    """
    if d2 <= threshold_2:
        return 2
    elif d2 <= threshold_1:
        return 1
    return 0


def bootstrap_hk_distribution(
    df: pd.DataFrame,
    n_bootstrap: int = 10000,
    random_state: int = 42
) -> dict:
    """
    Bootstrap 检验 ℋ_k 触发频率
    
    Returns:
        {
            'hk2_mean': float,
            'hk2_ci': (lower, upper),
            'hk1_mean': float,
            'hk1_ci': (lower, upper),
            'hk0_mean': float,
            'hk0_ci': (lower, upper)
        }
    """
    rng = np.random.RandomState(random_state)
    countries = df.index.tolist()
    n = len(countries)
    
    hk2_counts = []
    hk1_counts = []
    hk0_counts = []
    
    for _ in range(n_bootstrap):
        # 有放回抽样国家
        sampled = rng.choice(countries, size=n, replace=True)
        sample_df = df.loc[sampled]
        
        # 计算每个国家的 ℋ_k 分布
        hk2 = 0
        hk1 = 0
        hk0 = 0
        total = 0
        
        for country in sampled:
            series = sample_df.loc[country].dropna()
            d2 = compute_second_derivative(series)
            for val in d2.dropna():
                hk = classify_hk(val)
                if hk == 2:
                    hk2 += 1
                elif hk == 1:
                    hk1 += 1
                else:
                    hk0 += 1
                total += 1
        
        if total > 0:
            hk2_counts.append(hk2 / total)
            hk1_counts.append(hk1 / total)
            hk0_counts.append(hk0 / total)
    
    def ci(arr, alpha=0.05):
        lower = np.percentile(arr, alpha/2 * 100)
        upper = np.percentile(arr, (1 - alpha/2) * 100)
        return lower, upper
    
    return {
        'hk2_mean': np.mean(hk2_counts),
        'hk2_ci': ci(hk2_counts),
        'hk1_mean': np.mean(hk1_counts),
        'hk1_ci': ci(hk1_counts),
        'hk0_mean': np.mean(hk0_counts),
        'hk0_ci': ci(hk0_counts),
        'n_bootstrap': n_bootstrap
    }


def main():
    print("Fc ℋ_k Bootstrap 检验")
    print("=" * 50)
    
    df = load_tfr_panel()
    print(f"加载数据: {df.shape[0]} 国 × {df.shape[1]} 年")
    
    results = bootstrap_hk_distribution(df)
    
    print(f"\nBootstrap 次数: {results['n_bootstrap']}")
    print(f"\nℋ_k(2) 强触发: {results['hk2_mean']:.3f} "
          f"(95% CI: {results['hk2_ci'][0]:.3f} - {results['hk2_ci'][1]:.3f})")
    print(f"ℋ_k(1) 弱触发: {results['hk1_mean']:.3f} "
          f"(95% CI: {results['hk1_ci'][0]:.3f} - {results['hk1_ci'][1]:.3f})")
    print(f"ℋ_k(0) 无触发: {results['hk0_mean']:.3f} "
          f"(95% CI: {results['hk0_ci'][0]:.3f} - {results['hk0_ci'][1]:.3f})")


if __name__ == "__main__":
    main()
