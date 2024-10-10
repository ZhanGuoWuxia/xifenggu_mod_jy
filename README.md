# 金庸乱斗

本项目是steam游戏《息风谷战略》的一个开源MOD，旨在实现一个玩家可以扮演“小虾米”开设门派，与各武侠门派争霸一统江湖的体验。

![0a32ebc9-b7ac-4a15-9736-149a77515514](https://github.com/user-attachments/assets/4fa024cf-a4ee-4186-a927-11dcaa093936)
![image](https://github.com/user-attachments/assets/5fa4cce7-c821-45ce-8357-9e94b5fb22e3)
![image](https://github.com/user-attachments/assets/7f669076-d160-4b75-a2ee-f5e33a36cb4f)


## 设定构想

- 玩家可以招募门派弟子，发展门派地盘势力
- 攻略下地盘后可以进行搜索，满足条件后从而触发各个地盘上的随机或隐藏事件
- 门派间会彼此进行征伐，玩家需要扮演掌门合纵连横
- 有大量的隐藏队友、神兵利器、武学心法可以获得

## 当前开发进度

- [x] 开发脚手架环境配置（配置包打包环境、lua开发环境等）
- [x] 游戏地图与势力设计和配置
- [x] 门派通用AI，可以发展、结盟、互相攻击
- [x] 地盘争夺
- [ ] 各门派的独立AI
- [ ] 各个门派灭派触发的独立事件
- [x] 开场引入剧情和选择出生地点
- [ ] 基于算法的随机势力生成
- [x] 武学基础配置
- [ ] 武学招式配置，美术资产调整
- [ ] 战斗和成长数值调整
- [ ] 配乐调整
- [x] 地点探索行为框架
- [ ] 对所有地点的探索进行细致设计和配置
- [ ] 可入队定制侠客（如乔峰、段誉等大侠），并加入专属剧情
- [ ] 加入更多的武侠故事小事件
- [ ] MOD游戏结局


## 发布更新

- 欢迎感兴趣的小伙伴一起参与，提交PULL REQUEST
- 本MOD将不定期更新发布到《息风谷战略》的MOD商店


## 开发环境简介

<pre>
./Design 设计文档（目前只包含地图设计）

./Data 配置表和工具
./Data/Datas 配置表excel文件，可以修改游戏的核心配置
./Data/gen_json_data.bat  配置表打包（将配置表打包到MOD工程的Data/*.json）

./jynew_xfg MOD工程
./jynew_xfg/Lua 脚本目录
  /mod_init  MOD载入入口
  /jy_序.lua   游戏入口脚本
  /AI/menpai/jy_menpai_ai.lua   门派AI逻辑
  /Area/jy_探索.lua   地点探索行为逻辑
</pre>

### 搭建开发环境
1. 下载《息风谷战略》
2. 进入MOD编辑器，打开MOD，载入工程到 ./jynew_xfg
3. 编辑MOD的配置表 ./Data/Datas 并运行打包程序 ./Data/gen_json_data.bat生成MOD中的json配置文件
4. 编辑MOD目录的各种配置和Lua脚本
5. 启动调试MOD


## 开发者群

QQ 897933161 

## 资源引用和说明
本项目使用了[《群侠传，启动！》](https://github.com/jynew/jynew)的美术素材，并获得授权
但不可在其他任意处进行再次商用
