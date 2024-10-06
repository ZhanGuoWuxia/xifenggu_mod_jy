local buff = buff_define("云隐月影")


--每当成功闪避敌人的攻击时，看破其攻击套路，使自身提升5%免伤
function buff:OnDodge(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "云隐月影", "云隐月影计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "云隐月影", "云隐月影计数", cnt)

    if args.buff then
        args.buff:SetStat("被伤害修正", 0.05 * cnt)
    end
end

return buff