# Fc v9.6.8 附录 G：A6 寂灭定理实证协议

【G.1 同义反复诊断】
v9.6.7原表述："全球TFR下降验证A6寂灭定理"——A6寂灭操作化定义即TFR下降，构成"TFR⇒TFR"同义反复。

【G.2 L1/L2 双层指标体系】
L1 直接指标（即定理本身，仅用于诊断）：
  TFR下降趋势 + 二阶导数为负
  用途：仅用于诊断A6是否进入寂灭，不得用于"验证"定理

L2 独立指标（v9.6.8新增，用于验证）：
  L2-a：父系命名占比下降率（新生儿冠父姓比例的代际变化）
  L2-b：宗族纪念活动规模（族谱编修频次/祠堂运营率/清明祭祖参与率）
  L2-c：A6心理强度调查（WVS"延续家族血脉重要性"同意率代际变化）
  L2-d：男女不婚率剪刀差（男性终身未婚率-女性终身未婚率差值变化）
  L2-e：代际资助率结构变化（父母对子代住房/婚姻资助的性别分配差异）

验证规则：
  事前预测："TFR进入下降通道t年后，L2-a/b/c/d/e中至少2项出现同向变化"
  反例：TFR下降但L2全部稳定→定理需修订（"寂灭"被推迟或不发生）；L2下降但TFR稳定→定理需修订（"寂灭"早于TFR信号）

【G.3 可搜索数据源】
L2-a 父系命名占比下降率：
  西班牙INE（2000年法律允许选择姓氏顺序，2017年改为父母协商一致）
  冰岛Statistics Iceland（传统父名制→近年母名制选择上升）
  瑞典SCB、日本厚生劳动省、韩国Statistics Korea
  中国：户籍登记中冠姓数据不公开发布，但学术研究存在（李银河等）[LIMITED-ACCESS]
  搜索建议："surname inheritance trends [country]" / "matronymic adoption rate" / "夫妇別姓 統計"

L2-b 宗族纪念活动规模：
  中国：宗族文化研究（刘志伟、麻国庆等学者跨年研究）[ACADEMIC]
  韩国：宗中财团（종중）活动规模、Chuseok祭祀参与率——韩国统计厅家庭调查[PUBLIC]
  日本：先祖供養市场规模——总务省家计调查中"祭祀费"项[PUBLIC]
  搜索建议："ancestor worship participation rate trend" / "lineage genealogy compilation statistics" / "祭祖参与 性别 代际"

L2-c A6心理强度调查：
  World Values Survey (WVS)：跨国跨年（1981-2024）问卷含家族重要性、生育动机条目[PUBLIC]
  East Asian Social Survey (EASS)：中日韩台跨国家庭调查[PUBLIC]
  中国综合社会调查(CGSS)：含家庭观念条目[PUBLIC，部分可访问]
  Pew Research Global Attitudes：跨国家庭价值观调查[PUBLIC]
  操作化条目建议：
    "It is one's duty towards society to have children"同意率
    "Family is very important in life"同意率变化方向
    "Children should be proud of parents' achievements"（代际等级度量）
  搜索建议："World Values Survey family importance trend [country]" / "生育动机 代际差异 调查"

L2-d 男女不婚率剪刀差：
  日本：50岁未婚率（男28%/女18%，2020）——总务省国势调查[PUBLIC]
  中国：[CALIBRATE]全国性别失衡导致男性不婚率结构性高，需控制出生性别比
  韩国：婚姻统计——Statistics Korea[PUBLIC]
  OECD Family Database：跨国婚姻状况数据[PUBLIC]
  A6寂灭信号判读：男>女且差值扩大→A6寂灭（男性退出婚姻市场）；男<女或差值缩小→A6维持
  搜索建议："lifetime singlehood rate by sex [country]" / "生涯未婚率 性別 推移"

L2-e 代际资助率结构变化：
  中国CFPS[PUBLIC，需注册] / 韩国KLoSA[PUBLIC] / 日本JHPS[PUBLIC] / 欧洲SHARE[PUBLIC]
  搜索建议："parental housing assistance gender of child" / "intergenerational transfer son daughter [country]"

【G.4 双层指标的事前可证伪化范例】
登记日期：2026-XX-XX
登记commit hash：[待v9.7.0 git仓库化后填写]

命题 P-A6-1（事前预测）：
  韩国TFR自2018进入下降通道（L1）。
  CCST+Fc A6寂灭定理预测：到2028年（10年窗口），L2-c（WVS家族重要性同意率）和L2-d（男女不婚率剪刀差）中至少2项将出现≥10%的同向变化。

证伪条件：
  (1)2028年WVS韩国"家族重要性"同意率变化<5%且
  (2)男女不婚率剪刀差变化<5%且
  (3)其他L2指标也无≥10%变化
  →证伪A6寂灭定理在韩国的适用

阈值锚定（按检查项7）：
  10%阈值在登记时确定，2028年观测后不得调整。
  若数据落入5-10%区间，标记[CALIBRATE]，不计入证伪也不计入验证。
