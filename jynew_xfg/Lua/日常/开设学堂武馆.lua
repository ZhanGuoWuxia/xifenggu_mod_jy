show_stage("bg_15.png", "虎焰堂")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(1200, 75)
situ:face_right()
qiliuge:setPos(900, 75)
qiliuge:face_right()

if not has_flag("已解锁开设学堂武馆") then
    situ:flip()
    situ:say("六哥，我们虎焰堂要发展壮大，还必须要重视教育。")
    qiliuge:say("是啊，掌门，再穷也不能穷教育，我们可以开设学堂武馆，让更多的人来想学习文化和武术。")
    situ:say("六哥，你说的对，我们就开设学堂武馆吧。")
    qiliuge:say("掌门，投资学堂武馆需要不停地投入银两，但是学堂武馆可以带来更多的发展。")
    
    set_flag("已解锁开设学堂武馆")
else
    situ:flip()

end