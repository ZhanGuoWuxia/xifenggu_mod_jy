# 金庸乱斗

本项目是steam游戏《息风谷战略》的一个开源MOD，旨在实现一个玩家可以扮演“小虾米”开设门派，与各武侠门派争霸一统江湖的体验。

## 设想

- 玩家可以招募门派弟子，发展门派地盘势力
- 攻略下地盘后可以进行搜索，满足条件后从而触发各个地盘上的随机或隐藏事件
- 门派间会彼此进行征伐，玩家需要扮演掌门合纵连横
- 有大量的隐藏队友、神兵利器、武学心法可以获得

## 发布更新

- 欢迎感兴趣的小伙伴一起参与，提交PULL REQUEST
- 本MOD将不定期更新发布到《息风谷战略》的MOD商店


## 开发环境简介

./Design 设计文档（目前只包含地图设计）

./Data 配置表和工具
./Data/Datas 配置表excel文件，可以修改游戏的核心配置
./Data/gen_json_data.bat  配置表打包（将配置表打包到MOD工程的Data/*.json）

./jynew_xfg MOD工程
./jynew_xfg/Lua 脚本目录
  mod_init  MOD载入入口
  jy_序.lua   游戏入口脚本
  /AI/menpai/jy_menpai_ai.lua   门派AI逻辑
  /Area/jy_探索.lua   地点探索行为逻辑
  

### 搭建开发环境
1. 下载《息风谷战略》
2. 进入MOD编辑器，打开MOD，载入目录到 ./jynew_xfg
3. 编辑配置表 ./Data/Datas 
4. 运行打包程序 ./Data/gen_json_data.bat
5. 启动调试MOD


## 开发者群

QQ 897933161 

## 资源引用和说明
本项目使用了《群侠传，启动！》（https://github.com/jynew/jynew）的美术素材，并获得授权
但不可在其他任意处进行再次商用